// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/DivisionByZeroPass/DivisionByZeroPass.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/ILogger.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <functional>
#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{
const char* const DivisionByZeroPass::EC_REPORT_FUNCTION      = "__qir__report_error_value";
const char* const DivisionByZeroPass::EC_VARIABLE_NAME        = "__qir__error_code";
int64_t const     DivisionByZeroPass::EC_QIR_DIVISION_BY_ZERO = 1100;

DivisionByZeroPass::DivisionByZeroPass(
    SpecConfiguration const& spec)
  : spec_{spec}
{
}

llvm::PreservedAnalyses DivisionByZeroPass::run(llvm::Module& module, llvm::ModuleAnalysisManager& /*mam*/)
{
    llvm::IRBuilder<> builder(module.getContext());
    module.getOrInsertGlobal(EC_VARIABLE_NAME, builder.getInt64Ty());
    error_variable_ = module.getNamedGlobal(EC_VARIABLE_NAME);
    error_variable_->setLinkage(llvm::GlobalValue::InternalLinkage);
    error_variable_->setInitializer(builder.getInt64(0));
    error_variable_->setConstant(false);

    for (auto& function : module)
    {
        for (auto& block : function)
        {
            for (auto& instr : block)
            {
                auto* sdiv = llvm::dyn_cast<llvm::SDivOperator>(&instr);
                if (sdiv)
                {
                    // Injecting error code updates
                    auto op2 = instr.getOperand(1);

                    auto const& denom_nonzero_block = instr.getParent();
                    auto denom_zero_block = denom_nonzero_block->splitBasicBlock(&instr, "denominator_is_zero", true);
                    auto current_block =
                        denom_zero_block->splitBasicBlock(denom_zero_block->getTerminator(), "-INTERMEDIATE-", true);
                    current_block->takeName(denom_nonzero_block);
                    denom_nonzero_block->setName("denominator_is_nonzero");

                    builder.SetInsertPoint(current_block->getTerminator());
                    auto cmp = builder.CreateICmp(llvm::CmpInst::Predicate::ICMP_EQ, op2, builder.getInt64(0));
                    auto old_terminator = current_block->getTerminator();
                    llvm::BranchInst::Create(denom_zero_block, denom_nonzero_block, cmp, current_block);
                    old_terminator->eraseFromParent();

                    raiseError(EC_QIR_DIVISION_BY_ZERO, module, denom_zero_block->getTerminator());
                }
            }
        }
    }

    // Checking error codes at end
    for (auto& function : module)
    {
        // entry-point-attr
        if (function.hasFnAttribute(spec_.entryPointAttr()))
        {
            std::vector<llvm::BasicBlock*> exit_blocks;
            for (auto& block : function)
            {
                auto last = block.getTerminator();
                if (last && llvm::dyn_cast<llvm::ReturnInst>(last))
                {
                    exit_blocks.push_back(&block);
                }
            }
            for (auto block : exit_blocks)
            {
                auto error_exit_block = block->splitBasicBlock(block->getTerminator(), "error_exit", false);
                auto regular_exit_block =
                    error_exit_block->splitBasicBlock(error_exit_block->getTerminator(), "regular_exit", false);

                builder.SetInsertPoint(block->getTerminator());
                llvm::LoadInst* load = builder.CreateLoad(builder.getInt64Ty(), error_variable_);
                auto            cmp  = builder.CreateICmp(llvm::CmpInst::Predicate::ICMP_EQ, load, builder.getInt64(0));
                auto            old_terminator = block->getTerminator();
                llvm::BranchInst::Create(regular_exit_block, error_exit_block, cmp, block);
                old_terminator->eraseFromParent();

                builder.SetInsertPoint(error_exit_block->getTerminator());

                auto                      fnc = module.getFunction(EC_REPORT_FUNCTION);
                std::vector<llvm::Value*> arguments;
                arguments.push_back(load);

                if (!fnc)
                {
                    std::vector<llvm::Type*> types;
                    types.resize(arguments.size());
                    for (uint64_t i = 0; i < types.size(); ++i)
                    {
                        types[i] = arguments[i]->getType();
                    }

                    auto return_type = llvm::Type::getVoidTy(module.getContext());

                    llvm::FunctionType* fnc_type = llvm::FunctionType::get(return_type, types, false);
                    fnc = llvm::Function::Create(fnc_type, llvm::Function::ExternalLinkage, EC_REPORT_FUNCTION, module);
                }

                builder.CreateCall(fnc, arguments);
            }
        }
    }

    return llvm::PreservedAnalyses::none();
}

void DivisionByZeroPass::raiseError(int64_t error_code, llvm::Module& module, llvm::Instruction* instr)
{
    llvm::IRBuilder<> builder(module.getContext());
    auto const&       ecc_set_block = instr->getParent();
    auto              ecc_not_set_block    = ecc_set_block->splitBasicBlock(instr, "ecc_not_set", true);
    auto              current_block = ecc_not_set_block->splitBasicBlock(ecc_not_set_block->getTerminator(), "-INTERMEDIATE-", true);
    current_block->takeName(ecc_set_block);
    ecc_set_block->setName("ecc_set");

    builder.SetInsertPoint(current_block->getTerminator());
    llvm::LoadInst* load = builder.CreateLoad(builder.getInt64Ty(), error_variable_);
    auto            cmp  = builder.CreateICmp(llvm::CmpInst::Predicate::ICMP_EQ, load, builder.getInt64(0));

    auto old_terminator = current_block->getTerminator();
    llvm::BranchInst::Create(ecc_not_set_block, ecc_set_block, cmp, current_block);
    old_terminator->eraseFromParent();

    builder.SetInsertPoint(ecc_not_set_block->getTerminator());
    builder.CreateStore(builder.getInt64(error_code), error_variable_);
}

bool DivisionByZeroPass::isRequired()
{
    return true;
}
} // namespace microsoft::quantum

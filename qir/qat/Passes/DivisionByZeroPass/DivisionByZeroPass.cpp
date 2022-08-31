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

llvm::PreservedAnalyses DivisionByZeroPass::run(llvm::Module& module, llvm::ModuleAnalysisManager& /*mam*/)
{
    llvm::IRBuilder<> builder(module.getContext());
    module.getOrInsertGlobal(EC_VARIABLE_NAME, builder.getInt64Ty());
    error_variable_ = module.getNamedGlobal(EC_VARIABLE_NAME);
    error_variable_->setLinkage(llvm::GlobalValue::InternalLinkage);
    error_variable_->setInitializer(builder.getInt64(0));
    error_variable_->setConstant(false);

    std::vector<llvm::Instruction*> instructions;
    for (auto& function : module)
    {
        for (auto& block : function)
        {
            for (auto& instr : block)
            {
                auto* udiv = llvm::dyn_cast<llvm::SDivOperator>(&instr);
                if (udiv)
                {
                    instructions.push_back(&instr);
                }
            }
        }
    }

    // Injecting error code updates
    for (auto instr : instructions)
    {
        auto op2 = instr->getOperand(1);

        auto const& final_block = instr->getParent();
        auto        if_block    = final_block->splitBasicBlock(instr, "if_denominator_is_zero", true);
        auto        start_block = if_block->splitBasicBlock(if_block->getTerminator(), "-INTERMEDIATE-", true);
        start_block->takeName(final_block);
        final_block->setName("after_zero_check");

        builder.SetInsertPoint(start_block->getTerminator());
        auto cmp            = builder.CreateICmp(llvm::CmpInst::Predicate::ICMP_EQ, op2, builder.getInt64(0));
        auto old_terminator = start_block->getTerminator();
        llvm::BranchInst::Create(if_block, final_block, cmp, start_block);
        old_terminator->eraseFromParent();

        raiseError(EC_QIR_DIVISION_BY_ZERO, module, if_block->getTerminator());
    }

    // Checking error codes at end of
    llvm::Function*                entry = nullptr;
    std::vector<llvm::BasicBlock*> exit_blocks;
    for (auto& function : module)
    {
        if (function.hasFnAttribute("EntryPoint"))
        {
            entry = &function;
            for (auto& block : function)
            {
                auto last = block.getTerminator();
                if (last && llvm::dyn_cast<llvm::ReturnInst>(last))
                {
                    exit_blocks.push_back(&block);
                }
            }
            break;
        }
    }

    if (entry)
    {
        for (auto start_block : exit_blocks)
        {
            auto if_block    = start_block->splitBasicBlock(start_block->getTerminator(), "if_error_occurred", false);
            auto final_block = if_block->splitBasicBlock(if_block->getTerminator(), "exit_block", false);

            builder.SetInsertPoint(start_block->getTerminator());
            llvm::LoadInst* load = builder.CreateLoad(builder.getInt64Ty(), error_variable_);
            auto            cmp  = builder.CreateICmp(llvm::CmpInst::Predicate::ICMP_NE, load, builder.getInt64(0));
            auto            old_terminator = start_block->getTerminator();
            llvm::BranchInst::Create(if_block, final_block, cmp, start_block);
            old_terminator->eraseFromParent();

            builder.SetInsertPoint(if_block->getTerminator());

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

    return llvm::PreservedAnalyses::none();
}

void DivisionByZeroPass::raiseError(int64_t error_code, llvm::Module& module, llvm::Instruction* instr)
{
    llvm::IRBuilder<> builder(module.getContext());
    auto const&       final_block = instr->getParent();
    auto              if_block    = final_block->splitBasicBlock(instr, "if_ecc_not_set", true);
    auto              start_block = if_block->splitBasicBlock(if_block->getTerminator(), "-INTERMEDIATE-", true);
    start_block->takeName(final_block);
    final_block->setName("ecc_set_finally");

    builder.SetInsertPoint(start_block->getTerminator());
    llvm::LoadInst* load = builder.CreateLoad(builder.getInt64Ty(), error_variable_);
    auto            cmp  = builder.CreateICmp(llvm::CmpInst::Predicate::ICMP_EQ, load, builder.getInt64(0));

    auto old_terminator = start_block->getTerminator();
    llvm::BranchInst::Create(if_block, final_block, cmp, start_block);
    old_terminator->eraseFromParent();

    builder.SetInsertPoint(if_block->getTerminator());
    builder.CreateStore(builder.getInt64(error_code), error_variable_);
}

bool DivisionByZeroPass::isRequired()
{
    return true;
}
} // namespace microsoft::quantum

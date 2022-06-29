// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "DivisionByZeroPass/DivisionByZeroPass.hpp"
#include "Logging/ILogger.hpp"
#include "QatTypes/QatTypes.hpp"

#include "Llvm/Llvm.hpp"

#include <functional>
#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{

llvm::PreservedAnalyses DivisionByZeroPass::run(llvm::Module& module, llvm::ModuleAnalysisManager& /*mam*/)
{
    llvm::IRBuilder<> builder(module.getContext());
    module.getOrInsertGlobal("__qir__error_code", builder.getInt64Ty());
    error_variable_ = module.getNamedGlobal("__qir__error_code");
    error_variable_->setLinkage(llvm::GlobalValue::InternalLinkage);
    error_variable_->setAlignment(llvm::Align(8));
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
    for (auto instr : instructions)
    {

        auto op2 = instr->getOperand(1);

        auto const& final_block = instr->getParent();
        auto        if_block    = final_block->splitBasicBlock(instr, "if_denominator_is_zero", true);
        auto        start_block = if_block->splitBasicBlock(if_block->getTerminator(), "-INTERMEDIATE-", true);
        start_block->takeName(final_block);
        final_block->setName("after_zero_check");

        llvm::errs() << *op2 << "\n";

        builder.SetInsertPoint(start_block->getTerminator());
        auto cmp            = builder.CreateICmp(llvm::CmpInst::Predicate::ICMP_EQ, op2, builder.getInt64(0));
        auto old_terminator = start_block->getTerminator();
        auto new_terminator = llvm::BranchInst::Create(if_block, final_block, cmp, start_block);
        old_terminator->eraseFromParent();

        raiseError(1338, module, if_block->getTerminator());
    }

    llvm::errs() << module << "\n";
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
    llvm::LoadInst* load = builder.CreateLoad(error_variable_);
    auto            cmp  = builder.CreateICmp(llvm::CmpInst::Predicate::ICMP_EQ, load, builder.getInt64(0));

    auto old_terminator = start_block->getTerminator();
    auto new_terminator = llvm::BranchInst::Create(if_block, final_block, cmp, start_block);
    old_terminator->eraseFromParent();

    builder.SetInsertPoint(if_block->getTerminator());
    llvm::StoreInst* store = builder.CreateStore(builder.getInt64(error_code), error_variable_);
}

bool DivisionByZeroPass::isRequired()
{
    return true;
}
} // namespace microsoft::quantum
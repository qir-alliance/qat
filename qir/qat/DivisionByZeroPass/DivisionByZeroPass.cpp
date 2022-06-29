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
    llvm::GlobalVariable* error_variable = module.getNamedGlobal("__qir__error_code");
    error_variable->setLinkage(llvm::GlobalValue::InternalLinkage);
    error_variable->setAlignment(llvm::Align(8));
    error_variable->setInitializer(builder.getInt64(0));
    error_variable->setConstant(false);

    std::vector<llvm::Instruction*> instructions;
    for (auto& function : module)
    {
        for (auto& block : function)
        {
            for (auto& instr : block)
            {
                instructions.push_back(&instr);
            }
        }
    }
    for (auto instr : instructions)
    {
        auto const& final_block = instr->getParent();
        auto        if_block    = final_block->splitBasicBlock(instr, "if_block", true);
        auto        start_block = if_block->splitBasicBlock(if_block->getTerminator(), "-INTERMEDIATE-", true);
        start_block->takeName(final_block);
        final_block->setName("then");

        builder.SetInsertPoint(start_block->getTerminator());
        llvm::LoadInst* load = builder.CreateLoad(error_variable);
        auto            cmp  = builder.CreateICmp(llvm::CmpInst::Predicate::ICMP_EQ, load, builder.getInt64(0));

        auto old_terminator = start_block->getTerminator();
        auto new_terminator = llvm::BranchInst::Create(if_block, final_block, cmp, start_block);
        old_terminator->eraseFromParent();

        builder.SetInsertPoint(if_block->getTerminator());
        llvm::StoreInst* store = builder.CreateStore(builder.getInt64(1337), error_variable);
    }

    llvm::errs() << module << "\n";
    return llvm::PreservedAnalyses::none();
}

bool DivisionByZeroPass::isRequired()
{
    return true;
}
} // namespace microsoft::quantum
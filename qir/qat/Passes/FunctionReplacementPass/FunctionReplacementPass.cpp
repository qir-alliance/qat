// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/FunctionReplacementPass/FunctionReplacementPass.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/FunctionReplacementPass/FunctionReplacementAnalysisPass.hpp"

#include <fstream>
#include <iostream>

namespace microsoft::quantum
{

bool FunctionReplacementPass::isRequired()
{
    return true;
}

llvm::PreservedAnalyses FunctionReplacementPass::run(llvm::Module& module, llvm::ModuleAnalysisManager& mam)
{
    llvm::IRBuilder<> builder(module.getContext());
    auto&             result = mam.getResult<FunctionReplacementAnalysisPass>(module);

    for (auto& call_instr : result.calls_to_replace)
    {
        auto function = call_instr->getCalledFunction();
        auto it       = result.functions_to_replace.find(function);

        if (function == nullptr || it == result.functions_to_replace.end())
        {
            continue;
        }

        std::vector<llvm::Value*> arguments;
        for (std::size_t i = 0; i < call_instr->arg_size(); ++i)
        {
            arguments.emplace_back(call_instr->getArgOperand(i));
        }

        builder.SetInsertPoint(llvm::dyn_cast<llvm::Instruction>(call_instr));
        auto new_call = builder.CreateCall(it->second, arguments);
        new_call->takeName(call_instr);
        call_instr->replaceAllUsesWith(new_call);
        call_instr->eraseFromParent();
    }

    return llvm::PreservedAnalyses::none();
}

void FunctionReplacementPass::setLogger(ILoggerPtr logger)
{
    logger_ = std::move(logger);
}

} // namespace microsoft::quantum

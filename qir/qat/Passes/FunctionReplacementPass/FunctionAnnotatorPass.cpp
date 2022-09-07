// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/FunctionReplacementPass/FunctionAnnotatorPass.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/FunctionReplacementPass/FunctionReplacementAnalysisPass.hpp"

#include <fstream>
#include <iostream>

namespace microsoft::quantum
{

bool FunctionAnnotatorPass::isRequired()
{
    return true;
}

llvm::PreservedAnalyses FunctionAnnotatorPass::run(llvm::Module& module, llvm::ModuleAnalysisManager& /*mam*/)
{
    bool changed     = false;
    auto annotations = config_.injectedAnnotations();

    // Removing all function call attributes
    if (config_.shouldRemoveCallAttributes())
    {
        for (auto& function : module)
        {
            for (auto& block : function)
            {
                for (auto& instr : block)
                {
                    auto call_instr = llvm::dyn_cast<llvm::CallBase>(&instr);
                    if (!call_instr)
                    {
                        continue;
                    }

                    call_instr->setAttributes({});
                    changed = true;
                }
            }
        }
    }

    // Adding replaceWith as requested
    for (auto& function : module)
    {
        auto name = static_cast<String>(function.getName());

        // Adding annotation if requested
        auto it = annotations.find(name);
        if (it == annotations.end())
        {
            continue;
        }

        function.addFnAttr("replaceWith", it->second);
        changed = true;
    }

    if (changed)
    {
        return llvm::PreservedAnalyses::none();
    }

    return llvm::PreservedAnalyses::all();
}

void FunctionAnnotatorPass::setLogger(ILoggerPtr logger)
{
    logger_ = std::move(logger);
}

} // namespace microsoft::quantum

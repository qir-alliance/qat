// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/RemoveNonEntrypointFunctions/RemoveNonEntrypointFunctionsPass.hpp"

#include "qir/qat/Llvm/Llvm.hpp"

#include <fstream>
#include <iostream>

namespace microsoft::quantum
{

RemoveNonEntrypointFunctionsPass::RemoveNonEntrypointFunctionsPass(
    RemoveNonEntrypointFunctionsPassConfiguration const& cfg,
    ILoggerPtr const&                                    logger)
  : config_{cfg}
  , logger_{logger}
{
}

llvm::PreservedAnalyses RemoveNonEntrypointFunctionsPass::run(
    llvm::Module& module,
    llvm::ModuleAnalysisManager& /*mam*/)
{

    std::vector<llvm::Function*> deletables;
    auto                         entry_point_attr = config_.entryPointAttr();
    for (auto& function : module)
    {

        if (function.isDeclaration())
        {
            continue;
        }

        if (function.hasFnAttribute(entry_point_attr))
        {
            continue;
        }

        deletables.push_back(&function);
    }

    for (auto& x : deletables)
    {
        if (x->use_empty())
        {
            x->eraseFromParent();
        }
    }

    return llvm::PreservedAnalyses::none();
}

bool RemoveNonEntrypointFunctionsPass::isRequired()
{
    return true;
}

} // namespace microsoft::quantum

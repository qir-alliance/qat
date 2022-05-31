// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "PreTransformTrimming/PreTransformTrimmingPass.hpp"

#include "Llvm/Llvm.hpp"

#include <fstream>
#include <iostream>

namespace microsoft
{
namespace quantum
{

    PreTransformTrimmingPass::PreTransformTrimmingPass(
        PreTransformTrimmingPassConfiguration const& cfg,
        ILoggerPtr const&                            logger)
      : config_{cfg}
      , logger_{logger}
    {
    }

    llvm::PreservedAnalyses PreTransformTrimmingPass::run(llvm::Module& module, llvm::ModuleAnalysisManager& /*mam*/)
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

    bool PreTransformTrimmingPass::isRequired()
    {
        return true;
    }

} // namespace quantum
} // namespace microsoft

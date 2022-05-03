// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "PreTransformValidation/PreTransformValidationPass.hpp"

#include "Llvm/Llvm.hpp"

#include <fstream>
#include <iostream>

namespace microsoft
{
namespace quantum
{

    PreTransformValidationPass::PreTransformValidationPass(
        PreTransformValidationPassConfiguration const& cfg,
        ILoggerPtr const&                              logger)
      : config_{cfg}
      , logger_{logger}
    {
    }

    llvm::PreservedAnalyses PreTransformValidationPass::run(llvm::Module& module, llvm::ModuleAnalysisManager& /*mam*/)
    {
        uint64_t function_count{0};

        for (auto& function : module)
        {

            if (function.isDeclaration())
            {
                continue;
            }

            ++function_count;
            if (config_.requireStraightLineCode())
            {
                if (function_count > 1)
                {
                    if (logger_)
                    {
                        logger_->setLocationFromValue(&function.getEntryBlock());
                        logger_->error("Expected straight line code, but multiple functions present.");
                    }
                    else
                    {
                        throw std::runtime_error("Expected straight line code, but multiple functions present.");
                    }
                }
            }

            uint64_t block_count{0};
            for (auto& block : function)
            {
                ++block_count;
                if (block_count > 1)
                {
                    if (logger_)
                    {
                        logger_->setLocationFromValue(&block);
                        logger_->error("Expected straight line code, but multiple blocks present.");
                    }
                    else
                    {
                        throw std::runtime_error("Expected straight line code, but multiple blocks present.");
                    }
                }
            }
        }

        return llvm::PreservedAnalyses::all();
    }

    bool PreTransformValidationPass::isRequired()
    {
        return true;
    }

} // namespace quantum
} // namespace microsoft

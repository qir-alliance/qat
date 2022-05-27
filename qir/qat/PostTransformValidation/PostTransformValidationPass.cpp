// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "PostTransformValidation/PostTransformValidationPass.hpp"

#include "Llvm/Llvm.hpp"

#include <fstream>
#include <iostream>

namespace microsoft
{
namespace quantum
{

    PostTransformValidationPass::PostTransformValidationPass(
        PostTransformValidationPassConfiguration const& cfg,
        ILoggerPtr const&                               logger)
      : config_{cfg}
      , logger_{logger}
    {
    }

    llvm::PreservedAnalyses PostTransformValidationPass::run(llvm::Module& module, llvm::ModuleAnalysisManager& /*mam*/)
    {
        if (config_.requireStraightLineCode())
        {
            uint64_t function_count{0};

            for (auto& function : module)
            {

                if (function.isDeclaration())
                {
                    continue;
                }

                ++function_count;

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
        }

        return llvm::PreservedAnalyses::all();
    }

    bool PostTransformValidationPass::isRequired()
    {
        return true;
    }

} // namespace quantum
} // namespace microsoft

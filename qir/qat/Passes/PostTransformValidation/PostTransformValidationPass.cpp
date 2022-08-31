// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/PostTransformValidation/PostTransformValidationPass.hpp"

#include "qir/qat/Llvm/Llvm.hpp"

#include <fstream>
#include <iostream>

namespace microsoft::quantum
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
                    logger_->errorExpectedStraightLineCodeMultipleFunctions(&function.getEntryBlock());
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
                        logger_->errorExpectedStraightLineCodeMultipleBlocks(&block);
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

} // namespace microsoft::quantum

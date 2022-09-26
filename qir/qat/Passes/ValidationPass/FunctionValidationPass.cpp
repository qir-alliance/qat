// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/ValidationPass/FunctionValidationPass.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/ILogger.hpp"
#include "qir/qat/Passes/StaticResourceComponent/AllocationAnalysisPass.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <functional>
#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{

FunctionValidationPass::FunctionValidationPass(TargetProfileConfiguration const& cfg, ILoggerPtr const& logger)
  : config_{cfg}
  , logger_{logger}
{
}

llvm::PreservedAnalyses FunctionValidationPass::run(llvm::Function& function, llvm::FunctionAnalysisManager& fam)
{
    auto& function_details = fam.getResult<AllocationAnalysisPass>(function);

    if (config_.requiresQubits() && function_details.usage_qubit_counts == 0)
    {
        logger_->errorNoQubitsPresent(&function, config_.adaptorName());
    }

    if (config_.requiresResults() && function_details.usage_result_counts == 0)
    {
        logger_->errorNoResultsPresent(&function, config_.adaptorName());
    }

    for (auto& block : function)
    {
        for (auto& instr : block)
        {
            for (auto& op : instr.operands())
            {
                auto poison = llvm::dyn_cast<llvm::PoisonValue>(op);
                auto undef  = llvm::dyn_cast<llvm::UndefValue>(op);

                if (poison && !config_.allowPoison())
                {
                    logger_->errorPoisonNotAllowed(config_.adaptorName(), &instr);
                }
                else if (undef && !config_.allowUndef())
                {
                    logger_->errorUndefNotAllowed(config_.adaptorName(), &instr);
                }
            }
        }
    }

    return llvm::PreservedAnalyses::all();
}

bool FunctionValidationPass::isRequired()
{
    return true;
}
} // namespace microsoft::quantum

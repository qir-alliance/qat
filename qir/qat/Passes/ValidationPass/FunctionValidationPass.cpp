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

FunctionValidationPass::FunctionValidationPass(
    TargetProfileConfiguration const& profile_config,
    TargetQisConfiguration const&     qis_config,
    ILoggerPtr const&                 logger)
  : profile_config_{profile_config}
  , qis_config_{qis_config}
  , logger_{logger}
{
}

llvm::PreservedAnalyses FunctionValidationPass::run(llvm::Function& function, llvm::FunctionAnalysisManager& fam)
{
    auto& function_details = fam.getResult<AllocationAnalysisPass>(function);

    if (qis_config_.requiresQubits() && function_details.usage_qubit_counts == 0)
    {
        logger_->errorNoQubitsPresent(&function, profile_config_.targetName());
    }

    if (qis_config_.requiresResults() && function_details.usage_result_counts == 0)
    {
        logger_->errorNoResultsPresent(&function, profile_config_.targetName());
    }

    for (auto& block : function)
    {
        for (auto& instr : block)
        {
            for (auto& op : instr.operands())
            {
                auto poison = llvm::dyn_cast<llvm::PoisonValue>(op);
                auto undef  = llvm::dyn_cast<llvm::UndefValue>(op);

                if (poison && !profile_config_.allowPoison())
                {
                    logger_->errorPoisonNotAllowed(profile_config_.targetName(), &instr);
                }
                else if (undef && !profile_config_.allowUndef())
                {
                    logger_->errorUndefNotAllowed(profile_config_.targetName(), &instr);
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

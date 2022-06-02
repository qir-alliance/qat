// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Logging/ILogger.hpp"
#include "Profile/Profile.hpp"
#include "QatTypes/QatTypes.hpp"
#include "StaticResourceComponent/AllocationAnalysisPass.hpp"
#include "ValidationPass/FunctionValidationPass.hpp"

#include "Llvm/Llvm.hpp"

#include <functional>
#include <unordered_map>
#include <vector>

namespace microsoft
{
namespace quantum
{

    FunctionValidationPass::FunctionValidationPass(ValidationPassConfiguration const& cfg, ILoggerPtr const& logger)
      : config_{cfg}
      , logger_{logger}
    {
    }

    llvm::PreservedAnalyses FunctionValidationPass::run(llvm::Function& function, llvm::FunctionAnalysisManager& fam)
    {
        auto& function_details = fam.getResult<AllocationAnalysisPass>(function);

        if (config_.requiresQubits() && function_details.usage_qubit_counts == 0)
        {
            logger_->setLocationFromValue(&function);
            logger_->error("no qubits present in function (required by profile).");
        }

        if (config_.requiresResults() && function_details.usage_result_counts == 0)
        {
            logger_->setLocationFromValue(&function);
            logger_->error("no results present in function (required by profile).");
        }

        return llvm::PreservedAnalyses::all();
    }

    bool FunctionValidationPass::isRequired()
    {
        return true;
    }
} // namespace quantum
} // namespace microsoft

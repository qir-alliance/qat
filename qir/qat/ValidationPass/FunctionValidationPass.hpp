#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Logging/ILogger.hpp"
#include "Profile/Profile.hpp"
#include "QatTypes/QatTypes.hpp"
#include "StaticResourceComponent/StaticResourceComponentConfiguration.hpp"

#include "Llvm/Llvm.hpp"

#include <functional>
#include <unordered_map>
#include <vector>

namespace microsoft
{
namespace quantum
{

    class FunctionValidationPass : public llvm::PassInfoMixin<FunctionValidationPass>
    {
      public:
        using Instruction = llvm::Instruction;
        using Value       = llvm::Value;
        using ILoggerPtr  = ILogger::ILoggerPtr;
        using Location    = ILogger::Location;
        using StringRef   = llvm::StringRef;

        enum ResourceType
        {
            None,
            Qubit,
            Result
        };

        // Construction and destruction configuration.
        //

        explicit FunctionValidationPass(ValidationPassConfiguration const& cfg, ILoggerPtr const& logger = nullptr);

        /// Copy construction is banned.
        FunctionValidationPass(FunctionValidationPass const&) = delete;

        /// We allow move semantics.
        FunctionValidationPass(FunctionValidationPass&&) = default;

        /// Default destruction.
        ~FunctionValidationPass() = default;

        llvm::PreservedAnalyses run(llvm::Function& function, llvm::FunctionAnalysisManager& fam);

        /// Whether or not this pass is required to run.
        static bool isRequired();

      private:
        ValidationPassConfiguration config_{};

        ILoggerPtr logger_{nullptr};
    };

} // namespace quantum
} // namespace microsoft

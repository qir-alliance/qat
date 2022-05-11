#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Logging/ILogger.hpp"
#include "PreTransformValidation/PreTransformValidationPass.hpp"
#include "PreTransformValidation/PreTransformValidationPassConfiguration.hpp"
#include "Profile/Profile.hpp"
#include "QatTypes/QatTypes.hpp"

#include "Llvm/Llvm.hpp"

#include <functional>
#include <unordered_map>
#include <vector>

namespace microsoft
{
namespace quantum
{

    class PreTransformValidationPass : public llvm::PassInfoMixin<PreTransformValidationPass>
    {
      public:
        using Instruction = llvm::Instruction;
        using Value       = llvm::Value;
        using ILoggerPtr  = ILogger::ILoggerPtr;
        using Location    = ILogger::Location;
        using StringRef   = llvm::StringRef;

        // Construction and destruction configuration.
        //

        explicit PreTransformValidationPass(
            PreTransformValidationPassConfiguration const& cfg,
            ILoggerPtr const&                              logger = nullptr);

        /// Copy construction is banned.
        PreTransformValidationPass(PreTransformValidationPass const&) = delete;

        /// We allow move semantics.
        PreTransformValidationPass(PreTransformValidationPass&&) = default;

        /// Default destruction.
        ~PreTransformValidationPass() = default;

        llvm::PreservedAnalyses run(llvm::Module& module, llvm::ModuleAnalysisManager& mam);
        /// Whether or not this pass is required to run.
        static bool isRequired();

      private:
        using Locations = std::vector<Location>;

        PreTransformValidationPassConfiguration config_{};
        ILoggerPtr                              logger_{nullptr};
    };

} // namespace quantum
} // namespace microsoft

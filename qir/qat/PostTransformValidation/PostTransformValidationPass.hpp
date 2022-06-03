#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Logging/ILogger.hpp"
#include "PostTransformValidation/PostTransformValidationPass.hpp"
#include "PostTransformValidation/PostTransformValidationPassConfiguration.hpp"
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

    class PostTransformValidationPass : public llvm::PassInfoMixin<PostTransformValidationPass>
    {
      public:
        using Instruction = llvm::Instruction;
        using Value       = llvm::Value;
        using ILoggerPtr  = ILogger::ILoggerPtr;
        using Location    = ILogger::Location;
        using StringRef   = llvm::StringRef;

        // Construction and destruction configuration.
        //

        explicit PostTransformValidationPass(
            PostTransformValidationPassConfiguration const& cfg,
            ILoggerPtr const&                               logger = nullptr);

        /// Copy construction is banned.
        PostTransformValidationPass(PostTransformValidationPass const&) = delete;

        /// We allow move semantics.
        PostTransformValidationPass(PostTransformValidationPass&&) = default;

        /// Default destruction.
        ~PostTransformValidationPass() = default;

        llvm::PreservedAnalyses run(llvm::Module& module, llvm::ModuleAnalysisManager& mam);
        /// Whether or not this pass is required to run.
        static bool isRequired();

      private:
        using Locations = std::vector<Location>;

        PostTransformValidationPassConfiguration config_{};
        ILoggerPtr                               logger_{nullptr};
    };

} // namespace quantum
} // namespace microsoft
#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/ILogger.hpp"
#include "qir/qat/Passes/StaticResourceComponent/StaticResourceComponentConfiguration.hpp"
#include "qir/qat/Passes/ValidationPass/TargetProfileConfiguration.hpp"
#include "qir/qat/Passes/ValidationPass/TargetQisConfiguration.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <functional>
#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{

class FunctionValidationPass : public llvm::PassInfoMixin<FunctionValidationPass>
{
  public:
    using Instruction = llvm::Instruction;
    using Value       = llvm::Value;
    using ILoggerPtr  = ILogger::ILoggerPtr;
    using Location    = ILogger::Location;
    using StringRef   = llvm::StringRef;

    // Construction and destruction configuration.
    //

    explicit FunctionValidationPass(
        TargetProfileConfiguration const& profile_config,
        TargetQisConfiguration const&     qis_config,
        ILoggerPtr const&                 logger = nullptr);

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
    TargetProfileConfiguration profile_config_{};
    TargetQisConfiguration     qis_config_{};

    ILoggerPtr logger_{nullptr};
};

} // namespace microsoft::quantum

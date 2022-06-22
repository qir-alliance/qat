#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Logging/ILogger.hpp"
#include "qir/qat/PreTransformTrimming/PreTransformTrimmingPass.hpp"
#include "qir/qat/PreTransformTrimming/PreTransformTrimmingPassConfiguration.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include "qir/qat/Llvm/Llvm.hpp"

#include <functional>
#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{

class PreTransformTrimmingPass : public llvm::PassInfoMixin<PreTransformTrimmingPass>
{
  public:
    using Instruction = llvm::Instruction;
    using Value       = llvm::Value;
    using ILoggerPtr  = ILogger::ILoggerPtr;
    using Location    = ILogger::Location;
    using StringRef   = llvm::StringRef;

    // Construction and destruction configuration.
    //

    explicit PreTransformTrimmingPass(
        PreTransformTrimmingPassConfiguration const& cfg,
        ILoggerPtr const&                            logger = nullptr);

    /// Copy construction is banned.
    PreTransformTrimmingPass(PreTransformTrimmingPass const&) = delete;

    /// We allow move semantics.
    PreTransformTrimmingPass(PreTransformTrimmingPass&&) = default;

    /// Default destruction.
    ~PreTransformTrimmingPass() = default;

    llvm::PreservedAnalyses run(llvm::Module& module, llvm::ModuleAnalysisManager& mam);
    /// Whether or not this pass is required to run.
    static bool isRequired();

  private:
    using Locations = std::vector<Location>;

    PreTransformTrimmingPassConfiguration config_{};
    ILoggerPtr                            logger_{nullptr};
};

} // namespace microsoft::quantum

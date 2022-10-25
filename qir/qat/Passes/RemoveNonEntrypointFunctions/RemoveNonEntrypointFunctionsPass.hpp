#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/ILogger.hpp"
#include "qir/qat/Passes/RemoveNonEntrypointFunctions/RemoveNonEntrypointFunctionsPass.hpp"
#include "qir/qat/Passes/RemoveNonEntrypointFunctions/RemoveNonEntrypointFunctionsPassConfiguration.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <functional>
#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{

class RemoveNonEntrypointFunctionsPass : public llvm::PassInfoMixin<RemoveNonEntrypointFunctionsPass>
{
  public:
    using Instruction = llvm::Instruction;
    using Value       = llvm::Value;
    using ILoggerPtr  = ILogger::ILoggerPtr;
    using Location    = ILogger::Location;
    using StringRef   = llvm::StringRef;

    // Construction and destruction configuration.
    //

    explicit RemoveNonEntrypointFunctionsPass(
        RemoveNonEntrypointFunctionsPassConfiguration const& cfg,
        ILoggerPtr const&                                    logger = nullptr);

    /// Copy construction is banned.
    RemoveNonEntrypointFunctionsPass(RemoveNonEntrypointFunctionsPass const&) = delete;

    /// We allow move semantics.
    RemoveNonEntrypointFunctionsPass(RemoveNonEntrypointFunctionsPass&&) = default;

    /// Default destruction.
    ~RemoveNonEntrypointFunctionsPass() = default;

    llvm::PreservedAnalyses run(llvm::Module& module, llvm::ModuleAnalysisManager& mam);
    /// Whether or not this pass is required to run.
    static bool isRequired();

  private:
    using Locations = std::vector<Location>;

    RemoveNonEntrypointFunctionsPassConfiguration config_{};
    ILoggerPtr                                    logger_{nullptr};
};

} // namespace microsoft::quantum

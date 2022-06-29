#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Logging/ILogger.hpp"
#include "Profile/Profile.hpp"
#include "QatTypes/QatTypes.hpp"

#include "Llvm/Llvm.hpp"

#include <functional>
#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{

class DivisionByZeroPass : public llvm::PassInfoMixin<DivisionByZeroPass>
{
  public:
    using Instruction = llvm::Instruction;
    using Value       = llvm::Value;
    using ILoggerPtr  = ILogger::ILoggerPtr;
    using Location    = ILogger::Location;
    using StringRef   = llvm::StringRef;

    // Construction and destruction configuration.
    //

    DivisionByZeroPass() = default;

    /// Copy construction is banned.
    DivisionByZeroPass(DivisionByZeroPass const&) = delete;

    /// We allow move semantics.
    DivisionByZeroPass(DivisionByZeroPass&&) = default;

    /// Default destruction.
    ~DivisionByZeroPass() = default;

    llvm::PreservedAnalyses run(llvm::Module& module, llvm::ModuleAnalysisManager& mam);

    /// Whether or not this pass is required to run.
    static bool isRequired();

  private:
    ValidationPassConfiguration config_{};

    ILoggerPtr logger_{nullptr};
};

} // namespace microsoft::quantum
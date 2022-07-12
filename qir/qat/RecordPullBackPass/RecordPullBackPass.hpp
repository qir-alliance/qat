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

class RecordPullBackPass : public llvm::PassInfoMixin<RecordPullBackPass>
{
  public:
    using Instruction = llvm::Instruction;
    using Value       = llvm::Value;
    using ILoggerPtr  = ILogger::ILoggerPtr;
    using Location    = ILogger::Location;
    using StringRef   = llvm::StringRef;
    static std::string const RECORD_INSTR_END;

    // Construction and destruction configuration.
    //

    RecordPullBackPass() = default;

    /// Copy construction is banned.
    RecordPullBackPass(RecordPullBackPass const&) = delete;

    /// We allow move semantics.
    RecordPullBackPass(RecordPullBackPass&&) = default;

    /// Default destruction.
    ~RecordPullBackPass() = default;

    llvm::PreservedAnalyses run(llvm::Function& function, llvm::FunctionAnalysisManager& fam);

    /// Whether or not this pass is required to run.
    static bool isRequired();

  private:
};

} // namespace microsoft::quantum
#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/ILogger.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

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

    RecordPullBackPass() noexcept;

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
    std::unordered_set<String> readout_names_{};
};

} // namespace microsoft::quantum
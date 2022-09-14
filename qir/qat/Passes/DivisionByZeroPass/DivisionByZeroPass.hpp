#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/ILogger.hpp"
#include "qir/qat/Passes/ValidationPass/TargetProfileConfiguration.hpp"
#include "qir/qat/Passes/ValidationPass/TargetQisConfiguration.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

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

    static const char* const EC_VARIABLE_NAME;
    static const char* const EC_REPORT_FUNCTION;
    static int64_t const     EC_QIR_DIVISION_BY_ZERO;

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

    void raiseError(int64_t error_code, llvm::Module& module, llvm::Instruction* instr);

  private:
    TargetProfileConfiguration config_{};

    ILoggerPtr            logger_{nullptr};
    llvm::GlobalVariable* error_variable_{nullptr};
};

} // namespace microsoft::quantum

#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/ILogger.hpp"
#include "qir/qat/Passes/FunctionReplacementPass/FunctionReplacementConfiguration.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <functional>
#include <unordered_map>
#include <unordered_set>
#include <vector>

namespace microsoft::quantum
{

struct FunctionRegister
{
    using FunctionMap    = std::unordered_map<String, llvm::Function*>;
    using ReplacementMap = std::unordered_map<llvm::Function*, llvm::Function*>;
    using CallList       = std::vector<llvm::CallInst*>;

    FunctionMap    name_to_function_pointer{};
    ReplacementMap functions_to_replace{};
    CallList       calls_to_replace{};
};

class FunctionReplacementAnalysisPass : public llvm::AnalysisInfoMixin<FunctionReplacementAnalysisPass>
{
  public:
    using Result      = FunctionRegister;
    using Instruction = llvm::Instruction;
    using Value       = llvm::Value;
    using ILoggerPtr  = ILogger::ILoggerPtr;
    using BlockSet    = std::unordered_set<llvm::BasicBlock*>;

    // Construction and destruction configuration.
    //

    explicit FunctionReplacementAnalysisPass(FunctionReplacementConfiguration const& cfg, ILoggerPtr const& logger)
      : config_{cfg}
      , logger_{logger}
    {
    }

    /// Copy construction is banned.
    FunctionReplacementAnalysisPass(FunctionReplacementAnalysisPass const&) = delete;

    /// We allow move semantics.
    FunctionReplacementAnalysisPass(FunctionReplacementAnalysisPass&&) = default;

    /// Default destruction.
    ~FunctionReplacementAnalysisPass() = default;

    Result run(llvm::Module& module, llvm::ModuleAnalysisManager& mam);

    void runBlockAnalysis(llvm::Module& module);

    /// Whether or not this pass is required to run.
    static bool isRequired();

  private:
    FunctionReplacementConfiguration config_{};
    ILoggerPtr                       logger_{nullptr};

    static llvm::AnalysisKey Key; // NOLINT
    friend struct llvm::AnalysisInfoMixin<FunctionReplacementAnalysisPass>;
};

class FunctionReplacementAnalysisPassPrinter : public llvm::PassInfoMixin<FunctionReplacementAnalysisPassPrinter>
{
  public:
    llvm::PreservedAnalyses run(llvm::Module& module, llvm::ModuleAnalysisManager& mam);

    static bool isRequired()
    {
        return true;
    }
};

} // namespace microsoft::quantum

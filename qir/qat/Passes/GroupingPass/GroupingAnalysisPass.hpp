#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/ILogger.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingPassConfiguration.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <functional>
#include <unordered_map>
#include <unordered_set>
#include <vector>

namespace microsoft::quantum
{

struct GroupAnalysis
{
    using BlockList = std::vector<llvm::BasicBlock*>;
    BlockList qc_cc_blocks{};
    BlockList qc_mc_cc_blocks{};
};

class GroupingAnalysisPass : public llvm::AnalysisInfoMixin<GroupingAnalysisPass>
{
  public:
    using Result      = GroupAnalysis;
    using Instruction = llvm::Instruction;
    using Value       = llvm::Value;
    using ILoggerPtr  = ILogger::ILoggerPtr;
    using BlockSet    = std::unordered_set<llvm::BasicBlock*>;

    static String const QIS_START;
    static String const READ_INSTR_START;

    // Construction and destruction configuration.
    //

    explicit GroupingAnalysisPass(GroupingPassConfiguration const& cfg, ILoggerPtr const& logger)
      : config_{cfg}
      , logger_{logger}
    {
    }

    /// Copy construction is banned.
    GroupingAnalysisPass(GroupingAnalysisPass const&) = delete;

    /// We allow move semantics.
    GroupingAnalysisPass(GroupingAnalysisPass&&) = default;

    /// Default destruction.
    ~GroupingAnalysisPass() = default;

    Result run(llvm::Module& module, llvm::ModuleAnalysisManager& mam);

    void runBlockAnalysis(llvm::Module& module);

    /// Whether or not this pass is required to run.
    static bool isRequired();

  private:
    GroupingPassConfiguration config_{};

    // Block classification
    //
    BlockSet contains_quantum_circuit_{};
    BlockSet contains_quantum_measurement_{};

    BlockSet pure_quantum_instructions_{};
    BlockSet pure_quantum_measurement_{};

    ILoggerPtr logger_{nullptr};

    static llvm::AnalysisKey Key; // NOLINT
    friend struct llvm::AnalysisInfoMixin<GroupingAnalysisPass>;
};

class GroupingAnalysisPassPrinter : public llvm::PassInfoMixin<GroupingAnalysisPassPrinter>
{
  public:
    llvm::PreservedAnalyses run(llvm::Module& module, llvm::ModuleAnalysisManager& mam);

    static bool isRequired()
    {
        return true;
    }
};

} // namespace microsoft::quantum

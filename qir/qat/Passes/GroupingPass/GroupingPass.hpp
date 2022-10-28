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

///
/// ```
/// ┌─────────────────────────────────┐│┌──────────────────────────────────┐
/// │         No measurements         │││        With measurements         │
/// └─────────────────────────────────┘│└──────────────────────────────────┘
///                                    │
///      Before             After      │       Before            After
/// ─────────────────┬─────────────────┼──────────────────┬─────────────────
///                                    │
///                          [entry]   │                          [entry]
///                  │                 │                  │
///                                    │                    ┌───
///      [entry]                       │       [entry]      │
///                  │ ┌───            │                  │ │  [bb head cc]
///                    │               │                    │
///                    │     [bb cc]   │                    │
///                  │ │               │                  │ │     [bb qc]
///   [mixed qc/cc]  ──▶               │  [mixed qc/mc/cc]──▶
///                    │               │                    │
///                  │ │     [bb qc]   │                  │ │     [bb mc]
///                    │               │                    │
///                    └───            │                    │
///       [bb2]      │                 │        [bb2]     │ │  [bb tail cc]
///                                    │                    │
///                           [bb2]    │                    └───
///                  │                 │                  │
///                                    │                           [bb2]
///                                    │
/// ```
///

class GroupingPass : public llvm::PassInfoMixin<GroupingPass>
{
  public:
    using Instruction   = llvm::Instruction;
    using Value         = llvm::Value;
    using ILoggerPtr    = ILogger::ILoggerPtr;
    using BlockSet      = std::unordered_set<llvm::BasicBlock*>;
    using SharedBuilder = std::shared_ptr<llvm::IRBuilder<>>;
    // Construction and destruction configuration.
    //

    enum class ResourceType
    {
        UNDEFINED,
        QUBIT,
        RESULT
    };

    struct ResourceAnalysis
    {
        bool         is_const{false};
        uint64_t     id{0};
        ResourceType type{ResourceType::UNDEFINED};
    };

    enum
    {
        PureClassical              = 0,
        SourceQuantum              = 1,
        DestQuantum                = 2,
        PureQuantum                = SourceQuantum | DestQuantum,
        TransferClassicalToQuantum = DestQuantum,
        TransferQuantumToClassical = SourceQuantum,

        InvalidMixedLocation = -1
    };

    explicit GroupingPass(GroupingPassConfiguration const& cfg)
      : config_{cfg}
    {
    }

    /// Copy construction is banned.
    GroupingPass(GroupingPass const&) = delete;

    /// We allow move semantics.
    GroupingPass(GroupingPass&&) = default;

    /// Default destruction.
    ~GroupingPass() = default;

    //
    void prepareSourceSeparation(llvm::Module& module, llvm::BasicBlock* block);
    void nextQuantumCycle(llvm::Module& module, llvm::BasicBlock* block);
    void expandBasedOnSource(llvm::Module& module, llvm::BasicBlock* block);

    void expandBasedOnDest(llvm::Module& module, llvm::BasicBlock* block, bool move_quatum, String const& name);

    //
    bool    isQuantumRegister(llvm::Type const* type);
    int64_t classifyInstruction(llvm::Instruction const* instr);

    llvm::PreservedAnalyses run(llvm::Module& module, llvm::ModuleAnalysisManager& mam);

    void runBlockAnalysis(llvm::Module& module);

    /// Whether or not this pass is required to run.
    static bool isRequired();

    /// Sets the logger
    void setLogger(ILoggerPtr logger);

  private:
    void deleteInstructions();

    ResourceAnalysis operandAnalysis(llvm::Value* val) const;

    GroupingPassConfiguration config_{};

    // Basic blocks used to build

    llvm::BasicBlock* post_classical_block_{nullptr};
    llvm::BasicBlock* quantum_block_{nullptr};
    llvm::BasicBlock* pre_classical_block_{nullptr};

    // Builders
    //

    SharedBuilder pre_classical_builder_{};
    SharedBuilder quantum_builder_{};
    SharedBuilder post_classical_builder_{};

    std::vector<llvm::BasicBlock*> quantum_blocks_{};
    std::vector<llvm::BasicBlock*> classical_blocks_{};

    BlockSet   visited_blocks_;
    ILoggerPtr logger_{nullptr};

    std::unordered_set<String> quantum_register_types_ = {"Qubit", "Result"};

    std::vector<llvm::Instruction*> to_delete_;
};

} // namespace microsoft::quantum

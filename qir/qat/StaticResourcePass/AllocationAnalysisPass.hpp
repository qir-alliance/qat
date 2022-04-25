#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Llvm/Llvm.hpp"
#include "Logging/ILogger.hpp"
#include "Profile/Profile.hpp"
#include "QatTypes/QatTypes.hpp"
#include "StaticResourcePass/StaticResourcePassConfiguration.hpp"

#include <functional>
#include <unordered_map>
#include <unordered_set>
#include <vector>

namespace microsoft {
namespace quantum {

struct AllocationAnalysis
{
  using BlockList    = std::vector<llvm::BasicBlock *>;
  using ResourceToId = std::unordered_map<llvm::Value *, uint64_t>;

  uint64_t largest_qubit_index{0};
  uint64_t largest_result_index{0};
  uint64_t usage_qubit_counts{0};
  uint64_t usage_result_counts{0};

  ResourceToId qubit_mapping{};
  ResourceToId result_mapping{};
};

class AllocationAnalysisPass : public llvm::AnalysisInfoMixin<AllocationAnalysisPass>
{
public:
  using Result      = AllocationAnalysis;
  using Instruction = llvm::Instruction;
  using Value       = llvm::Value;
  using ILoggerPtr  = std::shared_ptr<ILogger>;
  using BlockSet    = std::unordered_set<llvm::BasicBlock *>;

  // Construction and destruction configuration.
  //

  explicit AllocationAnalysisPass(StaticResourcePassConfiguration const &cfg,
                                  ILoggerPtr const                      &logger)
    : config_{cfg}
    , logger_{logger}
  {}

  /// Copy construction is banned.
  AllocationAnalysisPass(AllocationAnalysisPass const &) = delete;

  /// We allow move semantics.
  AllocationAnalysisPass(AllocationAnalysisPass &&) = default;

  /// Default destruction.
  ~AllocationAnalysisPass() = default;

  Result run(llvm::Function &function, llvm::FunctionAnalysisManager &fam);

  /// Whether or not this pass is required to run.
  static bool isRequired();

private:
  StaticResourcePassConfiguration config_{};

  ILoggerPtr logger_{nullptr};

  static llvm::AnalysisKey Key;
  friend struct llvm::AnalysisInfoMixin<AllocationAnalysisPass>;
};

class AllocationAnalysisPassPrinter : public llvm::PassInfoMixin<AllocationAnalysisPassPrinter>
{
public:
  llvm::PreservedAnalyses run(llvm::Function &module, llvm::FunctionAnalysisManager &mam);

  static bool isRequired()
  {
    return true;
  }
};

}  // namespace quantum
}  // namespace microsoft

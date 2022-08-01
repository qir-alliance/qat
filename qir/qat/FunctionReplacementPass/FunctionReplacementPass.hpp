#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/FunctionReplacementPass/FunctionReplacementPassConfiguration.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/ILogger.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <functional>
#include <unordered_map>
#include <unordered_set>
#include <vector>

namespace microsoft::quantum {

class FunctionReplacementPass : public llvm::PassInfoMixin<FunctionReplacementPass>
{
public:
  using Instruction   = llvm::Instruction;
  using Value         = llvm::Value;
  using ILoggerPtr    = ILogger::ILoggerPtr;
  using BlockSet      = std::unordered_set<llvm::BasicBlock *>;
  using SharedBuilder = std::shared_ptr<llvm::IRBuilder<>>;
  // Construction and destruction configuration.
  //

  FunctionReplacementPass() = default;

  /// Copy construction is banned.
  FunctionReplacementPass(FunctionReplacementPass const &) = delete;

  /// We allow move semantics.
  FunctionReplacementPass(FunctionReplacementPass &&) = default;

  /// Default destruction.
  ~FunctionReplacementPass() = default;

  llvm::PreservedAnalyses run(llvm::Module &module, llvm::ModuleAnalysisManager &mam);

  /// Whether or not this pass is required to run.
  static bool isRequired();

  /// Sets the logger
  void setLogger(ILoggerPtr logger);

private:
  ILoggerPtr logger_{nullptr};
};

}  // namespace microsoft::quantum

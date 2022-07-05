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

class ZExtTransformPass : public llvm::PassInfoMixin<ZExtTransformPass>
{
  public:
    using Instruction = llvm::Instruction;
    using Value       = llvm::Value;
    using ILoggerPtr  = ILogger::ILoggerPtr;
    using Location    = ILogger::Location;
    using StringRef   = llvm::StringRef;

    // Construction and destruction configuration.
    //

    ZExtTransformPass() = default;

    /// Copy construction is banned.
    ZExtTransformPass(ZExtTransformPass const&) = delete;

    /// We allow move semantics.
    ZExtTransformPass(ZExtTransformPass&&) = default;

    /// Default destruction.
    ~ZExtTransformPass() = default;

    llvm::PreservedAnalyses run(llvm::Function& function, llvm::FunctionAnalysisManager& fam);

    /// Whether or not this pass is required to run.
    static bool isRequired();

  private:
    ILoggerPtr logger_{nullptr};
};

} // namespace microsoft::quantum

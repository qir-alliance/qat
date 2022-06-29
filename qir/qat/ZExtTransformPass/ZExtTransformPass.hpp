#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Logging/ILogger.hpp"
#include "Profile/Profile.hpp"
#include "QatTypes/QatTypes.hpp"
#include "StaticResourceComponent/StaticResourceComponentConfiguration.hpp"

#include "Llvm/Llvm.hpp"

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
    ValidationPassConfiguration config_{};

    ILoggerPtr logger_{nullptr};
};

} // namespace microsoft::quantum

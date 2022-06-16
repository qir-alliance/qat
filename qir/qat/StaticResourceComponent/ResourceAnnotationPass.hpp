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

class ResourceAnnotationPass : public llvm::PassInfoMixin<ResourceAnnotationPass>
{
  public:
    using Instruction = llvm::Instruction;
    using Value       = llvm::Value;
    using ILoggerPtr  = ILogger::ILoggerPtr;
    using Location    = ILogger::Location;
    using StringRef   = llvm::StringRef;

    enum ResourceType
    {
        None,
        Qubit,
        Result
    };

    // Construction and destruction configuration.
    //

    explicit ResourceAnnotationPass(
        StaticResourceComponentConfiguration const& cfg,
        ILoggerPtr const&                           logger = nullptr);

    /// Copy construction is banned.
    ResourceAnnotationPass(ResourceAnnotationPass const&) = delete;

    /// We allow move semantics.
    ResourceAnnotationPass(ResourceAnnotationPass&&) = default;

    /// Default destruction.
    ~ResourceAnnotationPass() = default;

    llvm::PreservedAnalyses run(llvm::Function& function, llvm::FunctionAnalysisManager& fam);

    /// Whether or not this pass is required to run.
    static bool isRequired();

  private:
    StaticResourceComponentConfiguration config_{};

    ILoggerPtr logger_{nullptr};
};

} // namespace microsoft::quantum

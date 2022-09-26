#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/ILogger.hpp"
#include "qir/qat/Passes/StaticResourceComponent/StaticResourceComponentConfiguration.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <functional>
#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{

class QubitRemapPass : public llvm::PassInfoMixin<QubitRemapPass>
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

    explicit QubitRemapPass(StaticResourceComponentConfiguration const& cfg, ILoggerPtr const& logger = nullptr);

    /// Copy construction is banned.
    QubitRemapPass(QubitRemapPass const&) = delete;

    /// We allow move semantics.
    QubitRemapPass(QubitRemapPass&&) = default;

    /// Default destruction.
    ~QubitRemapPass() = default;

    llvm::PreservedAnalyses run(llvm::Function& function, llvm::FunctionAnalysisManager& mam);

    /// Whether or not this pass is required to run.
    static bool isRequired();

  private:
    bool extractResourceId(llvm::Value* value, uint64_t& return_value, ResourceType& type) const;

    StaticResourceComponentConfiguration config_{};

    ILoggerPtr logger_{nullptr};
};

} // namespace microsoft::quantum

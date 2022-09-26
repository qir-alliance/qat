#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/ILogger.hpp"
#include "qir/qat/Passes/StaticResourceComponent/StaticResourceComponentConfiguration.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <functional>
#include <unordered_map>
#include <unordered_set>
#include <vector>

namespace microsoft::quantum
{

struct AllocationAnalysis
{
    enum ResourceType
    {
        NotResource,
        QubitResource,
        ResultResource
    };

    struct ResourceAccessLocation
    {
        llvm::Value*       operand{nullptr};
        ResourceType       type{ResourceType::NotResource};
        uint64_t           index{static_cast<uint64_t>(-1)};
        llvm::Instruction* used_by{nullptr};
        uint64_t           operand_id{0};
    };

    using ResourceValueToId  = std::unordered_map<llvm::Value*, ResourceAccessLocation>;
    using ResourceAccessList = std::vector<ResourceAccessLocation>;

    uint64_t largest_qubit_index{0};
    uint64_t largest_result_index{0};
    uint64_t usage_qubit_counts{0};
    uint64_t usage_result_counts{0};

    ResourceValueToId  access_map{};
    ResourceAccessList resource_access{};
};

class AllocationAnalysisPass : public llvm::AnalysisInfoMixin<AllocationAnalysisPass>
{
  public:
    using Result                 = AllocationAnalysis;
    using Instruction            = llvm::Instruction;
    using Value                  = llvm::Value;
    using ILoggerPtr             = ILogger::ILoggerPtr;
    using BlockSet               = std::unordered_set<llvm::BasicBlock*>;
    using ResourceType           = AllocationAnalysis::ResourceType;
    using ResourceAccessLocation = AllocationAnalysis::ResourceAccessLocation;

    // Construction and destruction configuration.
    //

    explicit AllocationAnalysisPass(ILoggerPtr const& logger)
      : logger_{logger}
    {
    }

    /// Copy construction is banned.
    AllocationAnalysisPass(AllocationAnalysisPass const&) = delete;

    /// We allow move semantics.
    AllocationAnalysisPass(AllocationAnalysisPass&&) = default;

    /// Default destruction.
    ~AllocationAnalysisPass() = default;

    Result run(llvm::Function& function, llvm::FunctionAnalysisManager& fam);

    /// Whether or not this pass is required to run.
    static bool isRequired();

  private:
    bool extractResourceId(llvm::Value* value, uint64_t& return_value, ResourceType& type) const;

    ILoggerPtr               logger_{nullptr};
    static llvm::AnalysisKey Key; // NOLINT
    friend struct llvm::AnalysisInfoMixin<AllocationAnalysisPass>;
};

class AllocationAnalysisPassPrinter : public llvm::PassInfoMixin<AllocationAnalysisPassPrinter>
{
  public:
    llvm::PreservedAnalyses run(llvm::Function& module, llvm::FunctionAnalysisManager& mam);

    static bool isRequired()
    {
        return true;
    }
};

} // namespace microsoft::quantum

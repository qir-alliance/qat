// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/StaticResourceComponent/QubitRemapPass.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/ILogger.hpp"
#include "qir/qat/Passes/StaticResourceComponent/AllocationAnalysisPass.hpp"
#include "qir/qat/Passes/StaticResourceComponent/StaticResourceComponentConfiguration.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <functional>
#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{

QubitRemapPass::QubitRemapPass(StaticResourceComponentConfiguration const& cfg, ILoggerPtr const& logger)
  : config_{cfg}
  , logger_{logger}
{
}

llvm::PreservedAnalyses QubitRemapPass::run(llvm::Function& function, llvm::FunctionAnalysisManager& fam)
{
    if (!config_.shouldReindexQubits())
    {
        return llvm::PreservedAnalyses::all();
    }

    auto& function_details = fam.getResult<AllocationAnalysisPass>(function);

    llvm::IRBuilder<> builder{function.getContext()};

    std::unordered_map<uint64_t, uint64_t> qubits_mapping{};
    std::unordered_map<uint64_t, uint64_t> results_mapping{};

    // Re-indexing
    for (auto const& value : function_details.resource_access)
    {
        auto const& index = value.index;
        switch (value.type)
        {
        case AllocationAnalysis::QubitResource:
            if (qubits_mapping.find(index) == qubits_mapping.end())
            {
                qubits_mapping[index] = qubits_mapping.size();
            }
            break;
        case AllocationAnalysis::ResultResource:
            if (results_mapping.find(index) == results_mapping.end())
            {
                results_mapping[index] = results_mapping.size();
            }

            break;
        case AllocationAnalysis::NotResource:
            break;
        }
    }

    // Updating values
    for (auto const& value : function_details.resource_access)
    {
        auto const& index = value.index;
        auto        op    = value.operand;

        auto pointer_type = llvm::dyn_cast<llvm::PointerType>(op->getType());
        if (!pointer_type)
        {
            continue;
        }

        uint64_t remapped_index = value.index;

        switch (value.type)
        {
        case AllocationAnalysis::QubitResource:
            if (qubits_mapping.find(index) != qubits_mapping.end())
            {
                remapped_index = qubits_mapping[index];
            }
            break;
        case AllocationAnalysis::ResultResource:
            if (results_mapping.find(index) != results_mapping.end())
            {
                remapped_index = results_mapping[index];
            }

            break;
        case AllocationAnalysis::NotResource:
            continue;
        }

        builder.SetInsertPoint(value.used_by);

        // Removing non-null attribute if it exists as remapping may change this
        auto call_instr = llvm::dyn_cast<llvm::CallInst>(value.used_by);
        if (call_instr)
        {
            auto attrs   = call_instr->getAttributes();
            auto newlist = attrs.removeParamAttribute(
                function.getContext(), static_cast<uint32_t>(value.operand_id), llvm::Attribute::NonNull);
            call_instr->setAttributes(newlist);
        }

        // Creating replacement instruction
        auto idx = llvm::APInt(64, remapped_index);

        auto         new_index = llvm::ConstantInt::get(function.getContext(), idx);
        llvm::Value* new_instr = nullptr;
        new_instr              = nullptr;

        new_instr = new llvm::IntToPtrInst(new_index, pointer_type);
        builder.Insert(new_instr);

        value.used_by->setOperand(static_cast<uint32_t>(value.operand_id), new_instr);
    }

    return llvm::PreservedAnalyses::none();
}

bool QubitRemapPass::isRequired()
{
    return true;
}
} // namespace microsoft::quantum

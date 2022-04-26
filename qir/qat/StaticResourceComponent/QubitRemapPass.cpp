// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Logging/ILogger.hpp"
#include "Profile/Profile.hpp"
#include "QatTypes/QatTypes.hpp"
#include "StaticResourceComponent/AllocationAnalysisPass.hpp"
#include "StaticResourceComponent/QubitRemapPass.hpp"
#include "StaticResourceComponent/StaticResourceComponentConfiguration.hpp"

#include "Llvm/Llvm.hpp"

#include <functional>
#include <unordered_map>
#include <vector>

namespace microsoft
{
namespace quantum
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
            return llvm::PreservedAnalyses::none();
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
                if (results_mapping.find(index) == results_mapping.end())
                {
                    remapped_index = results_mapping[index];
                }

                break;
            case AllocationAnalysis::NotResource:
            default:
                continue;
            }

            builder.SetInsertPoint(value.used_by);

            auto idx = llvm::APInt(64, remapped_index);

            auto         new_index = llvm::ConstantInt::get(function.getContext(), idx);
            llvm::Value* new_instr = nullptr;
            new_instr              = nullptr;

            new_instr = new llvm::IntToPtrInst(new_index, pointer_type);
            builder.Insert(new_instr);

            value.used_by->setOperand(value.operand_id, new_instr);
        }

        return llvm::PreservedAnalyses::all();
    }

    bool QubitRemapPass::isRequired()
    {
        return true;
    }
} // namespace quantum
} // namespace microsoft

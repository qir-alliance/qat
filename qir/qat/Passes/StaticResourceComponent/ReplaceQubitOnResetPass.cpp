// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/StaticResourceComponent/ReplaceQubitOnResetPass.hpp"

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

ReplaceQubitOnResetPass::ReplaceQubitOnResetPass(
    StaticResourceComponentConfiguration const& cfg,
    ILoggerPtr const&                           logger)
  : config_{cfg}
  , logger_{logger}
{
}

llvm::PreservedAnalyses ReplaceQubitOnResetPass::run(llvm::Function& function, llvm::FunctionAnalysisManager& fam)
{
    if (!config_.shouldReplaceQubitsOnReset())
    {
        return llvm::PreservedAnalyses::all();
    }

    auto& function_details = fam.getResult<AllocationAnalysisPass>(function);
    auto& access_map       = function_details.access_map;

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
                qubits_mapping[index] = index;
            }
            break;
        case AllocationAnalysis::ResultResource:
            if (results_mapping.find(index) == results_mapping.end())
            {
                results_mapping[index] = index;
            }

            break;
        case AllocationAnalysis::NotResource:
            break;
        }
    }

    uint64_t                         next_qubit_index = qubits_mapping.size();
    std::unordered_set<llvm::Value*> already_replaced{};
    std::vector<llvm::Instruction*>  to_remove{};

    // Updating values
    for (auto& block : function)
    {
        for (auto& instr : block)
        {
            auto call_instr = llvm::dyn_cast<llvm::CallInst>(&instr);
            if (call_instr)
            {
                auto f = call_instr->getCalledFunction();
                if (f == nullptr)
                {
                    continue;
                }

                auto call_name = static_cast<std::string>(f->getName());
                if (call_name == "__quantum__qis__reset__body")
                {
                    auto op = call_instr->getOperand(0);
                    auto it = access_map.find(op);

                    if (it != access_map.end())
                    {
                        qubits_mapping[it->second.index] = next_qubit_index++;
                        to_remove.push_back(&instr);
                    }
                    continue;
                }
            }

            for (uint64_t i = 0; i < instr.getNumOperands(); ++i)
            {
                auto op = instr.getOperand(static_cast<uint32_t>(i));

                // In case we already did the mapping, we skip to next instruction
                if (already_replaced.find(op) != already_replaced.end())
                {
                    continue;
                }

                // We only perform the mapping for constant integer casts. Anything else
                // cannot be remapped.
                auto it = access_map.find(op);
                if (it != access_map.end())
                {
                    auto     n              = it->second.index;
                    auto&    type           = it->second.type;
                    uint64_t remapped_index = 0;

                    // Getting remapped index based on resource type
                    if (type == AllocationAnalysis::QubitResource)
                    {
                        if (qubits_mapping.find(n) != qubits_mapping.end())
                        {
                            remapped_index = qubits_mapping[n];
                        }
                        else
                        {
                            if (logger_)
                            {
                                logger_->setLocationFromValue(op);
                                logger_->internalError("Original qubit index not found.");
                            }
                            else
                            {
                                throw std::runtime_error("Original qubit index not found.");
                            }
                            continue;
                        }
                    }
                    else if (type == AllocationAnalysis::ResultResource)
                    {
                        if (results_mapping.find(n) != results_mapping.end())
                        {
                            remapped_index = results_mapping[n];
                        }
                        else
                        {
                            if (logger_)
                            {
                                logger_->setLocationFromValue(op);
                                logger_->internalError("Original result index not found.");
                            }
                            else
                            {
                                throw std::runtime_error("Original result index not found.");
                            }
                            continue;
                        }
                    }
                    else
                    {
                        if (logger_)
                        {
                            logger_->setLocationFromValue(op);
                            logger_->internalError("Operand class could not be determined");
                        }
                        else
                        {
                            throw std::runtime_error("Operand class could not be determined");
                        }

                        continue;
                    }

                    auto pointer_type = llvm::dyn_cast<llvm::PointerType>(op->getType());
                    if (!pointer_type)
                    {
                        continue;
                    }

                    // Removing operand nonnull if present
                    if (call_instr)
                    {
                        auto attrs   = call_instr->getAttributes();
                        auto newlist = attrs.removeParamAttribute(
                            function.getContext(), static_cast<uint32_t>(i), llvm::Attribute::NonNull);
                        call_instr->setAttributes(newlist);
                    }

                    // Creating new instruction with remapped index
                    builder.SetInsertPoint(&instr);

                    auto idx = llvm::APInt(64, remapped_index);

                    auto         new_index = llvm::ConstantInt::get(function.getContext(), idx);
                    llvm::Value* new_instr = nullptr;
                    new_instr              = nullptr;

                    new_instr = new llvm::IntToPtrInst(new_index, pointer_type);
                    builder.Insert(new_instr);

                    instr.setOperand(static_cast<uint32_t>(i), new_instr);
                    already_replaced.insert(new_instr);
                }
            }
        }
    }

    // Removing reset instructions
    std::reverse(to_remove.begin(), to_remove.end());
    for (auto ptr : to_remove)
    {
        if (ptr->use_empty())
        {
            ptr->eraseFromParent();
        }
    }

    return llvm::PreservedAnalyses::none();
}

bool ReplaceQubitOnResetPass::isRequired()
{
    return true;
}
} // namespace microsoft::quantum

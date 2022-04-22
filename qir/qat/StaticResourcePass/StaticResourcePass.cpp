// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "StaticResourcePass/StaticResourcePass.hpp"

#include "Llvm/Llvm.hpp"

#include <fstream>
#include <iostream>

namespace microsoft
{
namespace quantum
{

    StaticResourcePass::StaticResourcePass(StaticResourcePassConfiguration const& cfg, ILoggerPtr const& logger)
      : config_{cfg}
      , logger_{logger}
    {
    }

    void StaticResourcePass::remapQubits(llvm::Module& module) const
    {
        if (!config_.shouldReindexQubits())
        {
            return;
        }

        llvm::IRBuilder<> builder{module.getContext()};

        for (auto& function : module)
        {
            std::unordered_map<uint64_t, uint64_t> qubits_mapping{};
            std::unordered_map<uint64_t, uint64_t> results_mapping{};
            std::unordered_set<llvm::Value*>       already_replaced{};

            for (auto& block : function)
            {
                for (auto& instr : block)
                {
                    for (auto& op : instr.operands())
                    {
                        // In case we already did the mapping, we skip to next instruction
                        if (already_replaced.find(op) != already_replaced.end())
                        {
                            continue;
                        }

                        auto* instruction_ptr = llvm::dyn_cast<llvm::IntToPtrInst>(op);
                        auto* operator_ptr =
                            llvm::dyn_cast<llvm::ConcreteOperator<llvm::Operator, llvm::Instruction::IntToPtr>>(op);

                        auto* nullptr_cast = llvm::dyn_cast<llvm::ConstantPointerNull>(op);

                        if (instruction_ptr || operator_ptr || nullptr_cast)
                        {

                            auto pointer_type = llvm::dyn_cast<llvm::PointerType>(op->getType());
                            if (!pointer_type)
                            {
                                continue;
                            }

                            llvm::Type* element_type = pointer_type->getElementType();

                            if (!element_type->isStructTy())
                            {
                                continue;
                            }

                            auto type_name = static_cast<String>(element_type->getStructName());
                            if (type_name != "Qubit" && type_name != "Result")
                            {
                                continue;
                            }

                            bool     is_constant_int = nullptr_cast != nullptr;
                            uint64_t n               = 0;

                            auto user = llvm::dyn_cast<llvm::User>(op);

                            // In case there exists a user, it must have exactly one argument
                            // which should be an integer. In case of deferred integers, the mapping
                            // will not work
                            if (user && user->getNumOperands() == 1)
                            {
                                auto cst = llvm::dyn_cast<llvm::ConstantInt>(user->getOperand(0));

                                if (cst)
                                {
                                    is_constant_int = true;
                                    n               = cst->getValue().getZExtValue();
                                }
                            }

                            // We only perform the mapping for constant integer casts. Anything else
                            // cannot be remapped.
                            if (is_constant_int)
                            {
                                uint64_t remapped_index = 0;

                                // Getting remapped index based on resource type
                                if (type_name == "Qubit")
                                {
                                    if (qubits_mapping.find(n) == qubits_mapping.end())
                                    {
                                        remapped_index    = qubits_mapping.size();
                                        qubits_mapping[n] = remapped_index;
                                    }
                                    else
                                    {
                                        remapped_index = qubits_mapping[n];
                                    }
                                }
                                else if (type_name == "Result")
                                {
                                    if (results_mapping.find(n) == results_mapping.end())
                                    {
                                        remapped_index     = results_mapping.size();
                                        results_mapping[n] = remapped_index;
                                    }
                                    else
                                    {
                                        remapped_index = results_mapping[n];
                                    }
                                }

                                // Creating new instruction with remapped index
                                builder.SetInsertPoint(&instr);

                                auto idx       = llvm::APInt(64, remapped_index);
                                auto new_index = llvm::ConstantInt::get(module.getContext(), idx);
                                auto new_instr = new llvm::IntToPtrInst(new_index, pointer_type);
                                builder.Insert(new_instr);

                                op->replaceAllUsesWith(new_instr);
                                already_replaced.insert(new_instr);
                                already_replaced.insert(op);
                            }
                        }
                    }
                }
            }
        }
    }

    bool StaticResourcePass::enforceRequirements(llvm::Module& module) const
    {
        if (config_.shouldReplaceQubitsOnReset())
        {
            uint64_t function_counts{0};
            uint64_t body_counts{0};

            for (auto& function : module)
            {
                ++function_counts;
                for (auto& body : function)
                {
                    ++body_counts;
                }
            }

            if (function_counts != 1 || body_counts != 1)
            {
                if (logger_)
                {
                    logger_->error(
                        "Qubit replacement on reset only possible using straight line code (single function, "
                        "one body).");
                    return false;
                }
                else
                {
                    throw std::runtime_error(
                        "Qubit replacement on reset only possible using straight line code (single function, "
                        "one body).");
                }
            }
        }
        return true;
    }

    StaticResourcePass::ResourceStats StaticResourcePass::getLargestIndices(llvm::Function& function) const
    {
        ResourceStats                ret;
        std::unordered_set<uint64_t> qubits_used{};
        std::unordered_set<uint64_t> results_used{};

        for (auto& block : function)
        {
            for (auto& instr : block)
            {
                for (auto& op : instr.operands())
                {
                    auto* a = llvm::dyn_cast<llvm::IntToPtrInst>(op);
                    auto* b = llvm::dyn_cast<llvm::ConcreteOperator<llvm::Operator, llvm::Instruction::IntToPtr>>(op);

                    auto* nullptr_cast = llvm::dyn_cast<llvm::ConstantPointerNull>(op);

                    if (a || b || nullptr_cast)
                    {

                        auto pointer_type = llvm::dyn_cast<llvm::PointerType>(op->getType());
                        if (!pointer_type)
                        {
                            continue;
                        }

                        llvm::Type* element_type = pointer_type->getElementType();

                        if (!element_type->isStructTy())
                        {
                            continue;
                        }

                        auto type_name = static_cast<String>(element_type->getStructName());
                        if (type_name != "Qubit" && type_name != "Result")
                        {
                            continue;
                        }

                        bool     is_constant_int = nullptr_cast != nullptr;
                        uint64_t n               = 0;

                        auto user = llvm::dyn_cast<llvm::User>(op);

                        if (user && user->getNumOperands() == 1)
                        {
                            auto cst = llvm::dyn_cast<llvm::ConstantInt>(user->getOperand(0));

                            if (cst)
                            {
                                is_constant_int = true;
                                n               = cst->getValue().getZExtValue();
                            }
                        }

                        if (is_constant_int)
                        {
                            // Updating qubit index
                            if (type_name == "Qubit")
                            {
                                qubits_used.insert(n);
                                ret.largest_qubit_index = ret.largest_qubit_index < n ? n : ret.largest_qubit_index;
                            }

                            // Updating result index
                            if (type_name == "Result")
                            {
                                results_used.insert(n);
                                ret.largest_result_index = ret.largest_result_index < n ? n : ret.largest_result_index;
                            }
                        }
                    }
                }
            }
        }

        ret.usage_qubit_counts  = qubits_used.size();
        ret.usage_result_counts = results_used.size();

        return ret;
    }

    void StaticResourcePass::annotateQubits(llvm::Module& module) const
    {
        if (config_.shouldAnnotateResultUse() || config_.shouldAnnotateQubitUse())
        {
            for (auto& function : module)
            {
                if (function.isDeclaration())
                {
                    continue;
                }

                auto stats = getLargestIndices(function);

                if (config_.shouldAnnotateQubitUse())
                {
                    std::stringstream ss{""};
                    ss << stats.usage_qubit_counts;
                    function.addFnAttr("requiredQubits", ss.str());
                }

                if (config_.shouldAnnotateMaxQubitIndex())
                {
                    std::stringstream ss{""};
                    ss << stats.largest_qubit_index;
                    function.addFnAttr("maxQubitIndex", ss.str());
                }

                if (config_.shouldAnnotateResultUse())
                {
                    std::stringstream ss{""};
                    ss << stats.usage_result_counts;
                    function.addFnAttr("requiredResults", ss.str());
                }

                if (config_.shouldAnnotateMaxResultIndex())
                {
                    std::stringstream ss{""};
                    ss << stats.largest_result_index;
                    function.addFnAttr("maxResultIndex", ss.str());
                }
            }
        }
    }

    void StaticResourcePass::allocateOnReset(llvm::Module& /*module*/) const
    {
        // TODO(tfr): needs implementation
    }

    llvm::PreservedAnalyses StaticResourcePass::run(llvm::Module& module, llvm::ModuleAnalysisManager& /*mam*/)
    {
        if (!enforceRequirements(module))
        {
            return llvm::PreservedAnalyses::none();
        }

        remapQubits(module);

        allocateOnReset(module);

        annotateQubits(module);

        return llvm::PreservedAnalyses::all();
    }

    bool StaticResourcePass::isRequired()
    {
        return true;
    }

} // namespace quantum
} // namespace microsoft

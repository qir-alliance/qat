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

    void StaticResourcePass::annotateQubits(llvm::Module& module) const
    {
        if (config_.shouldAnnotateResultUse() || config_.shouldAnnotateQubitUse())
        {
            for (auto& function : module)
            {
                uint64_t                     largest_qubit_index  = 0;
                uint64_t                     largest_result_index = 0;
                std::unordered_set<uint64_t> qubits_used{};
                std::unordered_set<uint64_t> results_used{};

                for (auto& block : function)
                {
                    for (auto& instr : block)
                    {
                        for (auto& op : instr.operands())
                        {
                            auto* a = llvm::dyn_cast<llvm::IntToPtrInst>(op);
                            auto* b =
                                llvm::dyn_cast<llvm::ConcreteOperator<llvm::Operator, llvm::Instruction::IntToPtr>>(op);

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
                                        largest_qubit_index = largest_qubit_index < n ? n : largest_qubit_index;
                                    }

                                    // Updating result index
                                    if (type_name == "Result")
                                    {
                                        results_used.insert(n);
                                        largest_result_index = largest_result_index < n ? n : largest_result_index;
                                    }
                                }
                            }
                        }
                    }
                }

                if (config_.shouldAnnotateQubitUse())
                {
                    std::stringstream ss{""};
                    ss << qubits_used.size();
                    function.addFnAttr("requiredQubits", ss.str());
                }

                if (config_.shouldAnnotateMaxQubitIndex())
                {
                    std::stringstream ss{""};
                    ss << largest_qubit_index;
                    function.addFnAttr("maxQubitIndex", ss.str());
                }

                if (config_.shouldAnnotateResultUse())
                {
                    std::stringstream ss{""};
                    ss << results_used.size();
                    function.addFnAttr("requiredResults", ss.str());
                }

                if (config_.shouldAnnotateMaxResultIndex())
                {
                    std::stringstream ss{""};
                    ss << largest_result_index;
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

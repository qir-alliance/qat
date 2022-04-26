// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "StaticResourcePass/AllocationAnalysisPass.hpp"

#include "Llvm/Llvm.hpp"

#include <fstream>
#include <iostream>

namespace microsoft
{
namespace quantum
{

    llvm::AnalysisKey AllocationAnalysisPass::Key;

    bool AllocationAnalysisPass::extractResourceId(llvm::Value* value, uint64_t& return_value, ResourceType& type) const
    {
        auto* instruction_ptr = llvm::dyn_cast<llvm::IntToPtrInst>(value);
        auto* operator_ptr = llvm::dyn_cast<llvm::ConcreteOperator<llvm::Operator, llvm::Instruction::IntToPtr>>(value);

        auto* nullptr_cast = llvm::dyn_cast<llvm::ConstantPointerNull>(value);

        if (instruction_ptr || operator_ptr || nullptr_cast)
        {

            auto pointer_type = llvm::dyn_cast<llvm::PointerType>(value->getType());
            if (!pointer_type)
            {
                return false;
            }

            llvm::Type* element_type = pointer_type->getElementType();

            if (!element_type->isStructTy())
            {
                return false;
            }

            type           = ResourceType::NotResource;
            auto type_name = static_cast<String>(element_type->getStructName());
            if (type_name == "Qubit")
            {
                type = ResourceType::QubitResource;
            }

            if (type_name == "Result")
            {
                type = ResourceType::ResultResource;
            }

            if (type == ResourceType::NotResource)
            {
                return false;
            }

            bool     is_constant_int = nullptr_cast != nullptr;
            uint64_t n               = 0;

            auto user = llvm::dyn_cast<llvm::User>(value);

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

            if (is_constant_int)
            {
                return_value = n;
                return true;
            }
        }

        return false;
    }

    AllocationAnalysisPass::Result AllocationAnalysisPass::run(
        llvm::Function& function,
        llvm::FunctionAnalysisManager& /*fam*/)
    {
        AllocationAnalysis ret;

        std::unordered_set<uint64_t> qubits_used{};
        std::unordered_set<uint64_t> results_used{};

        for (auto& block : function)
        {
            for (auto& instr : block)
            {
                for (uint64_t i = 0; i < instr.getNumOperands(); ++i)
                {
                    auto         op   = instr.getOperand(i);
                    ResourceType type = ResourceType::NotResource;
                    uint64_t     n    = 0;

                    // Checking if it is a qubit resource reference and extracting the corresponding
                    // id and type. Otherwise, we skip to the next operand.
                    if (!extractResourceId(op, n, type))
                    {
                        continue;
                    }

                    // TODO: Refactor ResourceId -> ResourceAccessLocation
                    ResourceId value{op, type, n, &instr, i};
                    ret.access_map[op] = value;
                    ret.resource_access.push_back(value);

                    switch (type)
                    {
                    case ResourceType::QubitResource:
                        qubits_used.insert(n);
                        ret.largest_qubit_index = ret.largest_qubit_index < n ? n : ret.largest_qubit_index;

                        break;
                    case ResourceType::ResultResource:
                        results_used.insert(n);
                        ret.largest_result_index = ret.largest_result_index < n ? n : ret.largest_result_index;
                        break;
                    case ResourceType::NotResource:
                    default:
                        break;
                    }
                }
            }
        }

        ret.usage_qubit_counts  = qubits_used.size();
        ret.usage_result_counts = results_used.size();

        return ret;
    }

    bool AllocationAnalysisPass::isRequired()
    {
        return true;
    }

    llvm::PreservedAnalyses AllocationAnalysisPassPrinter::run(
        llvm::Function&                module,
        llvm::FunctionAnalysisManager& fam)
    {
        auto& result = fam.getResult<AllocationAnalysisPass>(module);
        llvm::errs() << result.largest_qubit_index << " qc cc blocks.\n";
        llvm::errs() << result.largest_result_index << " qc mc cc blocks.\n";

        return llvm::PreservedAnalyses::all();
    }

} // namespace quantum
} // namespace microsoft

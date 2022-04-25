// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "StaticResourcePass/AllocationAnalysisPass.hpp"

#include "Llvm/Llvm.hpp"

#include <fstream>
#include <iostream>

namespace microsoft {
namespace quantum {

llvm::AnalysisKey AllocationAnalysisPass::Key;

AllocationAnalysisPass::Result AllocationAnalysisPass::run(llvm::Function &function,
                                                           llvm::FunctionAnalysisManager & /*fam*/)
{
  AllocationAnalysis ret;

  std::unordered_set<uint64_t> qubits_used{};
  std::unordered_set<uint64_t> results_used{};

  for (auto &block : function)
  {
    for (auto &instr : block)
    {
      for (auto &op : instr.operands())
      {
        auto *a = llvm::dyn_cast<llvm::IntToPtrInst>(op);
        auto *b =
            llvm::dyn_cast<llvm::ConcreteOperator<llvm::Operator, llvm::Instruction::IntToPtr>>(op);

        auto *nullptr_cast = llvm::dyn_cast<llvm::ConstantPointerNull>(op);

        if (a || b || nullptr_cast)
        {

          auto pointer_type = llvm::dyn_cast<llvm::PointerType>(op->getType());
          if (!pointer_type)
          {
            continue;
          }

          llvm::Type *element_type = pointer_type->getElementType();

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
              ret.largest_result_index =
                  ret.largest_result_index < n ? n : ret.largest_result_index;
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

bool AllocationAnalysisPass::isRequired()
{
  return true;
}

llvm::PreservedAnalyses AllocationAnalysisPassPrinter::run(llvm::Function                &module,
                                                           llvm::FunctionAnalysisManager &fam)
{
  auto &result = fam.getResult<AllocationAnalysisPass>(module);
  llvm::errs() << result.largest_qubit_index << " qc cc blocks.\n";
  llvm::errs() << result.largest_result_index << " qc mc cc blocks.\n";

  return llvm::PreservedAnalyses::all();
}

}  // namespace quantum
}  // namespace microsoft

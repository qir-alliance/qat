// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "StaticResourcePass/QubitRemapPass.hpp"

#include "Llvm/Llvm.hpp"
#include "Logging/ILogger.hpp"
#include "Profile/Profile.hpp"
#include "QatTypes/QatTypes.hpp"
#include "StaticResourcePass/AllocationAnalysisPass.hpp"
#include "StaticResourcePass/StaticResourcePassConfiguration.hpp"

#include <functional>
#include <unordered_map>
#include <vector>

namespace microsoft {
namespace quantum {

QubitRemapPass::QubitRemapPass(StaticResourcePassConfiguration const &cfg, ILoggerPtr const &logger)
  : config_{cfg}
  , logger_{logger}
{}

bool QubitRemapPass::extractResourceId(llvm::Value *value, uint64_t &return_value,
                                       ResourceType &type) const
{
  auto *instruction_ptr = llvm::dyn_cast<llvm::IntToPtrInst>(value);
  auto *operator_ptr =
      llvm::dyn_cast<llvm::ConcreteOperator<llvm::Operator, llvm::Instruction::IntToPtr>>(value);

  auto *nullptr_cast = llvm::dyn_cast<llvm::ConstantPointerNull>(value);

  if (instruction_ptr || operator_ptr || nullptr_cast)
  {

    auto pointer_type = llvm::dyn_cast<llvm::PointerType>(value->getType());
    if (!pointer_type)
    {
      return false;
    }

    llvm::Type *element_type = pointer_type->getElementType();

    if (!element_type->isStructTy())
    {
      return false;
    }

    type           = ResourceType::None;
    auto type_name = static_cast<String>(element_type->getStructName());
    if (type_name == "Qubit")
    {
      type = Qubit;
    }

    if (type_name == "Result")
    {
      type = Result;
    }

    if (type == None)
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

llvm::PreservedAnalyses QubitRemapPass::run(llvm::Function                &function,
                                            llvm::FunctionAnalysisManager &fam)
{
  if (!config_.shouldReindexQubits())
  {
    return llvm::PreservedAnalyses::none();
  }

  auto &function_details = fam.getResult<AllocationAnalysisPass>(function);

  llvm::IRBuilder<> builder{function.getContext()};

  std::unordered_map<uint64_t, uint64_t> qubits_mapping{};
  std::unordered_map<uint64_t, uint64_t> results_mapping{};
  std::unordered_set<llvm::Value *>      already_replaced{};
  auto                                   last_qubit_index = function_details.largest_qubit_index;

  for (auto &block : function)
  {
    for (auto &instr : block)
    {
      auto call_instr = llvm::dyn_cast<llvm::CallInst>(&instr);
      if (call_instr && config_.shouldReplaceQubitsOnReset())
      {
        auto f = call_instr->getCalledFunction();
        if (f == nullptr)
        {
          continue;
        }

        auto call_name = static_cast<std::string>(f->getName());
        if (call_name == "__quantum__qis__reset__body")
        {
          ResourceType type = ResourceType::None;
          uint64_t     n    = 0;
          auto         op   = call_instr->getOperand(0);

          if (extractResourceId(op, n, type))
          {
            qubits_mapping[n] = ++last_qubit_index;
          }
        }
      }

      for (uint64_t i = 0; i < instr.getNumOperands(); ++i)
      {
        auto op = instr.getOperand(i);
        // In case we already did the mapping, we skip to next instruction
        if (already_replaced.find(op) != already_replaced.end())
        {
          continue;
        }
        ResourceType type = ResourceType::None;
        uint64_t     n    = 0;

        // We only perform the mapping for constant integer casts. Anything else
        // cannot be remapped.
        if (extractResourceId(op, n, type))
        {
          uint64_t remapped_index = 0;

          // Getting remapped index based on resource type
          if (type == Qubit)
          {
            if (qubits_mapping.find(n) == qubits_mapping.end())
            {
              remapped_index    = config_.shouldReindexQubits() ? qubits_mapping.size() : n;
              qubits_mapping[n] = remapped_index;
            }
            else
            {
              remapped_index = qubits_mapping[n];
            }
          }
          else if (type == Result)
          {
            if (results_mapping.find(n) == results_mapping.end())
            {
              remapped_index     = results_mapping.size();
              results_mapping[n] = config_.shouldReindexQubits() ? qubits_mapping.size() : n;
            }
            else
            {
              remapped_index = results_mapping[n];
            }
          }

          auto pointer_type = llvm::dyn_cast<llvm::PointerType>(op->getType());
          if (!pointer_type)
          {
            continue;
          }

          // Creating new instruction with remapped index
          builder.SetInsertPoint(&instr);

          auto idx = llvm::APInt(64, remapped_index);

          auto         new_index = llvm::ConstantInt::get(function.getContext(), idx);
          llvm::Value *new_instr = nullptr;
          new_instr              = nullptr;

          new_instr = new llvm::IntToPtrInst(new_index, pointer_type);
          builder.Insert(new_instr);

          instr.setOperand(i, new_instr);
          already_replaced.insert(new_instr);
        }
      }
    }
  }

  return llvm::PreservedAnalyses::all();
}

bool QubitRemapPass::isRequired()
{
  return true;
}
}  // namespace quantum
}  // namespace microsoft

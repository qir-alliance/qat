// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "GroupingPass/GroupingPass.hpp"

#include "GroupingPass/GroupingAnalysisPass.hpp"
#include "Llvm/Llvm.hpp"

#include <fstream>
#include <iostream>

namespace microsoft {
namespace quantum {

bool GroupingPass::isRequired()
{
  return true;
}

void GroupingPass::expandBlockQuantumClassical(llvm::Module &    module,
                                               llvm::BasicBlock *tail_classical)
{
  auto &            context = module.getContext();
  llvm::IRBuilder<> classical_builder(context);
  llvm::IRBuilder<> quantum_builder(context);

  std::vector<llvm::Instruction *> to_delete;

  auto quantum_block =
      llvm::BasicBlock::Create(context, "quantum", tail_classical->getParent(), tail_classical);

  auto classical_block =
      llvm::BasicBlock::Create(context, "classical", tail_classical->getParent(), quantum_block);

  classical_block->takeName(tail_classical);
  tail_classical->setName("tail_classical");

  tail_classical->replaceUsesWithIf(classical_block, [](llvm::Use &use) {
    auto *phi_node = llvm::dyn_cast<llvm::PHINode>(use.getUser());
    llvm::errs() << "Testing user: " << *use.getUser() << " => " << (phi_node == nullptr) << "\n";
    return (phi_node == nullptr);
  });

  // TODO: Figure out if we want to store the quantum circuit in a separate function

  classical_builder.SetInsertPoint(classical_block);
  quantum_builder.SetInsertPoint(quantum_block);

  for (auto &instr : *tail_classical)
  {
    // Leaving all quantum instructions
    auto call_instr = llvm::dyn_cast<llvm::CallBase>(&instr);
    if (call_instr != nullptr)
    {
      auto f = call_instr->getCalledFunction();
      if (f != nullptr)
      {

        auto name       = static_cast<std::string>(f->getName());
        bool is_quantum = (name.size() >= GroupingAnalysisPass::QIS_START.size() &&
                           name.substr(0, GroupingAnalysisPass::QIS_START.size()) ==
                               GroupingAnalysisPass::QIS_START);
        bool is_readout = (name.size() >= GroupingAnalysisPass::READ_INSTR_START.size() &&
                           name.substr(0, GroupingAnalysisPass::READ_INSTR_START.size()) ==
                               GroupingAnalysisPass::READ_INSTR_START);

        if (is_readout)
        {
          throw std::runtime_error("Did not expect readout in this block.");
        }

        if (is_quantum)
        {
          auto new_instr = instr.clone();
          quantum_builder.Insert(new_instr);
          instr.replaceAllUsesWith(new_instr);
          to_delete.push_back(&instr);
          continue;
        }
      }
    }

    // Only the terminator survives in the tail block
    if (instr.isTerminator())
    {
      continue;
    }

    // Moving remaining
    auto new_instr = instr.clone();
    classical_builder.Insert(new_instr);
    instr.replaceAllUsesWith(new_instr);
    to_delete.push_back(&instr);
  }

  classical_builder.CreateBr(quantum_block);
  quantum_builder.CreateBr(tail_classical);

  for (auto it = to_delete.rbegin(); it != to_delete.rend(); ++it)
  {
    auto ptr = *it;
    if (ptr->use_empty())
    {
      ptr->eraseFromParent();
    }
  }
}

void GroupingPass::expandBlockQuantumMeasureClassical(llvm::Module &    module,
                                                      llvm::BasicBlock *tail_classical)
{
  auto &            context = module.getContext();
  llvm::IRBuilder<> classical_builder(context);
  llvm::IRBuilder<> quantum_builder(context);
  llvm::IRBuilder<> readout_builder(context);

  std::vector<llvm::Instruction *>  to_delete;
  std::unordered_set<llvm::Value *> depends_on_readout;

  auto readout_block =
      llvm::BasicBlock::Create(context, "readout", tail_classical->getParent(), tail_classical);

  auto quantum_block =
      llvm::BasicBlock::Create(context, "quantum", tail_classical->getParent(), readout_block);

  auto classical_block =
      llvm::BasicBlock::Create(context, "classical", tail_classical->getParent(), quantum_block);

  classical_block->takeName(tail_classical);
  tail_classical->setName("tail_classical");
  tail_classical->replaceUsesWithIf(classical_block, [](llvm::Use &use) {
    auto *phi_node = llvm::dyn_cast<llvm::PHINode>(use.getUser());
    llvm::errs() << "Testing user: " << *use.getUser() << " => " << (phi_node == nullptr) << "\n";
    return (phi_node == nullptr);
  });

  // TODO: Figure out if we want to store the quantum circuit in a separate function

  classical_builder.SetInsertPoint(classical_block);
  quantum_builder.SetInsertPoint(quantum_block);
  readout_builder.SetInsertPoint(readout_block);

  auto orig_quantum              = quantum_block;
  bool new_quantum_measure_cycle = false;

  for (auto &instr : *tail_classical)
  {
    // Leaving all quantum instructions
    auto call_instr = llvm::dyn_cast<llvm::CallBase>(&instr);
    if (call_instr != nullptr)
    {
      auto f = call_instr->getCalledFunction();
      if (f != nullptr)
      {

        auto name       = static_cast<std::string>(f->getName());
        bool is_quantum = (name.size() >= GroupingAnalysisPass::QIS_START.size() &&
                           name.substr(0, GroupingAnalysisPass::QIS_START.size()) ==
                               GroupingAnalysisPass::QIS_START);
        bool is_readout = (name.size() >= GroupingAnalysisPass::READ_INSTR_START.size() &&
                           name.substr(0, GroupingAnalysisPass::READ_INSTR_START.size()) ==
                               GroupingAnalysisPass::READ_INSTR_START);

        if (is_readout)
        {
          for (auto user : instr.users())
          {
            depends_on_readout.insert(user);
          }

          auto new_instr = instr.clone();
          readout_builder.Insert(new_instr);
          instr.replaceAllUsesWith(new_instr);
          to_delete.push_back(&instr);

          // new_quantum_measure_cycle = true;
          continue;
        }

        if (is_quantum)
        {

          if (new_quantum_measure_cycle)
          {
            // Creating new measure context
            quantum_builder.CreateBr(readout_block);
            quantum_block = llvm::BasicBlock::Create(context, "quantum",
                                                     tail_classical->getParent(), tail_classical);

            readout_builder.CreateBr(quantum_block);
            readout_block = llvm::BasicBlock::Create(context, "readout",
                                                     tail_classical->getParent(), tail_classical);

            // Moving the builders to the new blocks
            quantum_builder.SetInsertPoint(quantum_block);
            readout_builder.SetInsertPoint(readout_block);
            new_quantum_measure_cycle = false;
          }

          auto new_instr = instr.clone();
          quantum_builder.Insert(new_instr);
          instr.replaceAllUsesWith(new_instr);
          to_delete.push_back(&instr);
          continue;
        }
      }
    }

    // Only the terminator survives in the tail block
    if (instr.isTerminator())
    {
      continue;
    }

    // Check if depends on readout
    if (depends_on_readout.find(&instr) != depends_on_readout.end())
    {
      for (auto user : instr.users())
      {
        depends_on_readout.insert(user);
      }

      continue;
    }

    // Moving remaining
    auto new_instr = instr.clone();
    classical_builder.Insert(new_instr);
    instr.replaceAllUsesWith(new_instr);
    to_delete.push_back(&instr);
  }

  classical_builder.CreateBr(orig_quantum);
  quantum_builder.CreateBr(readout_block);
  readout_builder.CreateBr(tail_classical);

  for (auto it = to_delete.rbegin(); it != to_delete.rend(); ++it)
  {
    auto ptr = *it;
    if (ptr->use_empty())
    {
      ptr->eraseFromParent();
    }
  }
}

llvm::PreservedAnalyses GroupingPass::run(llvm::Module &module, llvm::ModuleAnalysisManager &mam)
{
  auto &result = mam.getResult<GroupingAnalysisPass>(module);

  for (auto *block : result.qc_cc_blocks)
  {
    expandBlockQuantumClassical(module, block);
  }

  for (auto *block : result.qc_mc_cc_blocks)
  {
    expandBlockQuantumMeasureClassical(module, block);
  }

  llvm::errs() << result.qc_cc_blocks.size() << " xx qc cc blocks.\n";
  llvm::errs() << result.qc_mc_cc_blocks.size() << " xx qc mc cc blocks.\n";

  return llvm::PreservedAnalyses::none();
}

}  // namespace quantum
}  // namespace microsoft

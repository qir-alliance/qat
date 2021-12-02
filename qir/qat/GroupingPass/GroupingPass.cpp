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

bool GroupingPass::isQuantumRegister(llvm::Type const *type)
{
  if (type->isPointerTy())
  {
    auto element_type = type->getPointerElementType();
    if (element_type->isStructTy())
    {
      auto type_name = static_cast<String>(element_type->getStructName());
      return quantum_register_types_.find(type_name) != quantum_register_types_.end();
    }
  }

  return false;
}

int64_t GroupingPass::classifyInstruction(llvm::Instruction const *instr)
{
  llvm::errs() << *instr << " -- \n";
  int64_t ret = PURE_CLASSICAL;

  // Checking all operations
  bool any_quantum     = false;
  bool any_classical   = false;
  bool is_void         = instr->getType()->isVoidTy();
  bool returns_quantum = isQuantumRegister(instr->getType());

  auto call = llvm::dyn_cast<llvm::CallBase>(instr);
  if (call != nullptr)
  {
    for (auto &arg : call->args())
    {
      auto q = isQuantumRegister(arg->getType());
      any_quantum |= q;
      any_classical |= !q;
    }

    if (returns_quantum || is_void && !any_classical && any_quantum)
    {
      ret |= DEST_QUANTUM;
    }
  }
  else
  {
    for (auto &op : instr->operands())
    {
      auto q = isQuantumRegister(op->getType());
      any_quantum |= q;
      any_classical |= !q;
    }

    // Setting the destination platform
    if (returns_quantum)
    {
      ret |= DEST_QUANTUM;

      // If no classical or quantum arguments present, then destination dictates
      // source
      if (!any_quantum && !any_classical)
      {
        ret |= SOURCE_QUANTUM;
      }
    }
  }

  if (any_quantum && any_classical)
  {
    if (ret != DEST_QUANTUM)
    {
      ret = INVALID_MIXED_LOCATION;
    }
  }

  else if (any_quantum)
  {
    ret |= SOURCE_QUANTUM;
  }

  return ret;
}

void GroupingPass::prepareBlockModification(llvm::Module &module, llvm::BasicBlock *tail_classical)
{
  // Creating replacement blocks
  auto &context         = module.getContext();
  post_classical_block_ = llvm::BasicBlock::Create(context, "post-classical",
                                                   tail_classical->getParent(), tail_classical);

  readout_block_ = llvm::BasicBlock::Create(context, "readout", tail_classical->getParent(),
                                            post_classical_block_);

  quantum_block_ =
      llvm::BasicBlock::Create(context, "quantum", tail_classical->getParent(), readout_block_);

  load_block_ =
      llvm::BasicBlock::Create(context, "load", tail_classical->getParent(), quantum_block_);

  pre_classical_block_ =
      llvm::BasicBlock::Create(context, "pre-classical", tail_classical->getParent(), load_block_);

  // Renaming the block
  pre_classical_block_->takeName(tail_classical);

  // Preparing builders
  post_classical_builder_->SetInsertPoint(post_classical_block_);
  readout_builder_->SetInsertPoint(readout_block_);
  quantum_builder_->SetInsertPoint(quantum_block_);
  load_builder_->SetInsertPoint(load_block_);
  pre_classical_builder_->SetInsertPoint(pre_classical_block_);

  // Replacing entry
  tail_classical->setName("exit_quantum_grouping");
  tail_classical->replaceUsesWithIf(pre_classical_block_, [](llvm::Use &use) {
    auto *phi_node = llvm::dyn_cast<llvm::PHINode>(use.getUser());
    return (phi_node == nullptr);
  });
}

void GroupingPass::nextQuantumCycle(llvm::Module &module, llvm::BasicBlock *tail_classical)
{
  auto &context = module.getContext();

  pre_classical_builder_->CreateBr(load_block_);
  load_builder_->CreateBr(quantum_block_);
  quantum_builder_->CreateBr(readout_block_);
  readout_builder_->CreateBr(post_classical_block_);

  //
  pre_classical_block_ = post_classical_block_;

  // Creating replacement blocks
  post_classical_block_ = llvm::BasicBlock::Create(context, "post-classical",
                                                   tail_classical->getParent(), tail_classical);

  readout_block_ = llvm::BasicBlock::Create(context, "readout", tail_classical->getParent(),
                                            post_classical_block_);

  quantum_block_ =
      llvm::BasicBlock::Create(context, "quantum", tail_classical->getParent(), readout_block_);

  load_block_ =
      llvm::BasicBlock::Create(context, "load", tail_classical->getParent(), quantum_block_);

  // Preparing builders
  post_classical_builder_->SetInsertPoint(post_classical_block_);
  readout_builder_->SetInsertPoint(readout_block_);
  quantum_builder_->SetInsertPoint(quantum_block_);
  load_builder_->SetInsertPoint(load_block_);
  pre_classical_builder_->SetInsertPoint(pre_classical_block_);
}

void GroupingPass::expandBlockQuantumMeasureClassical(llvm::Module     &module,
                                                      llvm::BasicBlock *tail_classical)
{
  prepareBlockModification(module, tail_classical);

  // Variables used for the modifications
  std::vector<llvm::Instruction *>  to_delete;
  std::unordered_set<llvm::Value *> depends_on_qc;
  std::unordered_set<llvm::Value *> post_classical_instructions;

  for (auto &instr : *tail_classical)
  {

    // Ignoring terminators
    // Only the terminator survives in the tail block
    if (instr.isTerminator())
    {
      continue;
    }

    auto instr_class = classifyInstruction(&instr);
    switch (instr_class)
    {
    case TRANSFER_CLASSICAL_TO_QUANTUM:
    case PURE_CLASSICAL: {
      // Check if depends on readout
      if (depends_on_qc.find(&instr) != depends_on_qc.end())
      {
        for (auto user : instr.users())
        {
          depends_on_qc.insert(user);
        }

        if (instr_class == TRANSFER_CLASSICAL_TO_QUANTUM)
        {
          nextQuantumCycle(module, tail_classical);
          depends_on_qc.clear();
          post_classical_instructions.clear();
        }
        else
        {
          // Inserting to post section
          auto new_instr = instr.clone();
          new_instr->takeName(&instr);
          post_classical_builder_->Insert(new_instr);
          instr.replaceAllUsesWith(new_instr);
          to_delete.push_back(&instr);

          post_classical_instructions.insert(new_instr);
          continue;
        }
      }

      // Post quantum section
      // Moving remaining to pre-section
      auto new_instr = instr.clone();

      new_instr->takeName(&instr);
      if (instr_class == TRANSFER_CLASSICAL_TO_QUANTUM)
      {
        load_builder_->Insert(new_instr);
      }
      else
      {
        pre_classical_builder_->Insert(new_instr);
      }

      instr.replaceAllUsesWith(new_instr);
      to_delete.push_back(&instr);
    }

    break;
    case TRANSFER_QUANTUM_TO_CLASSICAL:
    case PURE_QUANTUM: {
      // Checking if we are starting a new quantum program
      for (auto &op : instr.operands())
      {
        if (post_classical_instructions.find(op) != post_classical_instructions.end())
        {
          nextQuantumCycle(module, tail_classical);
          depends_on_qc.clear();
          post_classical_instructions.clear();
          break;
        }
      }

      // Marking all instructions that depend on a a read out
      for (auto user : instr.users())
      {
        depends_on_qc.insert(user);
      }

      // Moving the instruction to
      auto new_instr = instr.clone();
      new_instr->takeName(&instr);

      if (instr_class == TRANSFER_QUANTUM_TO_CLASSICAL)
      {
        readout_builder_->Insert(new_instr);
      }
      else
      {
        quantum_builder_->Insert(new_instr);
      }

      instr.replaceAllUsesWith(new_instr);
      to_delete.push_back(&instr);
      break;
    }

    default:
      throw std::runtime_error("Encountered instruction that could not be classified.");
    }
  }

  pre_classical_builder_->CreateBr(load_block_);
  load_builder_->CreateBr(quantum_block_);
  quantum_builder_->CreateBr(readout_block_);
  readout_builder_->CreateBr(post_classical_block_);
  post_classical_builder_->CreateBr(tail_classical);

  for (auto it = to_delete.rbegin(); it != to_delete.rend(); ++it)
  {
    auto ptr = *it;
    if (!ptr->use_empty())
    {
      llvm::errs() << ";; Error: Could not delete " << *ptr << "\n";
    }
    else
    {
      ptr->eraseFromParent();
    }
  }
}

llvm::PreservedAnalyses GroupingPass::run(llvm::Module &module, llvm::ModuleAnalysisManager &mam)
{
  auto &result = mam.getResult<GroupingAnalysisPass>(module);

  // Preparing builders
  auto &context           = module.getContext();
  pre_classical_builder_  = std::make_shared<llvm::IRBuilder<>>(context);
  load_builder_           = std::make_shared<llvm::IRBuilder<>>(context);
  quantum_builder_        = std::make_shared<llvm::IRBuilder<>>(context);
  readout_builder_        = std::make_shared<llvm::IRBuilder<>>(context);
  post_classical_builder_ = std::make_shared<llvm::IRBuilder<>>(context);

  for (auto *block : result.qc_cc_blocks)
  {
    expandBlockQuantumMeasureClassical(module, block);
  }

  for (auto *block : result.qc_mc_cc_blocks)
  {
    expandBlockQuantumMeasureClassical(module, block);
  }

  return llvm::PreservedAnalyses::none();
}

}  // namespace quantum
}  // namespace microsoft

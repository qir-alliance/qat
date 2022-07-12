// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "RecordPullBackPass.hpp"

#include "Llvm/Llvm.hpp"
#include "Logging/ILogger.hpp"
#include "QatTypes/QatTypes.hpp"
#include "RecordPullBackPass/RecordPullBackPass.hpp"

#include <functional>
#include <unordered_map>
#include <vector>

namespace microsoft::quantum {

llvm::PreservedAnalyses RecordPullBackPass::run(llvm::Function &module,
                                                llvm::FunctionAnalysisManager & /*mam*/)
{

  llvm::errs() << "xxx\n";
  return llvm::PreservedAnalyses::none();
}
/*
void RecordPullBackPass::raiseError(int64_t error_code, llvm::Module &module,
                                    llvm::Instruction *instr)
{
  llvm::IRBuilder<> builder(module.getContext());
  auto const       &final_block = instr->getParent();
  auto              if_block    = final_block->splitBasicBlock(instr, "if_ecc_not_set", true);
  auto start_block = if_block->splitBasicBlock(if_block->getTerminator(), "-INTERMEDIATE-", true);
  start_block->takeName(final_block);
  final_block->setName("ecc_set_finally");

  builder.SetInsertPoint(start_block->getTerminator());
  llvm::LoadInst *load = builder.CreateLoad(error_variable_);
  auto cmp = builder.CreateICmp(llvm::CmpInst::Predicate::ICMP_EQ, load, builder.getInt64(0));

  auto old_terminator = start_block->getTerminator();
  llvm::BranchInst::Create(if_block, final_block, cmp, start_block);
  old_terminator->eraseFromParent();

  builder.SetInsertPoint(if_block->getTerminator());
  builder.CreateStore(builder.getInt64(error_code), error_variable_);
}
*/
bool RecordPullBackPass::isRequired()
{
  return true;
}
}  // namespace microsoft::quantum
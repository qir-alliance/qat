// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/FunctionReplacementPass/FunctionReplacementAnalysisPass.hpp"

#include "qir/qat/Llvm/Llvm.hpp"

#include <fstream>
#include <iostream>

namespace microsoft::quantum {
String const FunctionReplacementAnalysisPass::QIS_START =
    "__quantum"
    "__qis_";
String const FunctionReplacementAnalysisPass::READ_INSTR_START =
    "__quantum"
    "__qis__read_";
llvm::AnalysisKey FunctionReplacementAnalysisPass::Key;

FunctionReplacementAnalysisPass::Result FunctionReplacementAnalysisPass::run(
    llvm::Module &module, llvm::ModuleAnalysisManager & /*mam*/)
{
  FunctionRegister ret;

  return ret;
}

bool FunctionReplacementAnalysisPass::isRequired()
{
  return true;
}

llvm::PreservedAnalyses FunctionReplacementAnalysisPassPrinter::run(
    llvm::Module &module, llvm::ModuleAnalysisManager &mam)
{
  auto &result = mam.getResult<FunctionReplacementAnalysisPass>(module);

  return llvm::PreservedAnalyses::all();
}

}  // namespace microsoft::quantum

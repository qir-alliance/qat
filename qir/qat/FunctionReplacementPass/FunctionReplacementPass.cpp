// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/FunctionReplacementPass/FunctionReplacementPass.hpp"

#include "qir/qat/FunctionReplacementPass/FunctionReplacementAnalysisPass.hpp"
#include "qir/qat/Llvm/Llvm.hpp"

#include <fstream>
#include <iostream>

namespace microsoft::quantum {

bool FunctionReplacementPass::isRequired()
{
  return true;
}

llvm::PreservedAnalyses FunctionReplacementPass::run(llvm::Module                &module,
                                                     llvm::ModuleAnalysisManager &mam)
{
  auto &result = mam.getResult<FunctionReplacementAnalysisPass>(module);

  return llvm::PreservedAnalyses::none();
}

void FunctionReplacementPass::setLogger(ILoggerPtr logger)
{
  logger_ = std::move(logger);
}

}  // namespace microsoft::quantum

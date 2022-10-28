// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/StaticResourceComponent/ResourceAnnotationPass.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/StaticResourceComponent/AllocationAnalysisPass.hpp"

#include <fstream>
#include <iostream>

namespace microsoft::quantum
{

ResourceAnnotationPass::ResourceAnnotationPass(
    StaticResourceComponentConfiguration const& cfg,
    ILoggerPtr const&                           logger)
  : config_{cfg}
  , logger_{logger}
{
}

llvm::PreservedAnalyses ResourceAnnotationPass::run(llvm::Function& function, llvm::FunctionAnalysisManager& fam)
{
    if (!config_.shouldAnnotateResultUse() && !config_.shouldAnnotateQubitUse())
    {
        return llvm::PreservedAnalyses::all();
    }

    auto stats = fam.getResult<AllocationAnalysisPass>(function);

    if (config_.shouldAnnotateQubitUse())
    {
        std::stringstream ss{""};
        ss << stats.usage_qubit_counts;

        function.addFnAttr(config_.requiredNumQubitsAttr(), ss.str());
    }

    if (config_.shouldAnnotateMaxQubitIndex())
    {
        std::stringstream ss{""};
        ss << stats.largest_qubit_index;
        function.addFnAttr(config_.maxIndexQubitsAttr(), ss.str());
    }

    if (config_.shouldAnnotateResultUse())
    {
        std::stringstream ss{""};
        ss << stats.usage_result_counts;
        function.addFnAttr(config_.requiredNumResultsAttr(), ss.str());
    }

    if (config_.shouldAnnotateMaxResultIndex())
    {
        std::stringstream ss{""};
        ss << stats.largest_result_index;
        function.addFnAttr(config_.maxIndexResultsAttr(), ss.str());
    }

    return llvm::PreservedAnalyses::none();
}

bool ResourceAnnotationPass::isRequired()
{
    return true;
}

} // namespace microsoft::quantum

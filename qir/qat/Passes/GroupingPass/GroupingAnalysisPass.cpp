// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/GroupingPass/GroupingAnalysisPass.hpp"

#include "qir/qat/Llvm/Llvm.hpp"

#include <fstream>
#include <iostream>

namespace microsoft::quantum
{
String const      GroupingAnalysisPass::QIS_START        = "__quantum"
                                                           "__qis_";
String const      GroupingAnalysisPass::READ_INSTR_START = "__quantum"
                                                           "__qis__read_";
llvm::AnalysisKey GroupingAnalysisPass::Key;

void GroupingAnalysisPass::runBlockAnalysis(llvm::Module& module)
{
    for (auto& function : module)
    {
        for (auto& block : function)
        {
            bool pure_quantum     = true;
            bool pure_measurement = true;

            // Classifying the blocks
            for (auto& instr : block)
            {
                auto call_instr = llvm::dyn_cast<llvm::CallBase>(&instr);
                if (call_instr != nullptr)
                {
                    auto f = call_instr->getCalledFunction();
                    if (f == nullptr)
                    {
                        continue;
                    }

                    auto name = static_cast<std::string>(f->getName());
                    bool is_quantum =
                        (name.size() >= QIS_START.size() && name.substr(0, QIS_START.size()) == QIS_START);
                    bool is_measurement =
                        (name.size() >= READ_INSTR_START.size() &&
                         name.substr(0, READ_INSTR_START.size()) == READ_INSTR_START);

                    if (is_measurement)
                    {
                        contains_quantum_measurement_.insert(&block);
                    }

                    if (is_quantum)
                    {
                        contains_quantum_circuit_.insert(&block);
                    }

                    pure_measurement = pure_measurement && is_measurement;
                    pure_quantum     = pure_quantum && is_quantum && !is_measurement;
                }
                else
                {
                    // Any other instruction is makes the block non-pure
                    pure_quantum     = false;
                    pure_measurement = false;
                }
            }

            if (pure_quantum)
            {
                pure_quantum_instructions_.insert(&block);
            }

            if (pure_measurement)
            {
                pure_quantum_measurement_.insert(&block);
            }
        }
    }
}

GroupingAnalysisPass::Result GroupingAnalysisPass::run(llvm::Module& module, llvm::ModuleAnalysisManager& /*mam*/)
{
    // Preparing analysis
    contains_quantum_circuit_.clear();
    contains_quantum_measurement_.clear();
    pure_quantum_instructions_.clear();
    pure_quantum_measurement_.clear();

    // Classifying each of the blocks
    runBlockAnalysis(module);

    GroupAnalysis ret;

    for (auto& function : module)
    {
        for (auto& block : function)
        {
            bool is_pure_quantum     = pure_quantum_instructions_.find(&block) != pure_quantum_instructions_.end();
            bool is_pure_measurement = pure_quantum_measurement_.find(&block) != pure_quantum_measurement_.end();

            // Pure blocks are ignored
            if (is_pure_quantum || is_pure_measurement)
            {
                continue;
            }

            bool has_quantum = contains_quantum_circuit_.find(&block) != contains_quantum_circuit_.end();

            // Pure classical blocks are also ignored
            if (!has_quantum)
            {
                continue;
            }

            bool has_measurement = contains_quantum_measurement_.find(&block) != contains_quantum_measurement_.end();

            // Differentiating between blocks that has measurements and those that has not
            if (!has_measurement)
            {
                ret.qc_cc_blocks.push_back(&block);
            }
            else
            {
                ret.qc_mc_cc_blocks.push_back(&block);
            }
        }
    }

    return ret;
}

bool GroupingAnalysisPass::isRequired()
{
    return true;
}

llvm::PreservedAnalyses GroupingAnalysisPassPrinter::run(llvm::Module& module, llvm::ModuleAnalysisManager& mam)
{
    auto& result = mam.getResult<GroupingAnalysisPass>(module);
    llvm::errs() << result.qc_cc_blocks.size() << " qc cc blocks.\n";
    llvm::errs() << result.qc_mc_cc_blocks.size() << " qc mc cc blocks.\n";

    return llvm::PreservedAnalyses::all();
}

} // namespace microsoft::quantum

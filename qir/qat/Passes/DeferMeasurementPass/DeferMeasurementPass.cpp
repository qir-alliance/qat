// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/DeferMeasurementPass/DeferMeasurementPass.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/ILogger.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <functional>
#include <stdexcept>
#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{

std::string const DeferMeasurementPass::RECORD_INSTR_END = "_record_output";
DeferMeasurementPass::DeferMeasurementPass() noexcept
  : readout_names_{
        {"__quantum__qis__m__body", "__quantum__qis__mz__body", "__quantum__qis__reset__body",
         "__quantum__qis__read_result__body"}}
{
}

llvm::PreservedAnalyses DeferMeasurementPass::run(llvm::Function& function, llvm::FunctionAnalysisManager& /*mam*/)
{

    for (auto& block : function)
    {
        // Identifying record functions
        std::vector<llvm::Instruction*> records;
        for (auto& instr : block)
        {
            auto call = llvm::dyn_cast<llvm::CallBase>(&instr);
            if (call != nullptr)
            {
                auto f = call->getCalledFunction();
                if (f != nullptr)
                {
                    auto name = static_cast<std::string>(f->getName());
                    bool is_readout =
                        (name.size() >= RECORD_INSTR_END.size() &&
                         name.substr(name.size() - RECORD_INSTR_END.size(), RECORD_INSTR_END.size()) ==
                             RECORD_INSTR_END);

                    if (is_readout || readout_names_.find(name) != readout_names_.end())
                    {
                        records.push_back(&instr);
                    }
                }
            }
        }

        // Moving function calls
        if (!records.empty())
        {
            llvm::IRBuilder<> builder(function.getContext());
            builder.SetInsertPoint(block.getTerminator());

            for (auto instr : records)
            {
                auto new_instr = instr->clone();
                new_instr->takeName(instr);
                builder.Insert(new_instr);
                instr->replaceAllUsesWith(new_instr);
                if (instr->use_empty())
                {
                    instr->eraseFromParent();
                }
                else
                {
                    throw std::runtime_error(
                        "Unexpected uses of instruction while moving records to the bottom of the block");
                }
            }
        }
    }

    return llvm::PreservedAnalyses::none();
}

bool DeferMeasurementPass::isRequired()
{
    return true;
}
} // namespace microsoft::quantum

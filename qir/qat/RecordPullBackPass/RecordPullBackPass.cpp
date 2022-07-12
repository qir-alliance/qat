// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "RecordPullBackPass.hpp"

#include "Logging/ILogger.hpp"
#include "QatTypes/QatTypes.hpp"
#include "RecordPullBackPass/RecordPullBackPass.hpp"

#include "Llvm/Llvm.hpp"

#include <functional>
#include <stdexcept>
#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{

std::string const RecordPullBackPass::RECORD_INSTR_END = "_record_output";

llvm::PreservedAnalyses RecordPullBackPass::run(llvm::Function& function, llvm::FunctionAnalysisManager& /*mam*/)
{

    llvm::BasicBlock* last_block = nullptr;

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

                    if (is_readout)
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

bool RecordPullBackPass::isRequired()
{
    return true;
}
} // namespace microsoft::quantum
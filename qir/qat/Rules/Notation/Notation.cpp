// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Rules/Notation/Notation.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Rules/Patterns/AnyPattern.hpp"
#include "qir/qat/Rules/Patterns/CallPattern.hpp"
#include "qir/qat/Rules/Patterns/Instruction.hpp"

#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{
namespace notation
{

    ReplacerFunction deleteInstruction()
    {
        return [](ReplacementRule::Builder&, ReplacementRule::Value* val, ReplacementRule::Captures&,
                  ReplacementRule::Replacements& replacements)
        {
            auto type  = val->getType();
            auto instr = llvm::dyn_cast<llvm::Instruction>(val);

            if (instr == nullptr)
            {
                return false;
            }

            val->replaceAllUsesWith(llvm::UndefValue::get(type));
            replacements.push_back({instr, nullptr});

            return true;
        };
    }

    ReplacerFunction deleteUnusedInstruction()
    {
        return [](ReplacementRule::Builder&, ReplacementRule::Value* val, ReplacementRule::Captures&,
                  ReplacementRule::Replacements& replacements)
        {
            std::unordered_map<llvm::Value*, llvm::Value*> replace_set{replacements.begin(), replacements.end()};

            auto instr = llvm::dyn_cast<llvm::Instruction>(val);

            if (instr)
            {
                bool is_used = false;
                for (auto u : instr->users())
                {
                    is_used |= replace_set.find(u) == replace_set.end();
                }

                if (instr->use_empty() || !is_used)
                {
                    replacements.push_back({instr, nullptr});
                    return true;
                }
            }

            return false;
        };
    }

} // namespace notation
} // namespace microsoft::quantum

// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Rules/RuleSet.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Rules/ReplacementRule.hpp"

#include <iostream>
#include <vector>
namespace microsoft::quantum
{

bool RuleSet::matchAndReplace(Instruction* value, Replacements& replacements, ReplaceDirection const& dir)
{
    Rules* rules = &rules_;
    if (dir == ReplaceDirection::ReplaceBackwards)
    {
        rules = &rules_backwards_;
    }

    Captures captures;
    for (auto const& rule : *rules)
    {
        // Checking if the rule is matched and keep track of captured nodes
        if (rule->match(value, captures))
        {

            // If it is matched, we attempt to replace it
            llvm::IRBuilder<> builder{value};
            if (rule->replace(builder, value, captures, replacements))
            {
                return true;
            }
            else
            {
                captures.clear();
            }
        }
    }
    return false;
}

void RuleSet::addRule(ReplacementRulePtr const& rule, ReplaceDirection const& dir)
{
    switch (dir)
    {
    case ReplaceDirection::ReplaceForwards:
        rules_.push_back(rule);
        break;
    case ReplaceDirection::ReplaceBackwards:
        rules_backwards_.push_back(rule);
        break;
    }
}

void RuleSet::addRule(ReplacementRule&& rule, ReplaceDirection const& dir)
{
    addRule(std::make_shared<ReplacementRule>(std::move(rule)), dir);
}

void RuleSet::clear()
{
    rules_.clear();
    rules_backwards_.clear();
}

uint64_t RuleSet::size() const
{
    return rules_.size() + rules_backwards_.size();
}
} // namespace microsoft::quantum

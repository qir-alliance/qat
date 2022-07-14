// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Rules/ReplacementRule.hpp"

namespace microsoft::quantum
{

ReplacementRule::ReplacementRule(IOperandPrototypePtr&& pattern, ReplaceFunction&& replacer)
  : pattern_{std::move(pattern)}
  , replacer_{std::move(replacer)}
{
}

ReplacementRule::ReplacementRule(String const& name, IOperandPrototypePtr&& pattern, ReplaceFunction&& replacer)
  : pattern_{std::move(pattern)}
  , replacer_{std::move(replacer)}
  , name_{name}
{
}

void ReplacementRule::setPattern(IOperandPrototypePtr&& pattern)
{
    pattern_ = std::move(pattern);
}

void ReplacementRule::setReplacer(ReplaceFunction const& replacer)
{
    replacer_ = replacer;
}

bool ReplacementRule::match(Value* value, Captures& captures) const
{
    if (pattern_ == nullptr)
    {
        return false;
    }

    return pattern_->match(value, captures);
}

bool ReplacementRule::replace(Builder& builder, Value* value, Captures& captures, Replacements& replacements) const
{
    if (replacer_)
    {
        auto ret = replacer_(builder, value, captures, replacements);

        // In case replacement failed, the captures are deleted.
        if (!ret)
        {
            captures.clear();
        }

        return ret;
    }

    return false;
}

String ReplacementRule::name() const
{
    return name_;
}

} // namespace microsoft::quantum

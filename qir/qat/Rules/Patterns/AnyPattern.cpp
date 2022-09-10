// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Rules/Patterns/AnyPattern.hpp"

#include "qir/qat/Rules/IOperandPrototype.hpp"

namespace microsoft::quantum
{

AnyPattern::AnyPattern()  = default;
AnyPattern::~AnyPattern() = default;
bool AnyPattern::match(Value* instr, Captures& captures) const
{
    return success(instr, captures);
}

AnyPattern::Child AnyPattern::copy() const
{
    return std::make_shared<AnyPattern>();
}

} // namespace microsoft::quantum

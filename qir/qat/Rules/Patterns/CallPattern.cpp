// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Rules/Patterns/CallPattern.hpp"

#include "qir/qat/Rules/IOperandPrototype.hpp"

namespace microsoft::quantum
{

CallPattern::CallPattern(String const& name)
  : name_{name}
{
}

CallPattern::~CallPattern() = default;

bool CallPattern::match(Value* instr, Captures& captures) const
{
    auto* call_instr = llvm::dyn_cast<llvm::CallBase>(instr);
    if (call_instr == nullptr)
    {
        return fail(instr, captures);
    }

    auto target_function = call_instr->getCalledFunction();
    if (target_function == nullptr)
    {
        return fail(instr, captures);
    }

    auto name = target_function->getName();

    if (name != name_)
    {
        return fail(instr, captures);
    }

    auto ret = success(instr, captures);
    return ret;
}

CallPattern::Child CallPattern::copy() const
{
    auto ret = std::make_shared<CallPattern>(name_);
    ret->copyPropertiesFrom(*this);
    return ret;
}

} // namespace microsoft::quantum

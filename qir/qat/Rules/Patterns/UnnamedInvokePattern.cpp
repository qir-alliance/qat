// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Rules/Patterns/UnnamedInvokePattern.hpp"

#include "qir/qat/Rules/IOperandPrototype.hpp"

namespace microsoft::quantum
{

UnnamedInvokePattern::~UnnamedInvokePattern() = default;

bool UnnamedInvokePattern::match(Value* instr, Captures& captures) const
{
    auto* call_instr = llvm::dyn_cast<llvm::InvokeInst>(instr);
    if (call_instr == nullptr)
    {
        return fail(instr, captures);
    }

    return success(instr, captures);
}

UnnamedInvokePattern::Child UnnamedInvokePattern::copy() const
{
    auto ret = std::make_shared<UnnamedInvokePattern>();
    ret->copyPropertiesFrom(*this);
    return ret;
}

} // namespace microsoft::quantum

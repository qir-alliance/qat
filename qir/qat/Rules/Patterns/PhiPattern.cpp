// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Rules/Patterns/PhiPattern.hpp"

#include "qir/qat/Rules/IOperandPrototype.hpp"

namespace microsoft::quantum
{

PhiPattern::~PhiPattern() = default;

bool PhiPattern::match(Value* instr, Captures& captures) const
{
    auto* phi_node = llvm::dyn_cast<llvm::PHINode>(instr);
    if (phi_node == nullptr)
    {
        return fail(instr, captures);
    }

    return success(instr, captures);
}

PhiPattern::Child PhiPattern::copy() const
{
    auto ret = std::make_shared<PhiPattern>();
    ret->copyPropertiesFrom(*this);
    return ret;
}

} // namespace microsoft::quantum

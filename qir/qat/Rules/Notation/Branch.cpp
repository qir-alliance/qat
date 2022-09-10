// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Rules/Notation/Notation.hpp"
#include "qir/qat/Rules/Patterns/AnyPattern.hpp"
#include "qir/qat/Rules/Patterns/CallPattern.hpp"
#include "qir/qat/Rules/Patterns/Instruction.hpp"

#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{
namespace notation
{

    using IOperandPrototypePtr = std::shared_ptr<IOperandPrototype>;

    IOperandPrototypePtr branch(
        IOperandPrototypePtr const& cond,
        IOperandPrototypePtr const& arg1,
        IOperandPrototypePtr const& arg2)
    {
        auto branch_pattern = std::make_shared<BranchPattern>();

        branch_pattern->addChild(cond);
        branch_pattern->addChild(arg1);
        branch_pattern->addChild(arg2);

        return static_cast<IOperandPrototypePtr>(branch_pattern);
    }

} // namespace notation
} // namespace microsoft::quantum

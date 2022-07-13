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

    IOperandPrototypePtr switchOp(
        IOperandPrototypePtr const& /*cond*/,
        IOperandPrototypePtr const& /*arg1*/,
        IOperandPrototypePtr const& /*arg2*/)
    {
        auto switch_pattern = std::make_shared<SwitchPattern>();

        // TODO(issue-17): finish switch pattern
        //  switch_pattern->addChild(cond);
        // switch_pattern->addChild(arg1);
        //  switch_pattern->addChild(arg2);

        return static_cast<IOperandPrototypePtr>(switch_pattern);
    }

} // namespace notation
} // namespace microsoft::quantum

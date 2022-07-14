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

    IOperandPrototypePtr constInt()
    {
        auto cast_pattern = std::make_shared<ConstIntPattern>();

        return static_cast<IOperandPrototypePtr>(cast_pattern);
    }

} // namespace notation
} // namespace microsoft::quantum

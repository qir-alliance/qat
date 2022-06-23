// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Rules/Notation/Notation.hpp"
#include "qir/qat/Rules/Patterns/Instruction.hpp"

#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{
namespace notation
{

    using IOperandPrototypePtr = std::shared_ptr<IOperandPrototype>;

    IOperandPrototypePtr basicBlock()
    {
        auto ret = std::make_shared<BasicBlockPattern>();

        return static_cast<IOperandPrototypePtr>(ret);
    }

} // namespace notation
} // namespace microsoft::quantum

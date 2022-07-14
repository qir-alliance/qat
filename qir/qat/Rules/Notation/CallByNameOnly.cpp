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

    IOperandPrototypePtr callByNameOnly(std::string const& name)
    {
        IOperandPrototypePtr ret = std::make_shared<CallPattern>(name);
        return ret;
    }

} // namespace notation
} // namespace microsoft::quantum

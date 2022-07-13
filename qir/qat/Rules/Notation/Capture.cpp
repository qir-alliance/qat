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

    Capture::Capture(std::string const& name)
      : name_{name}
    {
    }

    IOperandPrototypePtr Capture::operator=(IOperandPrototypePtr const& other) // NOLINT
    {
        auto ret = other->copy();
        ret->captureAs(name_);
        return ret;
    }

    Capture operator""_cap(char const* name, std::size_t)
    {
        return Capture(name);
    }

} // namespace notation
} // namespace microsoft::quantum

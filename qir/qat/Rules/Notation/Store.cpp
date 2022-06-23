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

    IOperandPrototypePtr store(IOperandPrototypePtr const& target, IOperandPrototypePtr const& value)
    {
        auto ret = std::make_shared<StorePattern>();

        ret->addChild(target);
        ret->addChild(value);
        return static_cast<IOperandPrototypePtr>(ret);
    }

} // namespace notation
} // namespace microsoft::quantum

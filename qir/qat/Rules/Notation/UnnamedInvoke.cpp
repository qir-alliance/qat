// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Rules/Notation/Notation.hpp"
#include "qir/qat/Rules/Patterns/UnnamedInvokePattern.hpp"

#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{
namespace notation
{

    using IOperandPrototypePtr = std::shared_ptr<IOperandPrototype>;

    IOperandPrototypePtr unnamedInvoke()
    {
        auto ret = std::make_shared<UnnamedInvokePattern>();

        return static_cast<IOperandPrototypePtr>(ret);
    }

} // namespace notation
} // namespace microsoft::quantum

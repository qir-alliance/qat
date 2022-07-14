#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Rules/Notation/Notation.hpp"
#include "qir/qat/Rules/Patterns/AnyPattern.hpp"
#include "qir/qat/Rules/Patterns/Instruction.hpp"
#include "qir/qat/Rules/Patterns/PhiPattern.hpp"
#include "qir/qat/Rules/ReplacementRule.hpp"

#include <unordered_map>
#include <vector>

namespace microsoft {
namespace quantum {
namespace notation {

using IOperandPrototypePtr = std::shared_ptr<IOperandPrototype>;

template <typename... Args>
IOperandPrototypePtr phi(Args... args)
{
  IOperandPrototypePtr              ret = std::make_shared<PhiPattern>();
  std::vector<IOperandPrototypePtr> arguments{args...};

  // Adding arguments to matching
  for (auto &a : arguments)
  {
    ret->addChild(a);
  }

  return ret;
}

}  // namespace notation
}  // namespace quantum
}  // namespace microsoft

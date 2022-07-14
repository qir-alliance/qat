#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Rules/IOperandPrototype.hpp"

#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{

/// Pattern that matches any operand.
class AnyPattern : public IOperandPrototype
{
  public:
    // Constructors.
    //
    AnyPattern();
    ~AnyPattern() override;

    // "Any" implementation of the member functions in IOperandPrototype.

    /// Match of any operand always returns true and ignores children.
    bool match(Value* instr, Captures& captures) const override;

    /// Creates a copy of the AnyPattern instance.
    Child copy() const override;
};

} // namespace microsoft::quantum

#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Rules/IOperandPrototype.hpp"

#include "qir/qat/Llvm/Llvm.hpp"

#include <unordered_map>
#include <vector>

namespace microsoft::quantum
{

class PhiPattern : public IOperandPrototype
{
  public:
    using String = std::string;

    // Construction of the call pattern by name or move only.
    //

    /// Construction by name.
    PhiPattern() = default;

    /// Copy construction prohibited.
    PhiPattern(PhiPattern const& other) = delete;

    /// Move construction allowed.
    PhiPattern(PhiPattern&& other) = default;

    /// Destructor implementation.
    ~PhiPattern() override;

    // Phi implementation of the member functions in IOperandPrototype.
    //

    /// Matches the phi node.
    bool match(Value* instr, Captures& captures) const override;

    /// Creates a copy of itself.
    Child copy() const override;
};

} // namespace microsoft::quantum

#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <vector>

namespace microsoft::quantum
{

struct SourceLocation
{
    using StringRef = llvm::StringRef;

    SourceLocation() = default;
    SourceLocation(String v_name, int64_t v_line, int64_t v_column)
      : name{v_name}
      , line{v_line}
      , column{v_column}
    {
    }

    enum
    {
        InvalidPosition = -1
    };

    operator bool() const
    {
        return line != InvalidPosition && column != InvalidPosition;
    }

    static SourceLocation InvalidPosition()
    {
        return {"", InvalidPosition, InvalidPosition};
    }

    String  name{};
    int64_t line{0};
    int64_t column{0};
};
} // namespace microsoft::quantum
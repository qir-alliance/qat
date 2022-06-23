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
        INVALID_POSITION = -1
    };

    operator bool() const
    {
        return line != INVALID_POSITION && column != INVALID_POSITION;
    }

    static SourceLocation InvalidPosition()
    {
        return {"", INVALID_POSITION, INVALID_POSITION};
    }

    String  name{};
    int64_t line{0};
    int64_t column{0};
};
} // namespace microsoft::quantum
#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Logging/ILogger.hpp"

#include "Llvm/Llvm.hpp"

#include <vector>

namespace microsoft
{
namespace quantum
{

    struct SourceLocation
    {
        using StringRef = llvm::StringRef;

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

        StringRef name{};
        int64_t   line{0};
        int64_t   column{0};
    };
} // namespace quantum
} // namespace microsoft
#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include <cstdint>
#include <string>

namespace microsoft::quantum
{
namespace version
{
    constexpr char const* const FULL             = "${MICROSOFT_VERSION_FULL}";
    constexpr uint32_t const    MAJOR            = ${MICROSOFT_VERSION_MAJOR};
    constexpr uint32_t const    MINOR            = ${MICROSOFT_VERSION_MINOR};
    constexpr uint32_t const    REVISION         = ${MICROSOFT_VERSION_REVISION};
    constexpr char const* const CHANNEL          = "${MICROSOFT_VERSION_CHANNEL}";
    constexpr uint32_t const    PATCH            = ${MICROSOFT_VERSION_PATCH};
    constexpr char const* const COMMIT_HASH      = "${MICROSOFT_VERSION_COMMIT}";
    constexpr bool const        WORK_IN_PROGRESS = ${MICROSOFT_VERSION_WIP};
} // namespace version

void displayCliHeader(bool extended_info = false);

} // namespace microsoft::quantum

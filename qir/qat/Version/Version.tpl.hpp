#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include <cstdint>
#include <string>

namespace microsoft::quantum {
namespace version {
constexpr char const *const FULL             = "$full_version";
constexpr uint32_t const    MAJOR            = $major;
constexpr uint32_t const    MINOR            = $minor;
constexpr uint32_t const    REVISION         = $revision;
constexpr char const *const CHANNEL          = "$channel";
constexpr uint32_t const    PATCH            = $patch;
constexpr char const *const COMMIT_HASH      = "$commit_hash";
constexpr bool const        WORK_IN_PROGRESS = $is_dirty;
constexpr bool const        VALID            = true;
}

void displayCliHeader(bool extended_info=false);

}  // namespace microsoft::quantum
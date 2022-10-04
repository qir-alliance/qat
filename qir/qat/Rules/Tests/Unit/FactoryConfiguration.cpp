// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "gtest/gtest.h"
#include "qir/qat/Passes/TargetQisMappingPass/TargetQisMappingPassConfiguration.hpp"

#include <functional>

using namespace microsoft::quantum;

// Single allocation with action and then release
TEST(RuleSetTestSuite, TargetQisMappingPassConfiguration)
{
    TargetQisMappingPassConfiguration c1 = TargetQisMappingPassConfiguration::createDisabled();
    EXPECT_TRUE(c1.isDisabled());

    TargetQisMappingPassConfiguration c2{};
    EXPECT_TRUE(c2.isDefault());
}

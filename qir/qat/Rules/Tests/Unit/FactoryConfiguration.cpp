// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "gtest/gtest.h"
#include "qir/qat/Passes/TransformationRulesPass/TransformationRulesPassConfiguration.hpp"

#include <functional>

using namespace microsoft::quantum;

// Single allocation with action and then release
TEST(RuleSetTestSuite, TransformationRulesPassConfiguration)
{
    TransformationRulesPassConfiguration c1 = TransformationRulesPassConfiguration::createDisabled();
    EXPECT_TRUE(c1.isDisabled());

    TransformationRulesPassConfiguration c2{};
    EXPECT_TRUE(c2.isDefault());
}

// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Generators/ConfigurableProfileGenerator.hpp"
#include "GroupingPass/GroupingPass.hpp"
#include "Rules/Factory.hpp"
#include "StaticResourceComponent/AllocationAnalysisPass.hpp"
#include "StaticResourceComponent/StaticResourceComponentConfiguration.hpp"
#include "TestTools/IrManipulationTestHelper.hpp"
#include "gtest/gtest.h"

#include "Llvm/Llvm.hpp"

#include <functional>

using namespace microsoft::quantum;

namespace
{
using IrManipulationTestHelperPtr = std::shared_ptr<IrManipulationTestHelper>;
IrManipulationTestHelperPtr newIrManip(std::string const& script)
{
    IrManipulationTestHelperPtr ir_manip = std::make_shared<IrManipulationTestHelper>();

    ir_manip->declareOpaque("Qubit");
    ir_manip->declareOpaque("Result");
    ir_manip->declareOpaque("Array");
    ir_manip->declareOpaque("Tuple");
    ir_manip->declareOpaque("Range");
    ir_manip->declareOpaque("Callable");
    ir_manip->declareOpaque("String");

    ir_manip->declareFunction("i1 @get_value()");
    ir_manip->declareFunction("void @a()");
    ir_manip->declareFunction("void @b()");
    ir_manip->declareFunction("void @c()");
    ir_manip->declareFunction("void @d()");

    if (!ir_manip->fromBodyString(script))
    {
        llvm::outs() << ir_manip->generateScript(script) << "\n\n";
        llvm::outs() << ir_manip->getErrorMessage() << "\n";
        exit(-1);
    }

    return ir_manip;
}
} // namespace

TEST(GeneratorsPostTransformLower, PostTransformLowerSwitch)
{
    auto                  ir_manip              = newIrManip(R"script(
  %0 = call i1 @get_value()
  %spec.select = select i1 %0, i64 2, i64 0
  %1 = call i1 @get_value()
  %2 = or i64 %spec.select, 1
  %rand.1 = select i1 %1, i64 %2, i64 %spec.select
  switch i64 %rand.1, label %then1__2 [
    i64 0, label %continue__3
    i64 1, label %then0__4
    i64 2, label %then2__2
  ]

then0__4:                                         ; preds = %entry
  call void @a()
  br label %continue__3

then2__2:                                         ; preds = %entry
  call void @b()
  br label %continue__3

then1__2:                                         ; preds = %entry
  call void @c()
  br label %continue__3

continue__3:                                      ; preds = %entry, %then1__2, %then2__2, %then0__4
  call void @d()
  )script");
    auto                  profile               = std::make_shared<ConfigurableProfileGenerator>();
    ConfigurationManager& configuration_manager = profile->configurationManager();

    configuration_manager.addConfig<FactoryConfiguration>();
    configuration_manager.setConfig(LlvmPassesConfiguration::createDisabled());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());

    EXPECT_TRUE(ir_manip->hasInstructionSequence(
        {"switch i64 %rand.1, label %then1__2 [", "i64 0, label %continue__3", "i64 1, label %then0__4",
         "i64 2, label %then2__2", "]"}));

    ir_manip->applyProfile(profile);

    EXPECT_FALSE(ir_manip->hasInstructionSequence(
        {"switch i64 %rand.1, label %then1__2 [", "i64 0, label %continue__3", "i64 1, label %then0__4",
         "i64 2, label %then2__2", "]"}));
}
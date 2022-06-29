// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "DivisionByZeroPass/DivisionByZeroPass.hpp"
#include "Generators/ConfigurableProfileGenerator.hpp"
#include "GroupingPass/GroupingPass.hpp"
#include "Rules/Factory.hpp"
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

    ir_manip->declareFunction("void @print_i64(i64)");
    ir_manip->declareFunction("i1 @get_i1()");
    ir_manip->declareFunction("i2 @get_i2()");

    if (!ir_manip->fromBodyString(script))
    {
        llvm::outs() << ir_manip->generateScript(script) << "\n\n";
        llvm::outs() << ir_manip->getErrorMessage() << "\n";
        exit(-1);
    }

    return ir_manip;
}
} // namespace

struct DummyConfig
{
    void setup(ConfigurationManager&) {}
};

std::shared_ptr<ConfigurableProfileGenerator> newProfile()
{
    llvm::errs() << "A\n";

    auto profile = std::make_shared<ConfigurableProfileGenerator>(ConfigurableProfileGenerator::SetupMode::DoNothing);
    ConfigurationManager& configuration_manager = profile->configurationManager();
    llvm::errs() << "B\n";

    configuration_manager.addConfig<FactoryConfiguration>();
    configuration_manager.addConfig<DummyConfig>();

    profile->registerAnonymousProfileComponent<DummyConfig>(
        [](DummyConfig const& config, ProfileGenerator* ptr, Profile& profile)
        {
            auto& mpm = ptr->modulePassManager();
            mpm.addPass(DivisionByZeroPass());
        });
    llvm::errs() << "C\n";

    return profile;
}

TEST(DivideByZeroTests, InjectionTest)
{
    IrManipulationTestHelperPtr ir_manip = newIrManip(R"script(
  %y = alloca i64, align 8
  %x = alloca i64, align 8
  store i64 0, i64* %x, align 4
  store i64 20, i64* %y, align 4
  )script");

    auto profile = newProfile();
    llvm::errs() << "D\n";

    ir_manip->applyProfile(profile);
    llvm::errs() << *ir_manip->module() << "\n";

    EXPECT_TRUE(ir_manip->hasInstructionSequence({"%1 = select i1 %0, i64 1, i64 0", "%3 = zext i2 %2 to i64"}));
    EXPECT_FALSE(ir_manip->hasInstructionSequence({"%1 = zext i1 %0 to i64"}));
}
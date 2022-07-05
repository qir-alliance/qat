// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "gtest/gtest.h"
#include "qir/qat/Generators/ConfigurableProfileGenerator.hpp"
#include "qir/qat/GroupingPass/GroupingPass.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Rules/Factory.hpp"
#include "qir/qat/TestTools/IrManipulationTestHelper.hpp"
#include "qir/qat/ZExtTransformPass/ZExtTransformPass.hpp"

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
    auto                  profile               = std::make_shared<ConfigurableProfileGenerator>();
    ConfigurationManager& configuration_manager = profile->configurationManager();

    configuration_manager.addConfig<FactoryConfiguration>();
    configuration_manager.addConfig<DummyConfig>();

    profile->registerAnonymousProfileComponent<DummyConfig>(
        [](DummyConfig const& /*config*/, ProfileGenerator* ptr, Profile& /*profile*/)
        {
            auto& fpm = ptr->functionPassManager();
            fpm.addPass(ZExtTransformPass());
        });

    configuration_manager.setConfig(LlvmPassesConfiguration::createDisabled());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(StaticResourceComponentConfiguration::createDisabled());

    return profile;
}

TEST(ZExtTransformPassTests, ReplacementTest)
{
    auto ir_manip = newIrManip(R"script(
    %0 = call i1 @get_i1()
    %1 = zext i1 %0 to i64
    call void @print_i64(i64 %1)
    %2 = call i2 @get_i2()
    %3 = zext i2 %2 to i64
    call void @print_i64(i64 %3)  
  )script");

    auto profile = newProfile();
    ir_manip->applyProfile(profile);
    llvm::errs() << *ir_manip->module() << "\n";

    EXPECT_TRUE(ir_manip->hasInstructionSequence({"%1 = select i1 %0, i64 1, i64 0", "%3 = zext i2 %2 to i64"}));
    EXPECT_FALSE(ir_manip->hasInstructionSequence({"%1 = zext i1 %0 to i64"}));
}

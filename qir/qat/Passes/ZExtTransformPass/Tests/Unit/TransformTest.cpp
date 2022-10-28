// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/external/gtest.hpp"
#include "qir/qat/AdaptorFactory/ConfigurableQirAdaptorFactory.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingPass.hpp"
#include "qir/qat/Passes/StaticResourceComponent/StaticResourceComponentConfiguration.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/Factory.hpp"
#include "qir/qat/Passes/ZExtTransformPass/ZExtTransformPass.hpp"
#include "qir/qat/TestTools/IrManipulationTestHelper.hpp"
#include "qir/qat/Utils/FunctionToModule.hpp"

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

std::shared_ptr<ConfigurableQirAdaptorFactory> newQirAdaptor(ConfigurationManager& configuration_manager)
{

    auto adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(configuration_manager);
    configuration_manager.addConfig<DummyConfig>();

    adaptor->registerAnonymousAdaptorComponent<DummyConfig>(
        [](DummyConfig const& /*config*/, QirAdaptor& adaptor)
        {
            llvm::FunctionPassManager fpm;
            fpm.addPass(ZExtTransformPass());
            adaptor.modulePassManager().addPass(FunctionToModule(std::move(fpm)));
        });

    configuration_manager.setConfig(LlvmPassesConfiguration::createDisabled());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(StaticResourceComponentConfiguration::createDisabled());

    return adaptor;
}

TEST(ZExtTransformPassTests, ReplacementTest)
{
    ConfigurationManager configuration_manager;
    auto                 ir_manip = newIrManip(R"script(
    %0 = call i1 @get_i1()
    %1 = zext i1 %0 to i64
    call void @print_i64(i64 %1)
    %2 = call i2 @get_i2()
    %3 = zext i2 %2 to i64
    call void @print_i64(i64 %3)  
  )script");

    auto adaptor = newQirAdaptor(configuration_manager);
    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(ir_manip->hasInstructionSequence({"%1 = select i1 %0, i64 1, i64 0", "%3 = zext i2 %2 to i64"}));
    EXPECT_FALSE(ir_manip->hasInstructionSequence({"%1 = zext i1 %0 to i64"}));
}

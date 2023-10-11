// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "gtest/gtest.h"
#include "qir/qat/AdaptorFactory/ConfigurableQirAdaptorFactory.hpp"
#include "qir/qat/AdaptorFactory/TargetProfileMappingConfiguration.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/DivisionByZeroPass/DivisionByZeroPass.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingPass.hpp"
#include "qir/qat/Passes/StaticResourceComponent/StaticResourceComponentConfiguration.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/Factory.hpp"
#include "qir/qat/Rules/Notation/Notation.hpp"
#include "qir/qat/Rules/ReplacementRule.hpp"
#include "qir/qat/Rules/RuleSet.hpp"
#include "qir/qat/TestTools/IrManipulationTestHelper.hpp"

#include <functional>

using namespace microsoft::quantum;

namespace
{
using IrManipulationTestHelperPtr = std::shared_ptr<IrManipulationTestHelper>;
IrManipulationTestHelperPtr newIrManip(std::string const& script)
{
    IrManipulationTestHelperPtr ir_manip = std::make_shared<IrManipulationTestHelper>();

    ir_manip->declareFunction("void @print_i64(i64)");
    ir_manip->declareFunction("void @__qir__report_error_value(i64)");
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

std::shared_ptr<ConfigurableQirAdaptorFactory> newQirAdaptor(ConfigurationManager& configuration_manager)
{
    auto configure_adaptor = [](RuleSet&) {};

    auto adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(configuration_manager, std::move(configure_adaptor));

    configuration_manager.setConfig(LlvmPassesConfiguration::createDisabled());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(PostTransformValidationPassConfiguration::createDisabled());
    auto cfg = TargetProfileMappingConfiguration::createDisabled();
    cfg.setInsertDivisionByZeroGuards(true);
    configuration_manager.setConfig(cfg);

    return adaptor;
}

TEST(DivideByZeroTests, InjectionTest)
{
    IrManipulationTestHelperPtr ir_manip = newIrManip(R"script(
  %y = alloca i64, align 8
  %x = alloca i64, align 8
  store i64 0, i64* %x, align 4
  store i64 20, i64* %y, align 4
  %0 = load i64, i64* %x, align 4
  %1 = load i64, i64* %y, align 4
  %2 = sdiv i64 %0, %1
  call void @print_i64(i64 %2)
  )script");

    ConfigurationManager configuration_manager;
    auto                 adaptor = newQirAdaptor(configuration_manager);

    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(ir_manip->hasInstructionSequence({
        "br i1 %2, label %denominator_is_zero, label %denominator_is_nonzero",
        "%3 = load i64, i64* @__qir__error_code, align 4",
        "%4 = icmp eq i64 %3, 0",
        "br i1 %4, label %ecc_not_set, label %ecc_set",
        "store i64 " + std::to_string(DivisionByZeroPass::EC_QIR_DIVISION_BY_ZERO) +
            ", i64* @__qir__error_code, align 4",
        "br label %ecc_set",
        "br label %denominator_is_nonzero",
    }));
}

int64_t error_code = 0;
TEST(DivideByZeroTests, ExpectDivisionByZero)
{
    IrManipulationTestHelperPtr ir_manip = newIrManip(R"script(
  %y = alloca i64, align 8
  %x = alloca i64, align 8
  store i64 20, i64* %x, align 4
  store i64 0, i64* %y, align 4
  %0 = load i64, i64* %x, align 4
  %1 = load i64, i64* %y, align 4
  %2 = sdiv i64 %0, %1
  )script");

    ConfigurationManager configuration_manager;
    auto                 adaptor = newQirAdaptor(configuration_manager);

    ir_manip->applyQirAdaptor(adaptor);

    auto program = ir_manip->toProgram();

    TestVM test_vm(program);
    error_code                = 0;
    int64_t global_error_code = 0;

    test_vm.attachGlobalExternalVariable(DivisionByZeroPass::EC_VARIABLE_NAME, &global_error_code);
    test_vm.attachRuntimeFunction<void, int64_t>(
        "__qir__report_error_value", [](int64_t x) -> void { error_code = x; });

    auto ret = test_vm.run<int8_t>("Main");
    EXPECT_EQ(error_code, DivisionByZeroPass::EC_QIR_DIVISION_BY_ZERO);
    EXPECT_EQ(global_error_code, DivisionByZeroPass::EC_QIR_DIVISION_BY_ZERO);
    EXPECT_EQ(ret, 0);
}

TEST(DivideByZeroTests, ExpectNoDivisionByZeroNoUpdate)
{
    IrManipulationTestHelperPtr ir_manip = newIrManip(R"script(
  %y = alloca i64, align 8
  %x = alloca i64, align 8
  store i64 20, i64* %x, align 4
  store i64 0, i64* %y, align 4
  %0 = load i64, i64* %x, align 4
  %1 = load i64, i64* %y, align 4
  %2 = sdiv i64 %0, %1
  )script");

    ConfigurationManager configuration_manager;
    auto                 adaptor = newQirAdaptor(configuration_manager);

    ir_manip->applyQirAdaptor(adaptor);

    auto program = ir_manip->toProgram();

    TestVM test_vm(program);
    error_code                = 1337;
    int64_t global_error_code = 1338;

    test_vm.attachGlobalExternalVariable(DivisionByZeroPass::EC_VARIABLE_NAME, &global_error_code);
    test_vm.attachRuntimeFunction<void, int64_t>(
        "__qir__report_error_value", [](int64_t x) -> void { error_code = x; });

    auto ret = test_vm.run<int8_t>("Main");
    EXPECT_EQ(error_code, 1338);
    EXPECT_EQ(global_error_code, 1338);
    EXPECT_EQ(ret, 0);
}

TEST(DivideByZeroTests, ExpectNoDivisionByZeroNoReport)
{
    IrManipulationTestHelperPtr ir_manip = newIrManip(R"script(
  %y = alloca i64, align 8
  %x = alloca i64, align 8
  store i64 20, i64* %x, align 4
  store i64 10, i64* %y, align 4
  %0 = load i64, i64* %x, align 4
  %1 = load i64, i64* %y, align 4
  %2 = sdiv i64 %0, %1
  )script");

    ConfigurationManager configuration_manager;
    auto                 adaptor = newQirAdaptor(configuration_manager);

    ir_manip->applyQirAdaptor(adaptor);

    auto program = ir_manip->toProgram();

    TestVM test_vm(program);
    error_code                = 1338;
    int64_t global_error_code = 0;

    test_vm.attachGlobalExternalVariable(DivisionByZeroPass::EC_VARIABLE_NAME, &global_error_code);
    test_vm.attachRuntimeFunction<void, int64_t>(
        "__qir__report_error_value", [](int64_t x) -> void { error_code = x; });

    auto ret = test_vm.run<int8_t>("Main");
    EXPECT_EQ(error_code, 1338);
    EXPECT_EQ(global_error_code, 0);
    EXPECT_EQ(ret, 0);
}

// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "gtest/gtest.h"
#include "qir/qat/AdaptorFactory/ConfigurableQirAdaptorFactory.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingPass.hpp"
#include "qir/qat/Passes/PostTransformValidation/PostTransformValidationPassConfiguration.hpp"
#include "qir/qat/Passes/StaticResourceComponent/StaticResourceComponentConfiguration.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/Factory.hpp"
#include "qir/qat/TestTools/IrManipulationTestHelper.hpp"

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

    ir_manip->declareFunction("%Qubit* @__quantum__rt__qubit_allocate()");
    ir_manip->declareFunction("void @__quantum__rt__qubit_release(%Qubit*)");
    ir_manip->declareFunction("void @__quantum__qis__h__body(%Qubit*)");

    ir_manip->declareFunction("i64 @TeleportChain__Calculate__body(i64, %Qubit*)");

    if (!ir_manip->fromBodyString(script))
    {
        llvm::outs() << ir_manip->generateScript(script) << "\n\n";
        llvm::outs() << ir_manip->getErrorMessage() << "\n";
        exit(-1);
    }
    return ir_manip;
}

} // namespace

// Single allocation with action and then release
TEST(TargetQisMappingPass, LoopUnroll)
{
    auto                 ir_manip = newIrManip(R"script(
  %q = call %Qubit* @__quantum__rt__qubit_allocate()
  %ret = alloca i64, align 8
  store i64 1, i64* %ret, align 4
  br label %header__1

header__1:                                        ; preds = %exiting__1, %entry
  %i = phi i64 [ 0, %entry ], [ %4, %exiting__1 ]
  %0 = icmp sle i64 %i, 5
  br i1 %0, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %1 = load i64, i64* %ret, align 4
  %2 = call i64 @TeleportChain__Calculate__body(i64 4, %Qubit* %q)
  %3 = add i64 %1, %2
  store i64 %3, i64* %ret, align 4
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %4 = add i64 %i, 1
  br label %header__1

exit__1:                                          ; preds = %header__1
  %5 = load i64, i64* %ret, align 4
  call void @__quantum__rt__qubit_release(%Qubit* %q)
  )script");
    ConfigurationManager configuration_manager;

    auto adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(configuration_manager);

    configuration_manager.setConfig(LlvmPassesConfiguration::createUnrollInline());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(StaticResourceComponentConfiguration::createDisabled());
    configuration_manager.setConfig(PostTransformValidationPassConfiguration::createDisabled());

    ir_manip->applyQirAdaptor(adaptor);

    EXPECT_TRUE(ir_manip->hasInstructionSequence({
        "%0 = call i64 @TeleportChain__Calculate__body(i64 4, %Qubit* null)",
        "%1 = call i64 @TeleportChain__Calculate__body(i64 4, %Qubit* null)",
        "%2 = call i64 @TeleportChain__Calculate__body(i64 4, %Qubit* null)",
        "%3 = call i64 @TeleportChain__Calculate__body(i64 4, %Qubit* null)",
        "%4 = call i64 @TeleportChain__Calculate__body(i64 4, %Qubit* null)",
        "%5 = call i64 @TeleportChain__Calculate__body(i64 4, %Qubit* null)",
    }));
}

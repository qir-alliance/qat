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

    ir_manip->declareFunction("void @__quantum__qis__h__body(%Qubit*)");
    ir_manip->declareFunction("void @test_reset_result(%Result*)");

    if (!ir_manip->fromBodyString(script))
    {
        llvm::outs() << ir_manip->generateScript(script) << "\n\n";
        llvm::outs() << ir_manip->getErrorMessage() << "\n";
        exit(-1);
    }

    return ir_manip;
}

class MockLogger : public LogCollection
{
  public:
    void errorPoisonNotAllowed(String const& /*target_name*/, llvm::Value* /*ptr*/) override
    {
        raised_poison_not_allowed_ = true;
    }

    void errorUndefNotAllowed(String const& /*target_name*/, llvm::Value* /*ptr*/) override
    {
        raised_undef_not_allowed_ = true;
    }

    bool raisedPoisonNotAllowed() const
    {
        return raised_poison_not_allowed_;
    }

    bool raisedUndefNotAllowed() const
    {
        return raised_undef_not_allowed_;
    }

  private:
    bool raised_poison_not_allowed_{false};
    bool raised_undef_not_allowed_{false};
};

void testSkeleton(String const& script, std::shared_ptr<MockLogger> const& logger)
{
    auto ir_manip = newIrManip(script);

    ConfigurationManager configuration_manager;
    auto                 generator = std::make_shared<QirAdaptorFactory>(configuration_manager);

    configuration_manager.addConfig<TargetProfileConfiguration>(
        "target.profile", TargetProfileConfiguration::fromQirTargetName("generic"));
    configuration_manager.addConfig<TargetQisConfiguration>(
        "target.qis", TargetQisConfiguration::fromQirTargetName("generic"));

    generator->setLogger(logger);
    generator->setupDefaultComponentPipeline();

    ParameterParser parser;
    configuration_manager.setupArguments(parser);
    char const* argv[] = {"exe", "--no-allow-undef", "--no-allow-poison"};
    parser.parseArgs(3, argv);

    configuration_manager.configure(parser);
    for (auto& prop : parser.unusedSettings())
    {
        llvm::errs() << "Unknown option or flag '" << prop
                     << "'. If this is an experimental feature remember to add `--experimental` to enable it."
                        "\n";
    }

    ir_manip->validateQirAdaptor(generator, "generic", false);
}

} // namespace

// Single allocation with action and then release
TEST(FunctionValidationPass, FailUndefPoison)
{
    auto logger = std::make_shared<MockLogger>();
    testSkeleton(
        R"script(
  br label %header__1.i

header__1.i:                                      ; preds = %body__1.i, %entry
  %0 = phi i64 [ 1, %entry ], [ %2, %body__1.i ]
  %1 = icmp slt i64 %0, 6
  br i1 %1, label %body__1.i, label %open_qasm_body.exit

body__1.i:                                        ; preds = %header__1.i
  call void @__quantum__qis__h__body(%Qubit* poison)
  call void @__quantum__qis__h__body(%Qubit* undef)
  %2 = add i64 %0, 1
  br label %header__1.i

open_qasm_body.exit:                      ; preds = %header__1.i
  )script",
        logger);
    EXPECT_TRUE(logger->raisedPoisonNotAllowed());
    EXPECT_TRUE(logger->raisedUndefNotAllowed());
}

TEST(FunctionValidationPass, SuccessPoisonUndef)
{
    auto logger = std::make_shared<MockLogger>();
    testSkeleton(
        R"script(
  br label %header__1.i

header__1.i:                                      ; preds = %body__1.i, %entry
  %0 = phi i64 [ 1, %entry ], [ %2, %body__1.i ]
  %1 = icmp slt i64 %0, 6
  br i1 %1, label %body__1.i, label %open_qasm_body.exit

body__1.i:                                        ; preds = %header__1.i
  call void @__quantum__qis__h__body(%Qubit* null)
  call void @__quantum__qis__h__body(%Qubit* null)
  %2 = add i64 %0, 1
  br label %header__1.i

open_qasm_body.exit:                      ; preds = %header__1.i
  )script",
        logger);
    EXPECT_FALSE(logger->raisedPoisonNotAllowed());
    EXPECT_FALSE(logger->raisedUndefNotAllowed());
}

TEST(FunctionValidationPass, FailPoison)
{
    auto logger = std::make_shared<MockLogger>();
    testSkeleton(
        R"script(
  br label %header__1.i

header__1.i:                                      ; preds = %body__1.i, %entry
  %0 = phi i64 [ 1, %entry ], [ %2, %body__1.i ]
  %1 = icmp slt i64 %0, 6
  br i1 %1, label %body__1.i, label %open_qasm_body.exit

body__1.i:                                        ; preds = %header__1.i
  call void @__quantum__qis__h__body(%Qubit* poison)
  call void @__quantum__qis__h__body(%Qubit* null)
  %2 = add i64 %0, 1
  br label %header__1.i

open_qasm_body.exit:                      ; preds = %header__1.i
  )script",
        logger);
    EXPECT_TRUE(logger->raisedPoisonNotAllowed());
    EXPECT_FALSE(logger->raisedUndefNotAllowed());
}

TEST(FunctionValidationPass, FailUndef)
{
    auto logger = std::make_shared<MockLogger>();
    testSkeleton(
        R"script(
  br label %header__1.i

header__1.i:                                      ; preds = %body__1.i, %entry
  %0 = phi i64 [ 1, %entry ], [ %2, %body__1.i ]
  %1 = icmp slt i64 %0, 6
  br i1 %1, label %body__1.i, label %open_qasm_body.exit

body__1.i:                                        ; preds = %header__1.i
  call void @__quantum__qis__h__body(%Qubit* null)
  call void @__quantum__qis__h__body(%Qubit* undef)
  %2 = add i64 %0, 1
  br label %header__1.i

open_qasm_body.exit:                      ; preds = %header__1.i
  )script",
        logger);
    EXPECT_FALSE(logger->raisedPoisonNotAllowed());
    EXPECT_TRUE(logger->raisedUndefNotAllowed());
}

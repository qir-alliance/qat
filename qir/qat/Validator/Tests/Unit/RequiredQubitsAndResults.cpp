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
    void errorNoQubitsPresent(llvm::Value*, String const&) override
    {
        raise_no_qubits_error_ = true;
    }

    void errorNoResultsPresent(llvm::Value*, String const&) override
    {
        raise_no_results_error_ = true;
    }

    bool raiseNoQubitsError() const
    {
        return raise_no_qubits_error_;
    }

    bool raiseNoResultsError() const
    {
        return raise_no_results_error_;
    }

  private:
    bool raise_no_qubits_error_{false};
    bool raise_no_results_error_{false};
};

void testSkeleton(String const& script, std::shared_ptr<MockLogger> const& logger)
{
    auto ir_manip = newIrManip(script);

    ConfigurationManager configuration_manager;
    auto                 generator = std::make_shared<QirAdaptorFactory>(configuration_manager);

    configuration_manager.addConfig<TargetProfileConfiguration>(
        "target.profile", TargetProfileConfiguration::fromQirTargetName("generic"));
    configuration_manager.addConfig<TargetQisConfiguration>(
        "target.profile", TargetQisConfiguration::fromQirTargetName("generic"));

    generator->setLogger(logger);
    generator->setupDefaultComponentPipeline();

    ParameterParser parser;
    configuration_manager.setupArguments(parser);
    char const* argv[] = {"exe", "--requires-results", "--requires-qubits"};
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
TEST(FunctionValidationPass, FailMissingResults)
{
    auto logger = std::make_shared<MockLogger>();
    testSkeleton(
        R"script(
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  )script",
        logger);
    EXPECT_FALSE(logger->raiseNoQubitsError());
    EXPECT_TRUE(logger->raiseNoResultsError());
}

TEST(FunctionValidationPass, FailMissingQubitsAndResults)
{
    auto logger = std::make_shared<MockLogger>();
    testSkeleton(
        R"script(  
  )script",
        logger);
    EXPECT_TRUE(logger->raiseNoQubitsError());
    EXPECT_TRUE(logger->raiseNoResultsError());
}

TEST(FunctionValidationPass, FailMissingQubits)
{
    auto logger = std::make_shared<MockLogger>();
    testSkeleton(
        R"script(  
  tail call void @test_reset_result(%Result* nonnull inttoptr (i64 2 to %Result*))    
  )script",
        logger);
    EXPECT_TRUE(logger->raiseNoQubitsError());
    EXPECT_FALSE(logger->raiseNoResultsError());
}

TEST(FunctionValidationPass, NothingMissing)
{
    auto logger = std::make_shared<MockLogger>();
    testSkeleton(
        R"script(  
  tail call void @test_reset_result(%Result* nonnull inttoptr (i64 2 to %Result*))    
  tail call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 2 to %Qubit*))
  )script",
        logger);
    EXPECT_FALSE(logger->raiseNoQubitsError());
    EXPECT_FALSE(logger->raiseNoResultsError());
}

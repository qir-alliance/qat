// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "gtest/gtest.h"
#include "qir/qat/AdaptorFactory/ConfigurableQirAdaptorFactory.hpp"
#include "qir/qat/AdaptorFactory/LlvmPassesConfiguration.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/TargetQisMappingPassConfiguration.hpp"
#include "qir/qat/TestTools/IrManipulationTestHelper.hpp"

using namespace microsoft::quantum;
using GeneratorPtr = std::shared_ptr<ConfigurableQirAdaptorFactory>;
namespace
{
class ExposedConfigurableQirAdaptorFactory : public ConfigurableQirAdaptorFactory
{
  public:
    using ConfigurableQirAdaptorFactory::ConfigurableQirAdaptorFactory;
    using ConfigurableQirAdaptorFactory::createValidationModulePass;
};

class TestAnalysis
{
  public:
    TestAnalysis(TestAnalysis const&) = delete;
    TestAnalysis(TestAnalysis&&)      = default;
    ~TestAnalysis()                   = default;
    TestAnalysis()
    {

        // Creating a full pass builder and registering each of the
        // components to make them accessible to the developer.
        pass_builder_.registerModuleAnalyses(module_analysis_manager_);
        pass_builder_.registerCGSCCAnalyses(gscc_analysis_manager_);
        pass_builder_.registerFunctionAnalyses(function_analysis_manager_);
        pass_builder_.registerLoopAnalyses(loop_analysis_manager_);

        pass_builder_.crossRegisterProxies(
            loop_analysis_manager_, function_analysis_manager_, gscc_analysis_manager_, module_analysis_manager_);
    }

    llvm::PassBuilder& passBuilder()
    {
        return pass_builder_;
    }

    llvm::LoopAnalysisManager& loopAnalysisManager()
    {
        return loop_analysis_manager_;
    }

    llvm::FunctionAnalysisManager& functionAnalysisManager()
    {
        return function_analysis_manager_;
    }

    llvm::CGSCCAnalysisManager& gsccAnalysisManager()
    {
        return gscc_analysis_manager_;
    }

    llvm::ModuleAnalysisManager& moduleAnalysisManager()
    {
        return module_analysis_manager_;
    }

  private:
    // Objects used to run a set of passes
    //

    llvm::PassBuilder             pass_builder_;
    llvm::LoopAnalysisManager     loop_analysis_manager_;
    llvm::FunctionAnalysisManager function_analysis_manager_;
    llvm::CGSCCAnalysisManager    gscc_analysis_manager_;
    llvm::ModuleAnalysisManager   module_analysis_manager_;
};
} // namespace

TEST(AdaptorFactoryTestSuite, ConfigureFunction)
{
    uint64_t             call_count{0};
    auto                 configure = [&call_count](RuleSet&) { ++call_count; };
    ConfigurationManager configuration_manager;
    auto generator = std::make_shared<ExposedConfigurableQirAdaptorFactory>(configuration_manager, configure);

    TestAnalysis test;

    generator->newQirAdaptor("test", llvm::OptimizationLevel::O0, false);

    EXPECT_EQ(call_count, 1);
    EXPECT_TRUE(generator->ruleTransformationConfig().isDisabled());
    EXPECT_TRUE(generator->llvmPassesConfig().isDisabled());
}

TEST(AdaptorFactoryTestSuite, ConfigurationManager)
{
    ConfigurationManager configuration_manager;
    auto                 generator = std::make_shared<ExposedConfigurableQirAdaptorFactory>(configuration_manager);

    TestAnalysis test;

    generator->newQirAdaptor("test", llvm::OptimizationLevel::O0, false);

    EXPECT_EQ(generator->ruleTransformationConfig(), TargetQisMappingPassConfiguration());
    EXPECT_EQ(generator->llvmPassesConfig(), LlvmPassesConfiguration());
    EXPECT_FALSE(generator->ruleTransformationConfig().isDisabled());
}

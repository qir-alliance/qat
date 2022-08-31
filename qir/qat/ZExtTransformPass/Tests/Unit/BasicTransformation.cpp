// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/external/gtest.hpp"
#include "qir/qat/AdaptorFactory/LlvmPassesConfiguration.hpp"
#include "qir/qat/AdaptorFactory/PostTransformConfig.hpp"
#include "qir/qat/GroupingPass/GroupingAnalysisPass.hpp"
#include "qir/qat/GroupingPass/GroupingPass.hpp"
#include "qir/qat/GroupingPass/GroupingPassConfiguration.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/CommentLogger.hpp"
#include "qir/qat/PostTransformValidation/PostTransformValidationPass.hpp"
#include "qir/qat/PreTransformTrimming/PreTransformTrimmingPass.hpp"
#include "qir/qat/Rules/Factory.hpp"
#include "qir/qat/Rules/RuleSet.hpp"
#include "qir/qat/StaticResourceComponent/AllocationAnalysisPass.hpp"
#include "qir/qat/StaticResourceComponent/QubitRemapPass.hpp"
#include "qir/qat/StaticResourceComponent/ReplaceQubitOnResetPass.hpp"
#include "qir/qat/StaticResourceComponent/ResourceAnnotationPass.hpp"
#include "qir/qat/StaticResourceComponent/StaticResourceComponentConfiguration.hpp"
#include "qir/qat/TestTools/IrManipulationTestHelper.hpp"
#include "qir/qat/TransformationRulesPass/TransformationRulesPass.hpp"
#include "qir/qat/TransformationRulesPass/TransformationRulesPassConfiguration.hpp"
#include "qir/qat/Utils/FunctionToModule.hpp"
#include "qir/qat/ValidationPass/ValidationPassConfiguration.hpp"
#include "qir/qat/ZExtTransformPass/ZExtTransformPass.hpp"

#include <functional>
#include <memory>

using namespace microsoft::quantum;

TEST(ZExtTransformPassTests, BasicReplacementTest)
{
    auto               context = std::make_unique<llvm::LLVMContext>();
    llvm::SMDiagnostic error;
    std::string        script = R"(
declare i1 @get_i1()
declare i2 @get_i2()
declare void @print_i64(i64)
define i8 @TheMain() {
entry:
    %0 = call i1 @get_i1()
    %1 = zext i1 %0 to i64
    call void @print_i64(i64 %1)
    %2 = call i2 @get_i2()
    %3 = zext i2 %2 to i64
    call void @print_i64(i64 %3) 
    ret i8 9
} 
    )";
    auto               module = llvm::parseIR(llvm::MemoryBufferRef(script, "test.ll"), error, *context);

    if (!module)
    {
        throw std::runtime_error("Failed to parse script");
    }

    llvm::LoopAnalysisManager      loop_analysis_manager;
    llvm::FunctionAnalysisManager  function_analysis_manager;
    llvm::CGSCCAnalysisManager     gscc_analysis_manager;
    llvm::ModuleAnalysisManager    module_analysis_manager;
    llvm::ModuleAnalysisManager&   mam = module_analysis_manager;
    llvm::FunctionAnalysisManager& fam = function_analysis_manager;

    auto pass_builder = std::make_unique<llvm::PassBuilder>();

    pass_builder->registerModuleAnalyses(module_analysis_manager);
    pass_builder->registerCGSCCAnalyses(gscc_analysis_manager);
    pass_builder->registerFunctionAnalyses(function_analysis_manager);
    pass_builder->registerLoopAnalyses(loop_analysis_manager);

    pass_builder->crossRegisterProxies(
        loop_analysis_manager, function_analysis_manager, gscc_analysis_manager, module_analysis_manager);

    llvm::ModulePassManager mpm{};
    auto                    logger                    = std::make_shared<CommentLogger>();
    auto                    qubit_allocation_manager  = BasicAllocationManager::createNew();
    auto                    result_allocation_manager = BasicAllocationManager::createNew();

    ConfigurationManager configuration_manager;
    configuration_manager.addConfig<FactoryConfiguration>();

    configuration_manager.addConfig<GroupingPassConfiguration>("grouping");
    configuration_manager.addConfig<StaticResourceComponentConfiguration>("static-resource");
    configuration_manager.addConfig<PostTransformValidationPassConfiguration>("post-transform-validation");
    configuration_manager.addConfig<PostTransformConfig>("post-transform");
    configuration_manager.addConfig<TransformationRulesPassConfiguration>("transformation-rules");
    configuration_manager.addConfig<PreTransformTrimmingPassConfiguration>("pre-transform-trimming");
    configuration_manager.addConfig<LlvmPassesConfiguration>("llvm-optimization");

    configuration_manager.setConfig(LlvmPassesConfiguration::createDisabled());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());
    configuration_manager.setConfig(StaticResourceComponentConfiguration::createDisabled());
    {
        llvm::FunctionPassManager fpm{};
        fpm.addPass(ZExtTransformPass());
        mpm.addPass(FunctionToModule(std::move(fpm)));
    }
    {
        llvm::FunctionPassManager fpm{};
        auto&                     cfg = configuration_manager.get<LlvmPassesConfiguration>();
        // Eliminating intrinsic functions
        if (cfg.eliminateConstants())
        {
            llvm::FunctionPassManager early_fpm;
            mpm.addPass(llvm::ForceFunctionAttrsPass());
            mpm.addPass(llvm::InferFunctionAttrsPass());

            early_fpm.addPass(llvm::SimplifyCFGPass());
            early_fpm.addPass(llvm::EarlyCSEPass(false));
            mpm.addPass(FunctionToModule(std::move(early_fpm)));
        }

        // Always inline
        if (cfg.alwaysInline())
        {

            mpm.addPass(llvm::AlwaysInlinerPass());
            auto                           inline_param = llvm::getInlineParams(cfg.inlineParameter());
            llvm::ModuleInlinerWrapperPass inliner_pass = llvm::ModuleInlinerWrapperPass(inline_param);
            mpm.addPass(std::move(inliner_pass));
        }

        // Unroll loop
        if (cfg.unrollLoops())
        {

            /// More unroll parameters
            /// https://llvm.org/doxygen/LoopUnrollPass_8cpp.html

            /// Header
            /// https://llvm.org/doxygen/LoopUnrollPass_8h.html

            llvm::LoopUnrollOptions loop_config(
                cfg.unrollOptLevel(), cfg.unrollOnlyWhenForced(), cfg.unrollForgeScev());

            loop_config.setPartial(cfg.unrollAllowPartial())
                .setPeeling(cfg.unrollAllowPeeling())
                .setRuntime(cfg.unrollAllowRuntime())
                .setUpperBound(cfg.unrollAllowUpperBound())
                .setProfileBasedPeeling(cfg.unrollAllowProfilBasedPeeling())
                .setFullUnrollMaxCount(cfg.unrolFullUnrollCount());

            fpm.addPass(llvm::LoopUnrollPass(loop_config));
        }

        if (cfg.eliminateMemory())
        {
            fpm.addPass(llvm::PromotePass());
        }

        if (cfg.eliminateConstants())
        {
            fpm.addPass(llvm::SCCPPass());
        }

        if (cfg.eliminateDeadCode())
        {
            fpm.addPass(llvm::ADCEPass());
        }
        mpm.addPass(FunctionToModule(std::move(fpm)));
    }

    {
        llvm::FunctionPassManager fpm{};
        auto&                     cfg = configuration_manager.get<PreTransformTrimmingPassConfiguration>();
        mpm.addPass(PreTransformTrimmingPass(cfg, logger));
        mpm.addPass(FunctionToModule(std::move(fpm)));
    }

    {
        llvm::FunctionPassManager fpm{};
        auto&                     cfg = configuration_manager.get<TransformationRulesPassConfiguration>();
        // Defining the mapping

        RuleSet rule_set;
        auto    factory = RuleFactory(rule_set, qubit_allocation_manager, result_allocation_manager, logger);
        factory.usingConfiguration(configuration_manager.get<FactoryConfiguration>());

        // Creating adaptor pass
        auto pass = TransformationRulesPass(std::move(rule_set), cfg, nullptr);
        pass.setLogger(logger);
        mpm.addPass(std::move(pass));
        mpm.addPass(FunctionToModule(std::move(fpm)));
    }

    {
        llvm::FunctionPassManager fpm;
        auto&                     cfg = configuration_manager.get<PostTransformConfig>();

        if (cfg.shouldAddInstCombinePass())
        {
            fpm.addPass(llvm::InstCombinePass(1000));
        }

        if (cfg.shouldAddAggressiveInstCombinePass())
        {
            fpm.addPass(llvm::AggressiveInstCombinePass());
        }

        if (cfg.shouldAddSccpPass())
        {
            fpm.addPass(llvm::SCCPPass());
        }

        if (cfg.shouldAddSimplifyCfgPass())
        {
            fpm.addPass(llvm::SimplifyCFGPass());
        }

        if (cfg.shouldLowerSwitch())
        {
            fpm.addPass(llvm::LowerSwitchPass());
        }

        if (cfg.shouldEliminateZExtI1())
        {
            fpm.addPass(ZExtTransformPass());
        }
        mpm.addPass(FunctionToModule(std::move(fpm)));
    }

    {
        llvm::FunctionPassManager fpm;
        auto&                     cfg = configuration_manager.get<PostTransformValidationPassConfiguration>();
        mpm.addPass(PostTransformValidationPass(cfg, logger));
        mpm.addPass(FunctionToModule(std::move(fpm)));
    }

    {
        llvm::FunctionPassManager fpm;
        auto&                     cfg = configuration_manager.get<StaticResourceComponentConfiguration>();
        fam.registerPass([&] { return AllocationAnalysisPass(logger); });

        fpm.addPass(ReplaceQubitOnResetPass(cfg, logger));
        fpm.addPass(QubitRemapPass(cfg, logger));

        if (cfg.shouldInlineAfterIdChange() && cfg.isChangingIds())
        {
            fpm.addPass(llvm::InstCombinePass(1000));
            fpm.addPass(llvm::AggressiveInstCombinePass());
            fpm.addPass(llvm::SCCPPass());
            fpm.addPass(llvm::SimplifyCFGPass());
            fpm.addPass(llvm::LowerSwitchPass());
            fpm.addPass(ZExtTransformPass());
        }

        fpm.addPass(ResourceAnnotationPass(cfg, logger));
        mpm.addPass(FunctionToModule(std::move(fpm)));
    }

    {
        llvm::FunctionPassManager fpm;
        auto&                     cfg = configuration_manager.get<GroupingPassConfiguration>();
        if (cfg.circuitSeparation())
        {
            mam.registerPass([&] { return GroupingAnalysisPass(cfg, logger); });

            auto pass = GroupingPass(cfg);
            pass.setLogger(logger);
            mpm.addPass(std::move(pass));
        }
        mpm.addPass(FunctionToModule(std::move(fpm)));
    }

    mpm.run(*module, module_analysis_manager);

    String                   output;
    llvm::raw_string_ostream ostream(output);
    ostream << *module;
}

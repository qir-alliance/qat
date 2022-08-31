// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/AdaptorFactory/QirAdaptorFactory.hpp"

#include "qir/qat/AdaptorFactory/LlvmPassesConfiguration.hpp"
#include "qir/qat/AdaptorFactory/PostTransformConfig.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/DeferMeasurementPass/DeferMeasurementPass.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingAnalysisPass.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingPass.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingPassConfiguration.hpp"
#include "qir/qat/Passes/PostTransformValidation/PostTransformValidationPass.hpp"
#include "qir/qat/Passes/PreTransformTrimming/PreTransformTrimmingPass.hpp"
#include "qir/qat/Passes/StaticResourceComponent/AllocationAnalysisPass.hpp"
#include "qir/qat/Passes/StaticResourceComponent/QubitRemapPass.hpp"
#include "qir/qat/Passes/StaticResourceComponent/ReplaceQubitOnResetPass.hpp"
#include "qir/qat/Passes/StaticResourceComponent/ResourceAnnotationPass.hpp"
#include "qir/qat/Passes/StaticResourceComponent/StaticResourceComponentConfiguration.hpp"
#include "qir/qat/Passes/TransformationRulesPass/TransformationRulesPass.hpp"
#include "qir/qat/Passes/TransformationRulesPass/TransformationRulesPassConfiguration.hpp"
#include "qir/qat/Passes/ValidationPass/ValidationPassConfiguration.hpp"
#include "qir/qat/Passes/ZExtTransformPass/ZExtTransformPass.hpp"
#include "qir/qat/Rules/Factory.hpp"
#include "qir/qat/Rules/RuleSet.hpp"
#include "qir/qat/Utils/FunctionToModule.hpp"

namespace microsoft::quantum
{
std::shared_ptr<QirAdaptor> QirAdaptorFactory::newQirAdaptor(
    String const&            name,
    OptimizationLevel const& optimization_level,
    bool                     debug)
{
    auto qubit_allocation_manager  = BasicAllocationManager::createNew();
    auto result_allocation_manager = BasicAllocationManager::createNew();

    if (configuration_manager_.has<TransformationRulesPassConfiguration>())
    {
        auto cfg = configuration_manager_.get<TransformationRulesPassConfiguration>();
        qubit_allocation_manager->setReuseRegisters(cfg.shouldReuseQubits());
        result_allocation_manager->setReuseRegisters(cfg.shouldReuseResults());
    }

    // Creating adaptor
    // TODO(issue-12): Set target machine
    auto ret = std::make_shared<QirAdaptor>(
        name, logger_, debug, nullptr, qubit_allocation_manager, result_allocation_manager);

    configureGeneratorFromQirAdaptor(*ret, optimization_level, debug);

    for (auto& c : components_)
    {
        llvm::FunctionPassManager function_pass_manager;
        function_pass_manager_ = &function_pass_manager;
        if (debug)
        {
            llvm::outs() << "Setting " << c.first << " up\n";
        }

        c.second(*this, *ret);
        module_pass_manager_->addPass(FunctionToModule(std::move(function_pass_manager)));
    }

    // Creating validator
    auto validator =
        std::make_unique<Validator>(configuration_manager_.get<ValidationPassConfiguration>(), logger_, debug);

    ret->setValidator(std::move(validator));

    return ret;
}

void QirAdaptorFactory::configureGeneratorFromQirAdaptor(
    QirAdaptor&              adaptor,
    OptimizationLevel const& optimization_level,
    bool                     debug)
{
    auto& pass_builder = adaptor.passBuilder();

    module_pass_manager_ = &adaptor.modulePassManager();
    pass_builder_        = &pass_builder;
    optimization_level_  = optimization_level;
    debug_               = debug;
}

llvm::ModulePassManager QirAdaptorFactory::createValidationModulePass(PassBuilder&, OptimizationLevel const&, bool)
{
    throw std::runtime_error("Validation is not supported yet.");
}

llvm::ModulePassManager& QirAdaptorFactory::modulePassManager()
{
    assert(module_pass_manager_ != nullptr);
    return *module_pass_manager_;
}

llvm::FunctionPassManager& QirAdaptorFactory::functionPassManager()
{
    assert(function_pass_manager_ != nullptr);
    return *function_pass_manager_;
}

llvm::PassBuilder& QirAdaptorFactory::passBuilder()
{
    return *pass_builder_;
}

ConfigurationManager& QirAdaptorFactory::configurationManager()
{
    return configuration_manager_;
}

ConfigurationManager const& QirAdaptorFactory::configurationManager() const
{
    return configuration_manager_;
}

QirAdaptorFactory::OptimizationLevel QirAdaptorFactory::optimizationLevel() const
{
    return optimization_level_;
}

bool QirAdaptorFactory::isDebugMode() const
{
    return debug_;
}

void QirAdaptorFactory::replicateAdaptorComponent(String const& id)
{
    for (auto& c : components_)
    {
        if (c.first == id)
        {
            auto setup_wrapper = c.second;
            components_.push_back({"__unnamed__", std::move(setup_wrapper)});
            return;
        }
    }

    throw std::runtime_error("Component " + id + " not found.");
}

void QirAdaptorFactory::setupDefaultComponentPipeline()
{
    using namespace llvm;
    ILoggerPtr logger = logger_;

    registerAdaptorComponent<LlvmPassesConfiguration>(
        "llvm-optimization",
        [](LlvmPassesConfiguration const& cfg, QirAdaptorFactory& generator, QirAdaptor& /*adaptor*/)
        {
            auto& mpm = generator.modulePassManager();

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

            auto& fpm = generator.functionPassManager();

            // Always inline
            if (cfg.alwaysInline())
            {
                mpm.addPass(llvm::AlwaysInlinerPass());
                auto                           inline_param = getInlineParams(cfg.inlineParameter());
                llvm::ModuleInlinerWrapperPass inliner_pass = ModuleInlinerWrapperPass(inline_param);
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
                    .setFullUnrollMaxCount(static_cast<uint32_t>(cfg.unrolFullUnrollCount()));

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
                mpm.addPass(llvm::GlobalDCEPass());
            }
        });

    registerAdaptorComponent<PreTransformTrimmingPassConfiguration>(
        "pre-transform-trimming",
        [logger](
            PreTransformTrimmingPassConfiguration const& cfg, QirAdaptorFactory& generator, QirAdaptor& /*adaptor*/)
        {
            auto& mpm = generator.modulePassManager();

            mpm.addPass(PreTransformTrimmingPass(cfg, logger));
        });

    registerAdaptorComponent<TransformationRulesPassConfiguration>(
        "transformation-rules",
        [logger](TransformationRulesPassConfiguration const& cfg, QirAdaptorFactory& generator, QirAdaptor& adaptor)
        {
            auto& ret = generator.modulePassManager();

            // Defining the mapping
            RuleSet rule_set;
            auto    factory = RuleFactory(
                   rule_set, adaptor.getQubitAllocationManager(), adaptor.getResultAllocationManager(), logger);
            factory.usingConfiguration(generator.configurationManager().get<FactoryConfiguration>());

            // Creating adaptor pass
            auto pass = TransformationRulesPass(std::move(rule_set), cfg, &adaptor);
            pass.setLogger(logger);
            ret.addPass(std::move(pass));
        });

    registerAdaptorComponent<PostTransformConfig>(
        "post-transform",
        [logger](PostTransformConfig const& cfg, QirAdaptorFactory& generator, QirAdaptor& /*adaptor*/)
        {
            auto& fpm = generator.functionPassManager();

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

            if (cfg.shouldDeferMeasurements())
            {
                fpm.addPass(DeferMeasurementPass());
            }
        });

    registerAdaptorComponent<PostTransformValidationPassConfiguration>(
        "post-transform-validation",
        [logger](
            PostTransformValidationPassConfiguration const& cfg, QirAdaptorFactory& generator, QirAdaptor&
            /*adaptor*/)
        {
            auto& mpm = generator.modulePassManager();
            mpm.addPass(PostTransformValidationPass(cfg, logger));
        });

    registerAdaptorComponent<StaticResourceComponentConfiguration>(
        "static-resource",
        [logger](StaticResourceComponentConfiguration const& cfg, QirAdaptorFactory& generator, QirAdaptor& adaptor)
        {
            auto& fam = adaptor.functionAnalysisManager();
            fam.registerPass([&] { return AllocationAnalysisPass(logger); });

            auto& fpm = generator.functionPassManager();

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
        });

    registerAdaptorComponent<GroupingPassConfiguration>(
        "grouping",
        [logger](GroupingPassConfiguration const& cfg, QirAdaptorFactory& generator, QirAdaptor& adaptor)
        {
            if (cfg.circuitSeparation())
            {
                auto& mam = adaptor.moduleAnalysisManager();
                mam.registerPass([&] { return GroupingAnalysisPass(cfg, logger); });
                auto& ret = generator.modulePassManager();

                auto pass = GroupingPass(cfg);
                pass.setLogger(logger);
                ret.addPass(std::move(pass));
            }
        });
}

void QirAdaptorFactory::setLogger(ILoggerPtr const& logger)
{
    logger_ = logger;
}

} // namespace microsoft::quantum

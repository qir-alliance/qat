// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/AdaptorFactory/QirAdaptorFactory.hpp"

#include "qir/qat/AdaptorFactory/LlvmPassesConfiguration.hpp"
#include "qir/qat/AdaptorFactory/TargetProfileMappingConfiguration.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/DeferMeasurementPass/DeferMeasurementPass.hpp"
#include "qir/qat/Passes/FunctionReplacementPass/FunctionAnnotatorPass.hpp"
#include "qir/qat/Passes/FunctionReplacementPass/FunctionReplacementAnalysisPass.hpp"
#include "qir/qat/Passes/FunctionReplacementPass/FunctionReplacementPass.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingAnalysisPass.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingPass.hpp"
#include "qir/qat/Passes/GroupingPass/GroupingPassConfiguration.hpp"
#include "qir/qat/Passes/PostTransformValidation/PostTransformValidationPass.hpp"
#include "qir/qat/Passes/RemoveNonEntrypointFunctions/RemoveNonEntrypointFunctionsPass.hpp"
#include "qir/qat/Passes/StaticResourceComponent/AllocationAnalysisPass.hpp"
#include "qir/qat/Passes/StaticResourceComponent/QubitRemapPass.hpp"
#include "qir/qat/Passes/StaticResourceComponent/ReplaceQubitOnResetPass.hpp"
#include "qir/qat/Passes/StaticResourceComponent/ResourceAnnotationPass.hpp"
#include "qir/qat/Passes/StaticResourceComponent/StaticResourceComponentConfiguration.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/Factory.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/TargetQisMappingPass.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/TargetQisMappingPassConfiguration.hpp"
#include "qir/qat/Passes/ValidationPass/TargetProfileConfiguration.hpp"
#include "qir/qat/Passes/ValidationPass/TargetQisConfiguration.hpp"
#include "qir/qat/Passes/ZExtTransformPass/ZExtTransformPass.hpp"
#include "qir/qat/Rules/RuleSet.hpp"
#include "qir/qat/Utils/FunctionToModule.hpp"

namespace microsoft::quantum
{

std::shared_ptr<QirAdaptor> QirAdaptorFactory::newQirAdaptor(
    String const& name,
    OptimizationLevel const& /*optimization_level*/,
    bool debug)
{
    debug_                         = debug;
    auto qubit_allocation_manager  = BasicAllocationManager::createNew();
    auto result_allocation_manager = BasicAllocationManager::createNew();

    if (configuration_manager_.has<TargetQisMappingPassConfiguration>())
    {
        auto cfg = configuration_manager_.get<TargetQisMappingPassConfiguration>();
        qubit_allocation_manager->setReuseRegisters(cfg.shouldReuseQubits());
        result_allocation_manager->setReuseRegisters(cfg.shouldReuseResults());
    }

    // Creating adaptor
    // TODO(issue-12): Set target machine
    auto ret = std::make_shared<QirAdaptor>(
        configuration_manager_, name, logger_, debug, nullptr, qubit_allocation_manager, result_allocation_manager);

    for (auto& c : components_)
    {
        if (debug)
        {
            llvm::outs() << "Setting " << c.first << " up\n";
        }

        c.second(*this, *ret);
    }

    // Creating validator
    auto validator = std::make_unique<Validator>(
        configuration_manager_.get<TargetProfileConfiguration>(), configuration_manager_.get<TargetQisConfiguration>(),
        logger_, debug);

    ret->setValidator(std::move(validator));

    return ret;
}

void QirAdaptorFactory::newAdaptorContext(String const& name, bool debug)
{
    qubit_allocation_manager_  = BasicAllocationManager::createNew();
    result_allocation_manager_ = BasicAllocationManager::createNew();

    if (configuration_manager_.has<TargetQisMappingPassConfiguration>())
    {
        auto cfg = configuration_manager_.get<TargetQisMappingPassConfiguration>();
        qubit_allocation_manager_->setReuseRegisters(cfg.shouldReuseQubits());
        result_allocation_manager_->setReuseRegisters(cfg.shouldReuseResults());
    }

    adaptor_ = std::make_shared<QirAdaptor>(
        configuration_manager_, name, logger_, debug, nullptr, qubit_allocation_manager_, result_allocation_manager_);
}

void QirAdaptorFactory::addComponent(String const& name)
{
    if (adaptor_ == nullptr)
    {
        throw std::runtime_error("Please initialize a new context before adding a component.");
    }

    bool found = false;
    for (auto& c : components_)
    {
        if (c.first == name)
        {
            c.second(*this, *adaptor_);
            found = true;
            break;
        }
    }

    if (!found)
    {
        throw std::runtime_error("Could not find component " + name);
    }
}

QirAdaptorFactory::QirAdaptorPtr QirAdaptorFactory::finalizeAdaptor()
{
    auto ret = adaptor_;
    adaptor_.reset();

    return ret;
}

llvm::ModulePassManager QirAdaptorFactory::createValidationModulePass(PassBuilder&, OptimizationLevel const&, bool)
{
    throw std::runtime_error("Validation is not supported yet.");
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

    registerAdaptorComponent<FunctionReplacementConfiguration>(
        "adaptor.replacement-linking",
        [logger](FunctionReplacementConfiguration const& cfg, QirAdaptor& adaptor)
        {
            auto& mam = adaptor.moduleAnalysisManager();
            mam.registerPass([&] { return FunctionReplacementAnalysisPass(cfg, logger); });
            auto& ret = adaptor.modulePassManager();

            ret.addPass(FunctionAnnotatorPass(cfg));

            auto pass = FunctionReplacementPass(cfg);
            pass.setLogger(logger);
            ret.addPass(std::move(pass));
        });

    registerAdaptorComponent<LlvmPassesConfiguration>(
        "adaptor.llvm-optimization",
        [](LlvmPassesConfiguration const& cfg, QirAdaptor& adaptor)
        {
            auto& mpm = adaptor.modulePassManager();

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

            llvm::FunctionPassManager fpm;
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
                fpm.addPass(llvm::SROAPass());
                fpm.addPass(llvm::SCCPPass());
            }

            if (cfg.eliminateDeadCode())
            {
                fpm.addPass(llvm::ADCEPass());
                mpm.addPass(llvm::GlobalDCEPass());
            }
            mpm.addPass(FunctionToModule(std::move(fpm)));
        });

    registerAdaptorComponent<RemoveNonEntrypointFunctionsPassConfiguration>(
        "adaptor.remove-non-entrypoint-functions",
        [logger](RemoveNonEntrypointFunctionsPassConfiguration const& cfg, QirAdaptor& adaptor)
        {
            auto& mpm = adaptor.modulePassManager();

            mpm.addPass(RemoveNonEntrypointFunctionsPass(cfg, logger));
        });

    registerAdaptorComponent<TargetQisMappingPassConfiguration>(
        "adaptor.target-qis-mapping",
        [logger](TargetQisMappingPassConfiguration const& cfg, QirAdaptor& adaptor)
        {
            auto& ret = adaptor.modulePassManager();

            // Defining the mapping
            RuleSet rule_set;
            auto    factory = RuleFactory(
                   rule_set, adaptor.getQubitAllocationManager(), adaptor.getResultAllocationManager(), logger);
            factory.usingConfiguration(adaptor.configurationManager().get<TargetQisMappingPassConfiguration>());

            // Creating adaptor pass
            auto pass = TargetQisMappingPass(std::move(rule_set), cfg);
            pass.setLogger(logger);
            ret.addPass(std::move(pass));
        });

    registerAdaptorComponent<TargetProfileMappingConfiguration>(
        "adaptor.target-profile-mapping",
        [logger](TargetProfileMappingConfiguration const& cfg, QirAdaptor& adaptor)
        {
            auto&                     mpm = adaptor.modulePassManager();
            llvm::FunctionPassManager fpm;
            if (cfg.shouldAddInstCombinePass())
            {
                fpm.addPass(llvm::InstCombinePass(1000));
            }

            if (cfg.shouldAddAggressiveInstCombinePass())
            {
                fpm.addPass(llvm::AggressiveInstCombinePass());
            }

            if (cfg.shouldAddSroaPass())
            {
                fpm.addPass(llvm::SROAPass());
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
            mpm.addPass(FunctionToModule(std::move(fpm)));
        });

    registerAdaptorComponent<PostTransformValidationPassConfiguration>(
        "adaptor.straightline-code-requirement",
        [logger](PostTransformValidationPassConfiguration const& cfg, QirAdaptor& adaptor)
        {
            auto& mpm = adaptor.modulePassManager();
            mpm.addPass(PostTransformValidationPass(cfg, logger));
        });

    registerAdaptorComponent<StaticResourceComponentConfiguration>(
        "adaptor.static-resources",
        [logger](StaticResourceComponentConfiguration const& cfg, QirAdaptor& adaptor)
        {
            auto& mpm = adaptor.modulePassManager();
            auto& fam = adaptor.functionAnalysisManager();
            fam.registerPass([&] { return AllocationAnalysisPass(logger); });

            llvm::FunctionPassManager fpm;
            fpm.addPass(ReplaceQubitOnResetPass(cfg, logger));
            fpm.addPass(QubitRemapPass(cfg, logger));

            if (cfg.shouldInlineAfterIdChange() && cfg.isChangingIds())
            {
                fpm.addPass(llvm::InstCombinePass(1000));
                fpm.addPass(llvm::AggressiveInstCombinePass());
                fpm.addPass(llvm::SROAPass());
                fpm.addPass(llvm::SCCPPass());
                fpm.addPass(llvm::SimplifyCFGPass());
                fpm.addPass(llvm::LowerSwitchPass());
                fpm.addPass(llvm::ADCEPass());
                fpm.addPass(ZExtTransformPass());
            }

            fpm.addPass(ResourceAnnotationPass(cfg, logger));
            mpm.addPass(FunctionToModule(std::move(fpm)));
            mpm.addPass(llvm::GlobalDCEPass());
        });

    registerAdaptorComponent<GroupingPassConfiguration>(
        "adaptor.grouping",
        [logger](GroupingPassConfiguration const& cfg, QirAdaptor& adaptor)
        {
            if (cfg.groupQis())
            {
                auto& mam = adaptor.moduleAnalysisManager();
                mam.registerPass([&] { return GroupingAnalysisPass(cfg, logger); });
                auto& ret = adaptor.modulePassManager();

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

ConfigurationManager& QirAdaptorFactory::configurationManager()
{
    return configuration_manager_;
}

ConfigurationManager const& QirAdaptorFactory::configurationManager() const
{
    return configuration_manager_;
}

} // namespace microsoft::quantum

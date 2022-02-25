// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Generators/LlvmPassesConfiguration.hpp"
#include "Generators/ProfileGenerator.hpp"
#include "GroupingPass/GroupingAnalysisPass.hpp"
#include "GroupingPass/GroupingPass.hpp"
#include "GroupingPass/GroupingPassConfiguration.hpp"
#include "Rules/Factory.hpp"
#include "Rules/RuleSet.hpp"
#include "TransformationRulesPass/TransformationRulesPass.hpp"
#include "TransformationRulesPass/TransformationRulesPassConfiguration.hpp"
#include "ValidationPass/ValidationPassConfiguration.hpp"

#include "Llvm/Llvm.hpp"

namespace microsoft
{
namespace quantum
{

    Profile ProfileGenerator::newProfile(String const& name, OptimizationLevel const& optimisation_level, bool debug)
    {

        auto qubit_allocation_manager  = BasicAllocationManager::createNew();
        auto result_allocation_manager = BasicAllocationManager::createNew();

        auto cfg = configuration_manager_.get<TransformationRulesPassConfiguration>();
        qubit_allocation_manager->setReuseRegisters(cfg.shouldReuseQubits());
        result_allocation_manager->setReuseRegisters(cfg.shouldReuseResults());

        // Creating profile
        // TODO(issue-12): Set target machine
        Profile ret{name, debug, nullptr, qubit_allocation_manager, result_allocation_manager};

        auto module_pass_manager = createGenerationModulePassManager(ret, optimisation_level, debug);

        ret.setModulePassManager(std::move(module_pass_manager));

        // Creating validator
        auto validator =
            std::make_unique<Validator>(configuration_manager_.get<ValidationPassConfiguration>(), false, debug);

        ret.setValidator(std::move(validator));

        return ret;
    }

    llvm::ModulePassManager ProfileGenerator::createGenerationModulePassManager(
        Profile&                 profile,
        OptimizationLevel const& optimisation_level,
        bool                     debug)
    {
        auto&                   pass_builder = profile.passBuilder();
        llvm::ModulePassManager ret{};

        module_pass_manager_ = &ret;
        pass_builder_        = &pass_builder;
        optimisation_level_  = optimisation_level;
        debug_               = debug;

        for (auto& c : components_)
        {
            if (debug)
            {
                llvm::outs() << "Setting " << c.first << " up\n";
            }

            c.second(this, profile);
        }

        return ret;
    }

    llvm::ModulePassManager ProfileGenerator::createValidationModulePass(PassBuilder&, OptimizationLevel const&, bool)
    {
        throw std::runtime_error("Validation is not supported yet.");
    }

    llvm::ModulePassManager& ProfileGenerator::modulePassManager()
    {
        return *module_pass_manager_;
    }

    llvm::PassBuilder& ProfileGenerator::passBuilder()
    {
        return *pass_builder_;
    }

    ConfigurationManager& ProfileGenerator::configurationManager()
    {
        return configuration_manager_;
    }

    ConfigurationManager const& ProfileGenerator::configurationManager() const
    {
        return configuration_manager_;
    }

    ProfileGenerator::OptimizationLevel ProfileGenerator::optimisationLevel() const
    {
        return optimisation_level_;
    }

    bool ProfileGenerator::isDebugMode() const
    {
        return debug_;
    }

    void ProfileGenerator::replicateProfileComponent(String const& id)
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

    void ProfileGenerator::setupDefaultComponentPipeline()
    {
        using namespace llvm;

        registerProfileComponent<LlvmPassesConfiguration>(
            "llvm-optimisation", [](LlvmPassesConfiguration const& cfg, ProfileGenerator* ptr, Profile& /*profile*/) {
                auto& mpm = ptr->modulePassManager();

                // Always inline
                if (cfg.alwaysInline())
                {

                    auto& pass_builder = ptr->passBuilder();
                    mpm.addPass(llvm::AlwaysInlinerPass());
                    auto                           inline_param = getInlineParams(cfg.inlineParameter());
                    llvm::ModuleInlinerWrapperPass inliner_pass = ModuleInlinerWrapperPass(inline_param);
                    mpm.addPass(std::move(inliner_pass));
                }

                // Unroll loop
                if (cfg.unrollLoops())
                {
                    auto& pass_builder = ptr->passBuilder();

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

                    mpm.addPass(createModuleToFunctionPassAdaptor(llvm::LoopUnrollPass(loop_config)));
                }

                if (cfg.useLlvmOptPipeline())
                {
                    auto                                 pass_pipeline = cfg.optPipelineConfig();
                    llvm::PassBuilder::OptimizationLevel opt           = ptr->optimisationLevel();
                    if (!pass_pipeline.empty())
                    {
                        auto& pass_builder = ptr->passBuilder();

                        if (auto err = pass_builder.parsePassPipeline(mpm, pass_pipeline, false, false))
                        {
                            throw std::runtime_error(
                                "Failed to set pass pipeline up. Value: '" + pass_pipeline +
                                "', error: " + toString(std::move(err)));
                        }
                    }
                    else
                    {
                        // If not explicitly disabled, we fall back to the default LLVM pipeline
                        auto&                   pass_builder = ptr->passBuilder();
                        llvm::ModulePassManager pipeline1    = pass_builder.buildPerModuleDefaultPipeline(opt);
                        mpm.addPass(std::move(pipeline1));

                        llvm::ModulePassManager pipeline2 =
                            pass_builder.buildModuleSimplificationPipeline(opt, llvm::PassBuilder::ThinLTOPhase::None);
                        mpm.addPass(std::move(pipeline2));

                        llvm::ModulePassManager pipeline3 =
                            pass_builder.buildModuleOptimizationPipeline(opt, ptr->isDebugMode());
                        mpm.addPass(std::move(pipeline3));
                    }
                }

                mpm.addPass(createModuleToFunctionPassAdaptor(llvm::SimplifyCFGPass()));

                if (cfg.eliminateMemory())
                {
                    mpm.addPass(createModuleToFunctionPassAdaptor(llvm::PromotePass()));
                }

                if (cfg.eliminateConstants())
                {
                    mpm.addPass(createModuleToFunctionPassAdaptor(llvm::SCCPPass()));
                }

                if (cfg.eliminateDeadCode())
                {
                    mpm.addPass(createModuleToFunctionPassAdaptor(llvm::ADCEPass()));
                }
            });

        registerProfileComponent<TransformationRulesPassConfiguration>(
            "transformation-rules",
            [](TransformationRulesPassConfiguration const& cfg, ProfileGenerator* ptr, Profile& profile) {
                auto& ret = ptr->modulePassManager();

                // Defining the mapping
                RuleSet rule_set;
                auto    factory =
                    RuleFactory(rule_set, profile.getQubitAllocationManager(), profile.getResultAllocationManager());
                factory.usingConfiguration(ptr->configurationManager().get<FactoryConfiguration>());

                // Creating profile pass
                ret.addPass(TransformationRulesPass(std::move(rule_set), cfg, &profile));

                // TODO(issue-59): Move to a separate pass.
                ret.addPass(createModuleToFunctionPassAdaptor(llvm::InstCombinePass(1000)));
                ret.addPass(createModuleToFunctionPassAdaptor(llvm::AggressiveInstCombinePass()));
                ret.addPass(createModuleToFunctionPassAdaptor(llvm::SCCPPass()));
                ret.addPass(createModuleToFunctionPassAdaptor(llvm::SimplifyCFGPass()));
            });

        // TODO(issue-59): Causes memory sanitation issue
        // replicateProfileComponent("llvm-optimisation");

        registerProfileComponent<GroupingPassConfiguration>(
            "grouping", [](GroupingPassConfiguration const& cfg, ProfileGenerator* ptr, Profile& profile) {
                if (cfg.circuitSeparation())
                {
                    auto& mam = profile.moduleAnalysisManager();
                    mam.registerPass([&] { return GroupingAnalysisPass(cfg); });
                    auto& ret = ptr->modulePassManager();

                    ret.addPass(GroupingPass(cfg));
                }
            });
    }

} // namespace quantum
} // namespace microsoft

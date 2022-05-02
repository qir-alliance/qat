// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Generators/ConfigurableProfileGenerator.hpp"
#include "Rules/Factory.hpp"
#include "Rules/FactoryConfig.hpp"
#include "Rules/RuleSet.hpp"
#include "TransformationRulesPass/TransformationRulesPass.hpp"

#include "Llvm/Llvm.hpp"

#include <iostream>

namespace microsoft
{
namespace quantum
{

    ConfigurableProfileGenerator::ConfigurableProfileGenerator()
    {
        configurationManager().addConfig<ValidationPassConfiguration>();

        setupDefaultComponentPipeline();
    }

    ConfigurableProfileGenerator::ConfigurableProfileGenerator(
        ConfigureFunction const&                    configure,
        TransformationRulesPassConfiguration const& profile_pass_config,
        LlvmPassesConfiguration const&              llvm_config)
    {
        configurationManager().addConfig<ValidationPassConfiguration>();
        setupDefaultComponentPipeline();

        replaceProfileComponent<TransformationRulesPassConfiguration>(
            "transformation-rules",
            [configure](TransformationRulesPassConfiguration const& config, ProfileGenerator* ptr, Profile& profile) {
                auto& ret = ptr->modulePassManager();

                // Defining the mapping
                RuleSet rule_set;
                auto    factory = RuleFactory(
                    rule_set, profile.getQubitAllocationManager(), profile.getResultAllocationManager(), nullptr);
                configure(rule_set);

                // Creating profile pass
                ret.addPass(TransformationRulesPass(std::move(rule_set), config, &profile));
            });

        configurationManager().setConfig(profile_pass_config);
        configurationManager().setConfig(llvm_config);
    }

    TransformationRulesPassConfiguration const& ConfigurableProfileGenerator::ruleTransformationConfig() const
    {
        return configurationManager().get<TransformationRulesPassConfiguration>();
    }

    LlvmPassesConfiguration const& ConfigurableProfileGenerator::llvmPassesConfig() const
    {
        return configurationManager().get<LlvmPassesConfiguration>();
    }

} // namespace quantum
} // namespace microsoft

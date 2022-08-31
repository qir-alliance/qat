// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/AdaptorFactory/ConfigurableQirAdaptorFactory.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Rules/Factory.hpp"
#include "qir/qat/Rules/FactoryConfig.hpp"
#include "qir/qat/Rules/RuleSet.hpp"
#include "qir/qat/TransformationRulesPass/TransformationRulesPass.hpp"

#include <iostream>

namespace microsoft::quantum
{

ConfigurableQirAdaptorFactory::ConfigurableQirAdaptorFactory(SetupMode const& mode)
{
    configurationManager().addConfig<ValidationPassConfiguration>();

    if (mode == SetupMode::SetupPipeline)
    {
        setupDefaultComponentPipeline();
    }
}

ConfigurableQirAdaptorFactory::ConfigurableQirAdaptorFactory(
    ConfigureFunction const&                    configure,
    TransformationRulesPassConfiguration const& profile_pass_config,
    LlvmPassesConfiguration const&              llvm_config)
{
    configurationManager().addConfig<ValidationPassConfiguration>();
    setupDefaultComponentPipeline();

    replaceAdaptorComponent<TransformationRulesPassConfiguration>(
        "transformation-rules",
        [configure](
            TransformationRulesPassConfiguration const& config, QirAdaptorFactory& generator, QirAdaptor& profile)
        {
            auto& ret = generator.modulePassManager();

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

TransformationRulesPassConfiguration const& ConfigurableQirAdaptorFactory::ruleTransformationConfig() const
{
    return configurationManager().get<TransformationRulesPassConfiguration>();
}

LlvmPassesConfiguration const& ConfigurableQirAdaptorFactory::llvmPassesConfig() const
{
    return configurationManager().get<LlvmPassesConfiguration>();
}

} // namespace microsoft::quantum

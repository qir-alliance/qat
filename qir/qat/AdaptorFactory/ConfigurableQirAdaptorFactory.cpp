// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/AdaptorFactory/ConfigurableQirAdaptorFactory.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/TransformationRulesPass/TransformationRulesPass.hpp"
#include "qir/qat/Rules/Factory.hpp"
#include "qir/qat/Rules/FactoryConfig.hpp"
#include "qir/qat/Rules/RuleSet.hpp"

#include <iostream>

namespace microsoft::quantum
{

ConfigurableQirAdaptorFactory::ConfigurableQirAdaptorFactory(
    ConfigurationManager& configuration_manager,
    SetupMode const&      mode)
  : QirAdaptorFactory(configuration_manager)
{
    configurationManager().addConfig<TargetProfileConfiguration>();

    if (mode == SetupMode::SetupPipeline)
    {
        setupDefaultComponentPipeline();
    }
}

ConfigurableQirAdaptorFactory::ConfigurableQirAdaptorFactory(
    ConfigurationManager&                       configuration_manager,
    ConfigureFunction const&                    configure,
    TransformationRulesPassConfiguration const& adaptor_pass_config,
    LlvmPassesConfiguration const&              llvm_config)
  : QirAdaptorFactory(configuration_manager)
{
    configurationManager().addConfig<TargetProfileConfiguration>();
    setupDefaultComponentPipeline();

    replaceAdaptorComponent<TransformationRulesPassConfiguration>(
        "adaptor.transformation-rules",
        [configure](TransformationRulesPassConfiguration const& config, QirAdaptor& adaptor)
        {
            auto& ret = adaptor.modulePassManager();

            // Defining the mapping
            RuleSet rule_set;
            auto    factory = RuleFactory(
                   rule_set, adaptor.getQubitAllocationManager(), adaptor.getResultAllocationManager(), nullptr);
            configure(rule_set);

            // Creating adaptor pass
            ret.addPass(TransformationRulesPass(std::move(rule_set), config));
        });

    configurationManager().setConfig(adaptor_pass_config);
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

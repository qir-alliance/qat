// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/AdaptorFactory/ConfigurableQirAdaptorFactory.hpp"

#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/Factory.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/TargetQisMappingPass.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/TargetQisMappingPassConfiguration.hpp"
#include "qir/qat/Rules/RuleSet.hpp"

#include <iostream>

namespace microsoft::quantum
{

ConfigurableQirAdaptorFactory::ConfigurableQirAdaptorFactory(
    ConfigurationManager& configuration_manager,
    SetupMode const&      mode)
  : QirAdaptorFactory(configuration_manager)
{
    configurationManager().addConfig<TargetProfileConfiguration>("target.profile");
    configurationManager().addConfig<TargetQisConfiguration>("target.qis");

    if (mode == SetupMode::SetupPipeline)
    {
        setupDefaultComponentPipeline();
    }
}

ConfigurableQirAdaptorFactory::ConfigurableQirAdaptorFactory(
    ConfigurationManager&                    configuration_manager,
    ConfigureFunction const&                 configure,
    TargetQisMappingPassConfiguration const& adaptor_pass_config,
    LlvmPassesConfiguration const&           llvm_config)
  : QirAdaptorFactory(configuration_manager)
{
    configurationManager().addConfig<TargetProfileConfiguration>("target.profile");
    configurationManager().addConfig<TargetQisConfiguration>("target.qis");

    setupDefaultComponentPipeline();

    replaceAdaptorComponent<TargetQisMappingPassConfiguration>(
        "adaptor.target-qis-mapping",
        [configure](TargetQisMappingPassConfiguration const& config, QirAdaptor& adaptor)
        {
            auto& ret = adaptor.modulePassManager();

            // Defining the mapping
            RuleSet rule_set;
            auto    factory = RuleFactory(
                   rule_set, adaptor.getQubitAllocationManager(), adaptor.getResultAllocationManager(), nullptr);
            configure(rule_set);

            // Creating adaptor pass
            ret.addPass(TargetQisMappingPass(std::move(rule_set), config));
        });

    configurationManager().setConfig(adaptor_pass_config);
    configurationManager().setConfig(llvm_config);
}

TargetQisMappingPassConfiguration const& ConfigurableQirAdaptorFactory::ruleTransformationConfig() const
{
    return configurationManager().get<TargetQisMappingPassConfiguration>();
}

LlvmPassesConfiguration const& ConfigurableQirAdaptorFactory::llvmPassesConfig() const
{
    return configurationManager().get<LlvmPassesConfiguration>();
}

} // namespace microsoft::quantum

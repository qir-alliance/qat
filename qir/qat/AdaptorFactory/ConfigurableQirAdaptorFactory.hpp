#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/AdaptorFactory/LlvmPassesConfiguration.hpp"
#include "qir/qat/AdaptorFactory/QirAdaptorFactory.hpp"
#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/TargetQisMappingPassConfiguration.hpp"
#include "qir/qat/Rules/RuleSet.hpp"

namespace microsoft::quantum
{

/// ConfigurableQirAdaptorFactory defines a adaptor that configures the rule set used by the QirAdaptor
/// pass. This adaptor is useful for generating dynamic adaptors and is well suited for testing
/// purposes or YAML configured transformation of the IR.
class ConfigurableQirAdaptorFactory : public QirAdaptorFactory
{
  public:
    using ConfigureFunction = std::function<void(RuleSet&)>; ///< Function type that configures a rule set.
    enum class SetupMode
    {
        DoNothing,
        SetupPipeline
    };

    /// Default constructor. This constructor adds components for rule transformation and LLVM passes.
    /// These are configurable through the corresponding configuration classes which can be access
    /// through the configuration manager.
    explicit ConfigurableQirAdaptorFactory(
        ConfigurationManager& configuration_manager,
        SetupMode const&      mode = SetupMode::SetupPipeline);

    /// The constructor takes a lambda function which configures the rule set. This
    /// function is invoked during the creation of the generation module. This constructor
    /// further overrides the default configuration
    explicit ConfigurableQirAdaptorFactory(
        ConfigurationManager&                    configuration_manager,
        ConfigureFunction const&                 configure,
        TargetQisMappingPassConfiguration const& adaptor_pass_config =
            TargetQisMappingPassConfiguration::createDisabled(),
        LlvmPassesConfiguration const& llvm_config = LlvmPassesConfiguration::createDisabled());

    // Shorthand notation to access configurations
    //

    /// Returns a constant reference to the rule transformation configuration.
    TargetQisMappingPassConfiguration const& ruleTransformationConfig() const;

    /// Returns a constant reference to the LLVM passes configuration.
    LlvmPassesConfiguration const& llvmPassesConfig() const;
};

} // namespace microsoft::quantum

// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/ValidationPass/TargetQisConfiguration.hpp"

#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

namespace microsoft::quantum
{

void TargetQisConfiguration::setup(ConfigurationManager& config)
{
    config.setSectionName("Validation configuration", "");
    // CLI and config accessible

    config.addParameter(
        allowed_qis_, "allowed-qis", "Allowed quantum instruction set.",
        ConfigurationManager::ParameterVisibility::ConfigOnly);
    config.addParameter(allow_any_qis_, "allowed-any-qis", "Whether or not to allow any quantum instruction.");
}

String TargetQisConfiguration::adaptorName() const
{
    return adaptor_name_;
}

TargetQisConfiguration TargetQisConfiguration::fromQirAdaptorName(String const& name)
{
    auto target_config = TargetQisConfiguration();
    if (name == "generic")
    {
        target_config.allow_any_qis_ = true;
    }
    else if (name == "default")
    {
        target_config.allow_any_qis_ = false;
        target_config.allowed_qis_   = Set{
            "__quantum__qis__cnot__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__cz__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__cx__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__cy__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__h__body:void (%Qubit*)",
            "__quantum__qis__s__body:void (%Qubit*)",
            "__quantum__qis__s__adj:void (%Qubit*)",
            "__quantum__qis__t__body:void (%Qubit*)",
            "__quantum__qis__t__adj:void (%Qubit*)",
            "__quantum__qis__x__body:void (%Qubit*)",
            "__quantum__qis__y__body:void (%Qubit*)",
            "__quantum__qis__z__body:void (%Qubit*)",
            "__quantum__qis__rx__body:void (double, %Qubit*)",
            "__quantum__qis__ry__body:void (double, %Qubit*)",
            "__quantum__qis__rz__body:void (double, %Qubit*)",
            "__quantum__qis__reset__body:void (%Qubit*)",
            "__quantum__qis__mz__body:void (%Qubit*, %Result*)",
            "__quantum__qis__read_result__body:i1 (%Result*)",

        };
    }
    else if (name == "provider_4bf9")
    {
        target_config.allow_any_qis_ = false;
        target_config.allowed_qis_   = Set{
            "__quantum__qis__cnot__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__cz__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__swap__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__h__body:void (%Qubit*)",
            "__quantum__qis__s__body:void (%Qubit*)",
            "__quantum__qis__s__adj:void (%Qubit*)",
            "__quantum__qis__t__body:void (%Qubit*)",
            "__quantum__qis__t__adj:void (%Qubit*)",
            "__quantum__qis__x__body:void (%Qubit*)",
            "__quantum__qis__y__body:void (%Qubit*)",
            "__quantum__qis__z__body:void (%Qubit*)",
            "__quantum__qis__rx__body:void (double, %Qubit*)",
            "__quantum__qis__ry__body:void (double, %Qubit*)",
            "__quantum__qis__rz__body:void (double, %Qubit*)",
            "__quantum__qis__reset__body:void (%Qubit*)",
            "__quantum__qis__mz__body:void (%Qubit*, %Result*)",
            "__quantum__qis__read_result__body:i1 (%Result*)",

        };
    }
    else if (name == "provider_7ee0")
    {
        target_config.allow_any_qis_ = false;
        target_config.allowed_qis_   = Set{
            "__quantum__qis__cnot__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__cz__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__h__body:void (%Qubit*)",
            "__quantum__qis__s__body:void (%Qubit*)",
            "__quantum__qis__s__adj:void (%Qubit*)",
            "__quantum__qis__t__body:void (%Qubit*)",
            "__quantum__qis__t__adj:void (%Qubit*)",
            "__quantum__qis__x__body:void (%Qubit*)",
            "__quantum__qis__y__body:void (%Qubit*)",
            "__quantum__qis__z__body:void (%Qubit*)",
            "__quantum__qis__rx__body:void (double, %Qubit*)",
            "__quantum__qis__ry__body:void (double, %Qubit*)",
            "__quantum__qis__rz__body:void (double, %Qubit*)",
            "__quantum__qis__reset__body:void (%Qubit*)",
            "__quantum__qis__mz__body:void (%Qubit*, %Result*)",
            "__quantum__qis__read_result__body:i1 (%Result*)",

        };
    }
    else if (name == "provider_b340")
    {
        target_config.allow_any_qis_ = false;
        target_config.allowed_qis_   = Set{
            "__quantum__qis__cnot__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__cz__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__swap__body:void (%Qubit*, %Qubit*)",
            "__quantum__qis__h__body:void (%Qubit*)",
            "__quantum__qis__s__body:void (%Qubit*)",
            "__quantum__qis__s__adj:void (%Qubit*)",
            "__quantum__qis__t__body:void (%Qubit*)",
            "__quantum__qis__t__adj:void (%Qubit*)",
            "__quantum__qis__x__body:void (%Qubit*)",
            "__quantum__qis__y__body:void (%Qubit*)",
            "__quantum__qis__z__body:void (%Qubit*)",
            "__quantum__qis__rx__body:void (double, %Qubit*)",
            "__quantum__qis__ry__body:void (double, %Qubit*)",
            "__quantum__qis__rz__body:void (double, %Qubit*)",
            "__quantum__qis__mz__body:void (%Qubit*, %Result*)",
            "__quantum__qis__read_result__body:i1 (%Result*)",
        };
    }
    else
    {
        throw std::runtime_error("Invalid adaptor " + name);
    }

    target_config.adaptor_name_ = name;

    return target_config;
}

TargetQisConfiguration::Set const& TargetQisConfiguration::allowedQis() const
{
    return allowed_qis_;
}

TargetQisConfiguration::Set const& TargetQisConfiguration::irreversibleOperations() const
{
    return irreversible_operations_;
}

} // namespace microsoft::quantum

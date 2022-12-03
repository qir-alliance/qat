// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Passes/ValidationPass/TargetQisConfiguration.hpp"

#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

namespace microsoft::quantum
{

void TargetQisConfiguration::setup(ConfigurationManager& config)
{
    config.setSectionName("Target QIS validation", "Configuration for QIS validation");
    // CLI and config accessible

    config.addParameter(
        allowed_qis_, "allowed-qis", "Allowed quantum instruction set.",
        ConfigurationManager::ParameterVisibility::ConfigOnly);

    config.addParameter(allow_any_qis_, "allow-any-qis", "Whether or not to allow any quantum instruction.");

    config.addParameter(irreversible_operations_, "irreversible-operations", "Set of irreversal operation names.");

    config.addParameter(requires_qubits_, "requires-qubits", "Whether or not qubits are required in the IR.");
    config.addParameter(requires_results_, "requires-results", "Whether or not results are required in the IR.");
}

String TargetQisConfiguration::targetName() const
{
    return target_name_;
}

bool TargetQisConfiguration::requiresQubits() const
{
    return requires_qubits_;
}

bool TargetQisConfiguration::requiresResults() const
{
    return requires_results_;
}

bool TargetQisConfiguration::allowAnyQis() const
{
    return allow_any_qis_;
}

TargetQisConfiguration TargetQisConfiguration::fromQirTargetName(String const& name)
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
        target_config.irreversible_operations_ = Set{"__quantum__qis__mz__body", "__quantum__qis__reset__body"};
    }
    else
    {
        throw std::runtime_error("Invalid adaptor " + name);
    }

    target_config.target_name_ = name;

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

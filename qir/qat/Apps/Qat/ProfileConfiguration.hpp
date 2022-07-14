#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.
#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/ValidationPass/ValidationPassConfiguration.hpp"

namespace microsoft::quantum
{

void configureGenericProfile(ConfigurationManager& configuration_manager)
{
    // Transformation
    // TODO(tfr):

    // Setting profile validation configuration
    configuration_manager.addConfig<ValidationPassConfiguration>(
        "validation-configuration", ValidationPassConfiguration::fromProfileName("generic"));
}

void configureDefaultProfile(ConfigurationManager& configuration_manager)
{
    // Transformation
    // TODO(tfr):

    // Setting profile validation configuration
    configuration_manager.addConfig<ValidationPassConfiguration>(
        "validation-configuration", ValidationPassConfiguration::fromProfileName("default"));
}

void configureProvider4bf9Profile(ConfigurationManager& configuration_manager)
{

    // Transformation
    // TODO(tfr):

    // Setting profile validation configuration
    configuration_manager.addConfig<ValidationPassConfiguration>(
        "validation-configuration", ValidationPassConfiguration::fromProfileName("provider_4bf9"));
}

void configureProvider7ee0Profile(ConfigurationManager& configuration_manager)
{
    // Transformation
    // TODO(tfr):

    // Setting profile validation configuration
    configuration_manager.addConfig<ValidationPassConfiguration>(
        "validation-configuration", ValidationPassConfiguration::fromProfileName("provider_7ee0"));
}

void configureProviderb340Profile(ConfigurationManager& configuration_manager)
{
    // Transformation
    // TODO(tfr):

    // Setting profile validation configuration
    configuration_manager.addConfig<ValidationPassConfiguration>(
        "validation-configuration", ValidationPassConfiguration::fromProfileName("provider_b340"));
}

void configureProfile(String const& name, ConfigurationManager& configuration_manager)
{
    if (name == "generic")
    {
        configureGenericProfile(configuration_manager);
    }
    else if (name == "default")
    {
        configureDefaultProfile(configuration_manager);
    }
    else if (name == "provider_4bf9")
    {
        configureProvider4bf9Profile(configuration_manager);
    }
    else if (name == "provider_7ee0")
    {
        configureProvider7ee0Profile(configuration_manager);
    }
    else if (name == "provider_b340")
    {
        configureProviderb340Profile(configuration_manager);
    }
    else
    {
        throw std::runtime_error("Invalid profile " + name);
    }
}
#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/Passes/ValidationPass/TargetProfileConfiguration.hpp"
#include "qir/qat/Passes/ValidationPass/TargetQisConfiguration.hpp"

namespace microsoft::quantum
{

void configureGenericQirAdaptor(ConfigurationManager& configuration_manager);
void configureDefaultQirAdaptor(ConfigurationManager& configuration_manager);

void configureProvider4bf9QirAdaptor(ConfigurationManager& configuration_manager);
void configureProvider7ee0QirAdaptor(ConfigurationManager& configuration_manager);

void configureProviderb340QirAdaptor(ConfigurationManager& configuration_manager);
void configureQirAdaptor(String const& name, ConfigurationManager& configuration_manager);

} // namespace microsoft::quantum

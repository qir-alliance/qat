#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/ValidationPass/ValidationPassConfiguration.hpp"

namespace microsoft::quantum
{

void configureGenericProfile(ConfigurationManager& configuration_manager);
void configureDefaultProfile(ConfigurationManager& configuration_manager);

void configureProvider4bf9Profile(ConfigurationManager& configuration_manager);
void configureProvider7ee0Profile(ConfigurationManager& configuration_manager);

void configureProviderb340Profile(ConfigurationManager& configuration_manager);
void configureProfile(String const& name, ConfigurationManager& configuration_manager);

} // namespace microsoft::quantum

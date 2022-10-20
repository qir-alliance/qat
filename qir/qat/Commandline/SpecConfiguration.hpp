#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

namespace microsoft
{
namespace quantum
{

    class SpecConfiguration
    {
      public:
        void setup(ConfigurationManager& config)
        {
            config.setSectionName("Specification", "Convention for a given specification");
            config.addParameter(
                version_, "spec-version", "Specification version.",
                ConfigurationManager::ParameterVisibility::ConfigOnly);
            config.addParameter(
                entry_point_attr_, "entry-point-attr", "Specifies the attribute indicating the entry point.",
                ConfigurationManager::ParameterVisibility::ConfigOnly);
            config.addParameter(
                qir_runtime_prefix_, "qir-runtime-prefix", "QIR runtime prefix.",
                ConfigurationManager::ParameterVisibility::ConfigOnly);
        }

      private:
        String version_{"0.9"};
        String entry_point_attr_{"EntryPoint"};
        String qir_runtime_prefix_{"__quantum__rt__"};
    };

} // namespace quantum
} // namespace microsoft

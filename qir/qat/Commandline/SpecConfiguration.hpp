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
                entry_point_attr_, "entry-point-attr", "Specifies the attribute name indicating the entry point.");

            config.addParameter(
                qir_profiles_attr_, "qir-profiles-attr",
                "Specifies the attribute name indicating the profile compliance.");
            config.addParameter(
                output_labeling_schema_attr_, "output-labeling-schema-attr",
                "Specifies the attribute name indicating the output labaling scheme.");
            config.addParameter(
                required_num_qubits_attr_, "required-num-qubits-attr",
                "Specifies the attribute name indicating the required number of qubits.");
            config.addParameter(
                required_num_results_attr_, "required-num-results-attr",
                "Specifies the attribute name indicating the required number of results.");

            config.addParameter(
                max_index_qubits_attr_, "max-index-qubits-attr",
                "Specifies the attribute name indicating the maxiumum index of qubits used.");
            config.addParameter(
                max_index_results_attr_, "max-index-results-attr",
                "Specifies the attribute name indicating the maxiumum index of results used.");

            config.addParameter(
                replace_with_attr_, "replace-with-attr",
                "Specifies the attribute name indicating replacement linking.");
            config.addParameter(
                irreversible_attr_, "irreversible-attr", "Specifies the attribute name indicating irrevesibility.");

            config.addParameter(qir_runtime_prefix_, "qir-runtime-prefix", "QIR runtime prefix.");
        }

        String version() const
        {
            return version_;
        }

        String entryPointAttr() const
        {
            return entry_point_attr_;
        }

        String qirProfilesAttr() const
        {
            return qir_profiles_attr_;
        }

        String outputLabelingSchemaAttr() const
        {
            return output_labeling_schema_attr_;
        }

        String requiredNumQubitsAttr() const
        {
            return required_num_qubits_attr_;
        }

        String requiredNumResultsAttr() const
        {
            return required_num_results_attr_;
        }

        String replaceWithAttr() const
        {
            return replace_with_attr_;
        }

        String irreversibleAttr() const
        {
            return irreversible_attr_;
        }

        String qirRuntimePrefix() const
        {
            return qir_runtime_prefix_;
        }

      private:
        String version_{"0.9"};

        // Attribute names
        //
        // TODO(issue-150): Update to comply with spec once Q# is updated

        String entry_point_attr_{"EntryPoint"};
        String qir_profiles_attr_{"qir_profiles"};
        String output_labeling_schema_attr_{"output_labeling_schema"};
        String required_num_qubits_attr_{"requiredQubits"};
        String required_num_results_attr_{"requiredResults"};
        String max_index_qubits_attr_{"maxQubitIndex"};
        String max_index_results_attr_{"maxResultIndex"};

        String replace_with_attr_{"replaceWith"};
        String irreversible_attr_{"irreversible"};

        // Naming convention
        //
        String qir_runtime_prefix_{"__quantum__rt__"};
    };

} // namespace quantum
} // namespace microsoft

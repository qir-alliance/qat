#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Commandline/ConfigurationManager.hpp"
#include "QatTypes/QatTypes.hpp"

namespace microsoft
{
namespace quantum
{

    class StaticResourcePassConfiguration
    {
      public:
        using Set = std::unordered_set<std::string>;
        // Setup and construction
        //

        StaticResourcePassConfiguration() = default;

        /// Setup function that adds the configuration flags to the ConfigurationManager. See the
        /// ConfigurationManager documentation for more details on how the setup process is implemented.
        void setup(ConfigurationManager& config);

        /// Whether or not to annotate every function with the number of qubits they use.
        bool shouldAnnotateQubitUse() const;

        /// Whether or not to annotate every function with the number of results they use.
        bool shouldAnnotateResultUse() const;

        /// Whether or not to annotate every function with the maximum qubit index accessed.
        bool shouldAnnotateMaxQubitIndex() const;

        /// Whether or not to annotate every function with the maximum result index accessed.
        bool shouldAnnotateMaxResultIndex() const;

        /// Whether or not qubits should be replaced upon resetting
        bool shouldReplaceQubitsOnReset() const;

        /// Whether or not qubit ids should be re-indexed sequentially starting from 0
        bool shouldReindexQubits() const;

        /// Creates a configuration where all features are disabled
        static StaticResourcePassConfiguration createDisabled();

      private:
        bool annotate_qubit_use_{true};
        bool annotate_result_use_{true};

        bool annotate_max_qubit_index_{true};
        bool annotate_max_result_index_{true};

        bool replace_qubit_on_reset_{false};
        bool reindex_qubits_{false};
    };

} // namespace quantum
} // namespace microsoft

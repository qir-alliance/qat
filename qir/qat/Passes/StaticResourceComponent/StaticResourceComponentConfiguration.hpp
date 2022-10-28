#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

namespace microsoft::quantum
{

class StaticResourceComponentConfiguration
{
  public:
    using Set              = std::unordered_set<std::string>;
    using DeferredValuePtr = DeferredValue::DeferredValuePtr;

    // Setup and construction
    //

    StaticResourceComponentConfiguration() = default;

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

    /// Whether or not this component should inline after changing qubit ids
    bool shouldInlineAfterIdChange() const;

    /// Whether or not the configuration is set to changing qubit ids
    bool isChangingIds() const;

    /// Creates a configuration where all features are disabled
    static StaticResourceComponentConfiguration createDisabled();

    void enableAnnotateQubitUse();
    void enableAnnotateResultUse();
    void enableAnnotateMaxQubitIndex();
    void enableAnnotateMaxResultIndex();
    void enableReplaceQubitOnReset();
    void enableReindexQubits();
    void enableInlineAfterIdChange();

    // Attribute names used for annotation
    //

    String requiredNumQubitsAttr() const;
    String requiredNumResultsAttr() const;
    String maxIndexQubitsAttr() const;
    String maxIndexResultsAttr() const;

  private:
    bool annotate_qubit_use_{true};
    bool annotate_result_use_{true};

    bool annotate_max_qubit_index_{true};
    bool annotate_max_result_index_{true};

    bool replace_qubit_on_reset_{false};
    bool reindex_qubits_{false};

    bool inline_after_id_change_{true};

    DeferredValuePtr required_num_qubits_attr_{nullptr};
    DeferredValuePtr required_num_results_attr_{nullptr};
    DeferredValuePtr max_index_qubits_attr_{nullptr};
    DeferredValuePtr max_index_results_attr_{nullptr};
};

} // namespace microsoft::quantum

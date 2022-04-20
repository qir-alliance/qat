#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Commandline/ConfigurationManager.hpp"
#include "QatTypes/QatTypes.hpp"

namespace microsoft {
namespace quantum {

class StaticResourcePassConfiguration
{
public:
  using Set = std::unordered_set<std::string>;
  // Setup and construction
  //

  StaticResourcePassConfiguration() = default;

  /// Setup function that adds the configuration flags to the ConfigurationManager. See the
  /// ConfigurationManager documentation for more details on how the setup process is implemented.
  void setup(ConfigurationManager &config);

  /// Whether or not to annotate every function with the number of qubits they use.
  bool shouldAnnotateQubitUse() const;

  /// Whether or not to annotate every function with the number of results they use.
  bool shouldAnnotateResultUse() const;

  /// Whether or not to annotate every function with the maximum qubit index accessed.
  bool shouldAnnotateMaxQubitIndex() const;

  /// Whether or not to annotate every function with the maximum result index accessed.
  bool shouldAnnotateMaxResultIndex() const;

private:
  bool annotate_qubit_use_{true};
  bool annotate_result_use_{true};

  bool annotate_max_qubit_index_{true};
  bool annotate_max_result_index_{true};
};

}  // namespace quantum
}  // namespace microsoft

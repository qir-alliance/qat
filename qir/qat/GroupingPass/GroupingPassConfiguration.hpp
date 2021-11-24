#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Commandline/ConfigurationManager.hpp"
#include "QatTypes/QatTypes.hpp"

namespace microsoft {
namespace quantum {

class GroupingPassConfiguration
{
public:
  using Set = std::unordered_set<std::string>;
  // Setup and construction
  //

  /// Setup function that adds the configuration flags to the ConfigurationManager. See the
  /// ConfigurationManager documentation for more details on how the setup process is implemented.
  void setup(ConfigurationManager &config)
  {
    config.setSectionName("Grouping quantum instructions", "");
    config.addParameter(group_allocations_, "group-allocations", "");
    config.addParameter(group_quantum_circuit_, "group-quantum-circuit", "");
    config.addParameter(group_measurement_, "group-measurement", "");
  }

private:
  bool group_allocations_{true};
  bool group_quantum_circuit_{true};
  bool group_measurement_{true};
};

}  // namespace quantum
}  // namespace microsoft

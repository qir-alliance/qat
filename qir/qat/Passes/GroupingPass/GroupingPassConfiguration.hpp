#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

namespace microsoft::quantum
{

class GroupingPassConfiguration // TODO(unknown): Rename GroupingPass -> CircuitSeparation
{
  public:
    using Set = std::unordered_set<std::string>;
    // Setup and construction
    //

    /// Setup function that adds the configuration flags to the ConfigurationManager. See the
    /// ConfigurationManager documentation for more details on how the setup process is implemented.
    void setup(ConfigurationManager& config)
    {
        config.setSectionName("Circuit separation", "Separation of quantum and classical circuits");
        config.addExperimentalParameter(
            circuit_separation_, true, false, "separate-circuits",
            "Whether or not to separate quantum and classical circuits");
    }

    static GroupingPassConfiguration createDisabled()
    {
        GroupingPassConfiguration ret;

        ret.circuit_separation_ = false;

        return ret;
    }

    bool circuitSeparation() const
    {
        return circuit_separation_;
    }

  private:
    bool circuit_separation_{true};
};

} // namespace microsoft::quantum

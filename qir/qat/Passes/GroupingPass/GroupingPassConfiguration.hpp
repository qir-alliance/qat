#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

namespace microsoft::quantum
{

class GroupingPassConfiguration
{
  public:
    using Set = std::unordered_set<std::string>;
    // Setup and construction
    //

    /// Setup function that adds the configuration flags to the ConfigurationManager. See the
    /// ConfigurationManager documentation for more details on how the setup process is implemented.
    void setup(ConfigurationManager& config)
    {
        config.setSectionName("Grouping quantum instructions", "Separation of quantum and classical operations");
        config.addExperimentalParameter(
            group_qis_, true, false, "group-qis", "Whether or not to separate quantum and classical circuits");
    }

    static GroupingPassConfiguration createDisabled()
    {
        GroupingPassConfiguration ret;

        ret.group_qis_ = false;

        return ret;
    }

    bool groupQis() const
    {
        return group_qis_;
    }

  private:
    bool group_qis_{true};
};

} // namespace microsoft::quantum

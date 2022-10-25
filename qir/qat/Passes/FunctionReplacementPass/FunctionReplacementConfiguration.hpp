#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

namespace microsoft::quantum
{

class FunctionReplacementConfiguration
{
  public:
    using Set = std::unordered_set<std::string>;
    // Setup and construction
    //

    /// Setup function that adds the configuration flags to the ConfigurationManager. See the
    /// ConfigurationManager documentation for more details on how the setup process is implemented.
    void setup(ConfigurationManager& config)
    {
        config.setSectionName(
            "Replacement linking", "Replaces function calls if the given function is present in the IR");

        config.addParameter(injected_annotations_, "replace-functions", "Functions to be replaced.");
        config.addParameter(should_remove_call_attributes_, "remove-call-attributes", "Discard all call attributes");
    }

    static FunctionReplacementConfiguration createDisabled()
    {
        FunctionReplacementConfiguration ret;

        return ret;
    }

    StringMap const& injectedAnnotations() const
    {
        return injected_annotations_;
    }

    bool shouldRemoveCallAttributes() const
    {
        return should_remove_call_attributes_;
    }

  private:
    StringMap injected_annotations_{};
    bool      should_remove_call_attributes_{false};
};

} // namespace microsoft::quantum

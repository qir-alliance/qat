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
        config.setSectionName("Weak linking", "");

        config.addParameter(injected_annotations_, "replace-functions", "Functions to be replaced.");
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

  private:
    StringMap injected_annotations_{};
};

} // namespace microsoft::quantum

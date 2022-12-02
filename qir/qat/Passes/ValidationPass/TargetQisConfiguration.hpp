#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <functional>
#include <set>

namespace microsoft::quantum
{

class TargetQisConfiguration
{
  public:
    using Set = std::unordered_set<std::string>;
    // Setup and construction
    //

    TargetQisConfiguration() = default;

    /// Setup function that adds the configuration flags to the ConfigurationManager. See the
    /// ConfigurationManager documentation for more details on how the setup process is implemented.
    void setup(ConfigurationManager& config);

    static TargetQisConfiguration fromQirTargetName(String const& name);
    Set const&                    allowedQis() const;
    Set const&                    irreversibleOperations() const;

    bool allowAnyQis() const;
    bool requiresQubits() const;
    bool requiresResults() const;

    String targetName() const;

  private:
    String target_name_{"null"};
    bool   allow_any_qis_{false};
    Set    allowed_qis_{};
    Set    irreversible_operations_{};

    bool requires_qubits_{false};
    bool requires_results_{false};
};

} // namespace microsoft::quantum

#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <functional>
#include <set>

namespace microsoft::quantum
{
class OpcodeValue
{
  public:
    OpcodeValue(String const& name, String const& fi = "") // NOLINT
      : id_{name}
      , predicate_{fi}
    {
    }

    OpcodeValue()                   = default;
    OpcodeValue(OpcodeValue&&)      = default;
    OpcodeValue(OpcodeValue const&) = default;
    OpcodeValue& operator=(OpcodeValue&&) = default;
    OpcodeValue& operator=(OpcodeValue const&) = default;
    bool         operator==(OpcodeValue const& other) const
    {
        return id_ == other.id_ && predicate_ == other.predicate_;
    }

    String& id()
    {
        return id_;
    }
    String const& id() const
    {
        return id_;
    }

    String& predicate()
    {
        return predicate_;
    }

    String const& predicate() const
    {
        return predicate_;
    }

  private:
    String id_{""};
    String predicate_{""};
};
} // namespace microsoft::quantum

namespace std
{
template <> struct hash<microsoft::quantum::OpcodeValue>
{
    size_t operator()(microsoft::quantum::OpcodeValue const& x) const
    {
        hash<std::string> hasher;
        return hasher(x.id() + "." + x.predicate());
    }
};
} // namespace std

namespace microsoft::quantum
{

class ValidationPassConfiguration
{
  public:
    using Set       = std::unordered_set<std::string>;
    using OpcodeSet = std::unordered_set<OpcodeValue>;

    // Setup and construction
    //

    ValidationPassConfiguration() = default;

    /// Setup function that adds the configuration flags to the ConfigurationManager. See the
    /// ConfigurationManager documentation for more details on how the setup process is implemented.
    void setup(ConfigurationManager& config);

    static ValidationPassConfiguration fromProfileName(String const& name);
    OpcodeSet const&                   allowedOpcodes() const;
    Set const&                         allowedExternalCallNames() const;

    bool allowInternalCalls() const;
    bool allowlistOpcodes() const;
    bool allowlistExternalCalls() const;

    bool       allowlistPointerTypes() const;
    Set const& allowedPointerTypes() const;

    bool requiresQubits() const;
    bool requiresResults() const;

    bool allowPoison() const;
    bool allowUndef() const;

    String profileName() const;

  private:
    void addAllowedExternalCall(String const& name);
    void addAllowedOpcode(String const& name);
    void addAllowedPointerType(String const& name);

    String profile_name_{"null"};

    OpcodeSet opcodes_{};
    Set       external_calls_{};
    Set       allowed_pointer_types_{};

    bool allowlist_opcodes_{true};
    bool allowlist_external_calls_{true};
    bool allow_internal_calls_{false};
    bool allowlist_pointer_types_{false};

    bool allow_primitive_return_{true};
    bool allow_struct_return_{true};
    bool allow_pointer_return_{true};

    bool requires_qubits_{false};
    bool requires_results_{false};

    bool allow_poison_{true};
    bool allow_undef_{true};
};

} // namespace microsoft::quantum

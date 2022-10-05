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

class OpcodeSet
{
  public:
    using Container = std::unordered_set<OpcodeValue>;
    explicit OpcodeSet(Container const& data = {})
      : data_{data}
    {
    }
    explicit OpcodeSet(Container&& data)
      : data_{std::move(data)}
    {
    }

    Container& data()
    {
        return data_;
    }

    Container const& data() const
    {
        return data_;
    }

    void toString(String& value) const
    {
        std::stringstream val;
        bool              not_first = false;
        for (auto const& d : data_)
        {
            if (not_first)
            {
                val << ";";
            }
            val << d.id() << "," << d.predicate();
            not_first = true;
        }

        value = val.str();
    }

    void insertPart(String const& part)
    {
        // bind_.insert(part);
        auto p = part.find(',');
        if (p == std::string::npos)
        {
            throw std::runtime_error("Execpted ',' but it is not present in opcode segment");
        }

        auto a = part.substr(0, p);
        auto b = part.substr(p + 1, part.size() - p - 1);
        data_.insert(OpcodeValue(a, b));
    }

    void fromString(String const& value)
    {
        data_.clear();
        std::size_t last_p = 0;
        auto        p      = value.find(';', last_p);
        while (p != String::npos)
        {
            auto part = value.substr(last_p, p - last_p);
            insertPart(part);

            last_p = p + 1;
            p      = value.find(';', last_p);
        }

        if (last_p < value.size())
        {
            auto part = value.substr(last_p, p - last_p);
            insertPart(part);
        }
    }

    void toYaml(YAML::Node& node) const
    {
        for (auto const& d : data_)
        {
            YAML::Node pair;
            pair["id"]        = d.id();
            pair["predicate"] = d.predicate();
            node.push_back(pair);
        }
    }

    void fromYaml(YAML::Node const& node)
    {
        for (auto& pair : node)
        {
            auto a = pair["id"].as<String>();
            auto b = pair["predicate"].as<String>();
            data_.insert(OpcodeValue(a, b));
        }
    }

  private:
    Container data_;
};
static_assert(HasQatSerializers<OpcodeSet>::VALUE, "Expected OpcodeSet to be serializable.");

class TargetProfileConfiguration
{
  public:
    using Set = std::unordered_set<std::string>;
    //    using OpcodeSet = std::unordered_set<OpcodeValue>;

    // Setup and construction
    //

    TargetProfileConfiguration() = default;

    /// Setup function that adds the configuration flags to the ConfigurationManager. See the
    /// ConfigurationManager documentation for more details on how the setup process is implemented.
    void setup(ConfigurationManager& config);

    static TargetProfileConfiguration fromQirTargetName(String const& name);
    OpcodeSet const&                  allowedOpcodes() const;
    Set const&                        allowedExternalCallNames() const;

    bool allowInternalCalls() const;
    bool allowlistOpcodes() const;
    bool allowlistExternalCalls() const;

    bool       allowlistPointerTypes() const;
    Set const& allowedPointerTypes() const;

    bool allowPoison() const;
    bool allowUndef() const;

    String targetName() const;

  private:
    void addAllowedExternalCall(String const& name);
    void addAllowedOpcode(String const& name);
    void addAllowedPointerType(String const& name);

    String target_name_{"null"};

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

    bool allow_poison_{true};
    bool allow_undef_{true};
};

} // namespace microsoft::quantum

#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/IConfigBind.hpp"
#include "qir/qat/Commandline/ParameterParser.hpp"
#include "qir/qat/Commandline/SerializationTraits.hpp"
#include "qir/qat/Llvm/Llvm.hpp"

#include <iomanip>
#include <iostream>
#include <sstream>
#include <stack>
#include <type_traits>
#include <typeindex>
#include <vector>

namespace microsoft::quantum
{
class OpcodeSet;

/// Generic implementation of the bind interface for different types. This class holds the name of
/// the command line parameter and a reference variable corresponding to it. It implements
/// serializers and deserializers to allow transforming strings to native values and vice versa.
template <typename T> class ConfigBind : public IConfigBind
{
  public:
    using Type       = typename std::decay<T>::type;
    using StringSet  = std::unordered_set<std::string>;
    using StringList = std::vector<std::string>;

    /// Helper template to conditionally disable implementation unless a specific type is used.
    template <typename A, typename B, typename R>
    using EnableIf = typename std::enable_if<std::is_same<A, B>::value, R>::type;

    // Constructors, operators and destructor
    //

    ConfigBind()                  = delete;
    ConfigBind(ConfigBind const&) = delete;
    ConfigBind(ConfigBind&&)      = delete;
    ConfigBind& operator=(ConfigBind const&) = delete;
    ConfigBind& operator=(ConfigBind&&) = delete;
    ~ConfigBind() override              = default;

    /// Constructor to bind value to parameter. This class holds a reference to a variable together
    /// with the name it is expected to have when passed through the parameter parser.
    ConfigBind(
        Type&               bind,
        T                   default_value,
        String const&       name,
        String const&       description,
        ParameterVisibility visibility = ParameterVisibility::CliAndConfig);

    // Marks the configuration as being experimental.
    void markAsExperimental(Type const& off_value);

    // Interface implementation
    //

    /// Adds the argument to the parser.
    bool setupArguments(ParameterParser& parser) override;

    /// Configures the bound value. This method examines the parsed input
    /// and use updates the bound value accordingly.
    bool configure(ParameterParser& parser, bool experimental_mode) override;

    /// Resets the current value to the default value
    void reset() override;

    /// String representation of the bound value.
    String value() override;

    /// Pointer to underlying data.
    void* pointer() const override;

    /// Pointer to underlying default value.
    void* pointerDefaultValue() override;

    /// Type index of contained data
    std::type_index valueType() const override;

    /// Method to load value from YAML configuration
    void setValueFromYamlNode(YAML::Node const& node) override;

    /// Dumps the current value to the node
    void updateValueInYamlNode(YAML::Node& node) override;

  private:
    template <typename A, typename R = A>
    using EnableIfSerializable = typename std::enable_if<HasQatSerializers<A>::VALUE, R>::type;
    template <typename A, typename R = A>
    using EnableIfNotSerializable = typename std::enable_if<!HasQatSerializers<A>::VALUE, R>::type;

    /// Fallback load and save YAML node value
    template <typename R> EnableIfNotSerializable<R, void> loadYaml(YAML::Node const& node, R& value);
    template <typename R> EnableIfNotSerializable<R, void> saveYaml(YAML::Node& node, R const& value);

    // Yaml serialization for data types with custom serializers
    template <typename R> EnableIfSerializable<R, void> loadYaml(YAML::Node const& node, R& value);
    template <typename R> EnableIfSerializable<R, void> saveYaml(YAML::Node& node, R const& value);

    // Yaml serialization for string sets
    void loadYaml(YAML::Node const& node, StringSet& value);
    void saveYaml(YAML::Node& node, StringSet const& value);

    // Yaml serialization for string lists
    void loadYaml(YAML::Node const& node, StringList& value);
    void saveYaml(YAML::Node& node, StringList const& value);

    // Yaml serialization for string maps
    void loadYaml(YAML::Node const& node, StringMap& value);
    void saveYaml(YAML::Node& node, StringMap const& value);

    /// Generic function to setup arguments of any type.
    template <typename R> bool setupArguments(ParameterParser&, R const&);

    /// Specialized function setting arguments up for booleans.
    bool setupArguments(ParameterParser& parser, bool const&);

    /// Generic function that changes the parameter name based on the value type and default value.
    template <typename R> EnableIfNotSerializable<R, void> alterNameBasedOnType(R const& default_value);

    /// Specialization for serializable types
    template <typename R> EnableIfSerializable<R, void> alterNameBasedOnType(R const& default_value);

    /// Fallback method for non-serializable types
    template <typename R> void nonSerializableTypeAlterName(R const& default_value);

    /// Specialized function that changes the parameter name based on default value for booleans.
    void nonSerializableTypeAlterName(bool const& default_value);

    /// Specialized function that changes the parameter name based on default value for string sets.
    void nonSerializableTypeAlterName(StringSet const& default_value);

    /// Specialized function that changes the parameter name based on default value for string lists.
    void nonSerializableTypeAlterName(StringList const& default_value);

    /// Generic string serialization for types with no serialization defined.
    template <typename A> EnableIfNotSerializable<A, String> valueAsString(A const& val);

    // String serialization for data types with custom serializers
    template <typename A> EnableIfSerializable<A, String> valueAsString(A const&);

    /// Specialized function that changes the parameter name based on default value for booleans.
    void alterNameBasedOnType(StringMap const& default_value);

    /// Generic string serialization.
    template <typename A> String nonSerializableValueAsString(A const&);

    /// Specialized serialization for booleans.
    template <typename A> String nonSerializableValueAsString(EnableIf<A, bool, A> const&);

    /// Specialized serialization for string sets.
    template <typename A> String nonSerializableValueAsString(EnableIf<A, StringSet, A> const&);

    /// Specialized serialization for string lists.
    template <typename A> String nonSerializableValueAsString(EnableIf<A, StringList, A> const&);

    /// Specialized serialization for string map.
    template <typename A> String valueAsString(EnableIf<A, StringMap, A> const&);

    /// Generic deserialization of string values from parser.
    template <typename A> EnableIfNotSerializable<A, void> loadValue(ParameterParser& parser, A const& default_value);

    /// Specialized deserialization of string set
    template <typename A> EnableIfSerializable<A, void> loadValue(ParameterParser& parser, A const& default_value);

    /// Specialized deserialization of string values from parser for booleans.
    template <typename A> void loadValue(ParameterParser& parser, EnableIf<A, bool, A> const& default_value);

    /// Specialized deserialization of string values from parser for strings.
    template <typename A> void loadValue(ParameterParser& parser, EnableIf<A, String, A> const& default_value);

    /// Specialized deserialization of string-string maps
    template <typename A> void loadValue(ParameterParser& parser, EnableIf<A, StringMap, A> const& default_value);

    /// Inserts a key value pair into the string map
    void insertKeyValueInStringMap(StringMap& map, String const& part);

    /// Specialized deserialization of string values from parser for string sets.
    template <typename A> void loadValue(ParameterParser& parser, EnableIf<A, StringSet, A> const& default_value);

    /// Specialized deserialization of string values from parser for string lists.
    template <typename A> void loadValue(ParameterParser& parser, EnableIf<A, StringList, A> const& default_value);

    Type& bind_;                   ///< Bound variable to be updated.
    Type  default_value_;          ///< Default value.
    Type  experimental_off_value_; ///< Value when experimental is not enabled.
};

template <typename T>
ConfigBind<T>::ConfigBind(
    Type&               bind,
    T                   default_value,
    String const&       name,
    String const&       description,
    ParameterVisibility visibility)
  : IConfigBind(name, description, visibility)
  , bind_{bind}
  , default_value_{std::move(default_value)}
{
    alterNameBasedOnType(default_value_);
}

template <typename T> template <typename R> void ConfigBind<T>::nonSerializableTypeAlterName(R const& default_value)
{
    std::stringstream ss{""};
    ss << default_value;
    setDefault(static_cast<String>(ss.str()));
}

template <typename T> void ConfigBind<T>::nonSerializableTypeAlterName(bool const& default_value)
{
    markAsFlag();

    if (default_value)
    {
        setDefault("true");
    }
    else
    {
        setDefault("false");
    }
}

template <typename T> void ConfigBind<T>::alterNameBasedOnType(StringMap const& /*default_value*/)
{
    std::stringstream ss{""};
    bool              not_first = true;
    for (auto const& p : bind_)
    {
        if (not_first)
        {
            ss << ",";
        }
        ss << p.first << "=" << p.second;
    }

    setDefault(static_cast<String>(ss.str()));
}

template <typename T> void ConfigBind<T>::nonSerializableTypeAlterName(StringSet const& /*default_value*/)
{
    std::stringstream ss{""};
    bool              not_first = false;
    for (auto const& p : bind_)
    {
        if (not_first)
        {
            ss << ",";
        }
        ss << p;
        not_first = true;
    }

    setDefault(static_cast<String>(ss.str()));
}

template <typename T> void ConfigBind<T>::nonSerializableTypeAlterName(StringList const& /*default_value*/)
{
    std::stringstream ss{""};
    bool              not_first = false;
    for (auto const& p : bind_)
    {
        if (not_first)
        {
            ss << ",";
        }
        ss << p;
        not_first = true;
    }

    setDefault(static_cast<String>(ss.str()));
}

template <typename T> bool ConfigBind<T>::setupArguments(ParameterParser& parser)
{
    auto sn = shorthandNotation();
    if (!sn.empty())
    {
        parser.addShorthandNotation(name(), sn);
    }

    return setupArguments(parser, default_value_);
}

template <typename T> template <typename R> bool ConfigBind<T>::setupArguments(ParameterParser&, R const&)
{
    return true;
}

template <typename T> bool ConfigBind<T>::setupArguments(ParameterParser& parser, bool const&)
{
    parser.addFlag(name());
    return true;
}

template <typename T>
template <typename R>
typename ConfigBind<T>::template EnableIfNotSerializable<R, void> ConfigBind<T>::alterNameBasedOnType(
    R const& default_value)
{
    nonSerializableTypeAlterName(default_value);
}

template <typename T>
template <typename R>
typename ConfigBind<T>::template EnableIfSerializable<R, void> ConfigBind<T>::alterNameBasedOnType(
    R const& /*default_value*/)
{
    String ret;
    bind_.toString(ret);
    setDefault(static_cast<String>(ret));
}

template <typename T> void ConfigBind<T>::reset()
{
    if (isExperimental())
    {
        bind_ = experimental_off_value_;
    }
    else
    {
        bind_ = default_value_;
    }
}

template <typename T> bool ConfigBind<T>::configure(ParameterParser& parser, bool experimental_mode)
{
    if (!isAvailableToCli())
    {
        return false;
    }

    if (!isExperimental())
    {
        // For non-experimental parameters we load the default value
        loadValue<Type>(parser, default_value_);
    }
    else
    {
        // If the parameter is experimental and we are in experimental mode
        if (experimental_mode)
        {
            // ... we load the default value
            loadValue<Type>(parser, default_value_);
        }
        else
        {
            // ... and else we load the experimental off value
            bind_ = experimental_off_value_;
        }
    }
    return true;
}

template <typename T> void ConfigBind<T>::markAsExperimental(Type const& off_value)
{
    experimental_off_value_ = off_value;

    makeSettingExperimental();
}

template <typename T> String ConfigBind<T>::value()
{
    return valueAsString<Type>(default_value_);
}

template <typename T>
template <typename A>
typename ConfigBind<T>::template EnableIfNotSerializable<A, String> ConfigBind<T>::valueAsString(A const& val)
{
    return nonSerializableValueAsString<A>(val);
}

template <typename T>
template <typename A>
typename ConfigBind<T>::template EnableIfSerializable<A, String> ConfigBind<T>::valueAsString(A const&)
{
    String ret;
    bind_.toString(ret);
    return ret;
}

template <typename T> template <typename A> String ConfigBind<T>::nonSerializableValueAsString(A const&)
{
    std::stringstream ss{""};
    ss << bind_;
    return static_cast<String>(ss.str());
}

template <typename T>
template <typename A>
String ConfigBind<T>::nonSerializableValueAsString(EnableIf<A, bool, A> const&)
{
    std::stringstream ss{""};
    ss << (bind_ ? "true" : "false");
    return static_cast<String>(ss.str());
}

template <typename T> template <typename A> String ConfigBind<T>::valueAsString(EnableIf<A, StringMap, A> const&)
{
    std::stringstream ss{""};
    bool              not_first = true;
    for (auto const& p : bind_)
    {
        if (not_first)
        {
            ss << ",";
        }
        ss << p.first << "=" << p.second;
    }
    return static_cast<String>(ss.str());
}

template <typename T>
template <typename A>
String ConfigBind<T>::nonSerializableValueAsString(EnableIf<A, StringSet, A> const&)
{
    std::stringstream ss{""};
    bool              not_first = false;
    for (auto const& p : bind_)
    {
        if (not_first)
        {
            ss << ",";
        }
        ss << p;
        not_first = true;
    }
    return static_cast<String>(ss.str());
}

template <typename T>
template <typename A>
String ConfigBind<T>::nonSerializableValueAsString(EnableIf<A, StringList, A> const&)
{
    std::stringstream ss{""};
    bool              not_first = false;
    for (auto const& p : bind_)
    {
        if (not_first)
        {
            ss << ",";
        }
        ss << p;
        not_first = true;
    }
    return static_cast<String>(ss.str());
}

template <typename T>
template <typename A>
typename ConfigBind<T>::template EnableIfNotSerializable<A, void> ConfigBind<T>::loadValue(
    ParameterParser& parser,
    A const& /*default_value*/)
{
    static_assert(!std::is_same<A, bool>::value, "Expected bool to be specialised");
    static_assert(!std::is_same<A, StringSet>::value, "Expected StringSet to be specialised");
    static_assert(!std::is_same<A, StringList>::value, "Expected StringList to be specialised");
    static_assert(!std::is_same<A, String>::value, "Expected String to be specialised");

    if (parser.has(name()))
    {
        std::stringstream ss{parser.get(name())};
        ss >> bind_;
    }
}

template <typename T>
template <typename A>
void ConfigBind<T>::loadValue(ParameterParser& parser, EnableIf<A, bool, A> const& /*default_value*/)
{
    if (parser.has(name()))
    {
        parser.markAsUsed(name());
        bind_ = true;
    }
    else if (parser.has("no-" + name()))
    {
        parser.markAsUsed("no-" + name());
        bind_ = false;
    }
}

template <typename T>
template <typename A>
void ConfigBind<T>::loadValue(ParameterParser& parser, EnableIf<A, String, A> const& /*default_value*/)
{

    if (parser.has(name()))
    {
        bind_ = parser.get(name());
    }
}

template <typename T> void ConfigBind<T>::insertKeyValueInStringMap(StringMap& map, String const& part)
{
    auto   q = part.find('=');
    String key{};
    String value{};

    if (q == String::npos)
    {
        llvm::errs() << "= not found.\n";
        key = part;
    }
    else
    {
        key   = part.substr(0, q);
        value = part.substr(q + 1, part.size() - q - 1);
    }

    map[key] = value;
}

template <typename T>
template <typename A>
void ConfigBind<T>::loadValue(ParameterParser& parser, EnableIf<A, StringSet, A> const& /*default_value*/)
{
    if (!parser.has(name()))
    {
        return;
    }

    auto value = parser.get(name());

    bind_.clear();
    std::size_t last_p = 0;
    auto        p      = value.find(',', last_p);
    while (p != String::npos)
    {
        auto part = value.substr(last_p, p - last_p);
        bind_.insert(part);

        last_p = p + 1;
        p      = value.find(',', last_p);
    }

    if (last_p < value.size())
    {
        auto part = value.substr(last_p, p - last_p);
        bind_.insert(part);
    }
}

template <typename T>
template <typename A>
void ConfigBind<T>::loadValue(ParameterParser& parser, EnableIf<A, StringList, A> const& /*default_value*/)
{
    if (!parser.has(name()))
    {
        return;
    }

    auto value = parser.get(name());

    bind_.clear();
    std::size_t last_p = 0;
    auto        p      = value.find(',', last_p);
    while (p != String::npos)
    {
        auto part = value.substr(last_p, p - last_p);
        bind_.push_back(part);

        last_p = p + 1;
        p      = value.find(',', last_p);
    }

    if (last_p < value.size())
    {
        auto part = value.substr(last_p, p - last_p);
        bind_.push_back(part);
    }
}

template <typename T>
template <typename A>
void ConfigBind<T>::loadValue(ParameterParser& parser, EnableIf<A, StringMap, A> const& /*default_value*/)
{
    if (!parser.has(name()))
    {
        return;
    }

    auto value = parser.get(name());

    bind_.clear();
    std::size_t last_p = 0;
    auto        p      = value.find(',', last_p);
    while (p != String::npos)
    {
        auto part = value.substr(last_p, p - last_p);
        insertKeyValueInStringMap(bind_, part);

        last_p = p + 1;
        p      = value.find(',', last_p);
    }

    if (last_p < value.size())
    {
        auto part = value.substr(last_p, p - last_p);
        insertKeyValueInStringMap(bind_, part);
    }
}

template <typename T>
template <typename A>
typename ConfigBind<T>::template EnableIfSerializable<A, void> ConfigBind<T>::loadValue(
    ParameterParser& parser,
    A const& /*default_value*/)
{
    if (!parser.has(name()))
    {
        return;
    }

    auto value = parser.get(name());

    bind_.fromString(value);
}

template <typename T> void* ConfigBind<T>::pointer() const
{
    return static_cast<void*>(&bind_);
}

template <typename T> void* ConfigBind<T>::pointerDefaultValue()
{
    return static_cast<void*>(&default_value_);
}

template <typename T> std::type_index ConfigBind<T>::valueType() const
{
    return std::type_index(typeid(T));
}

template <typename T> void ConfigBind<T>::setValueFromYamlNode(YAML::Node const& node)
{
    if (isLoadAndSavable() && node && node[name()])
    {
        loadYaml(node, bind_);
    }
}

template <typename T> void ConfigBind<T>::updateValueInYamlNode(YAML::Node& node)
{
    if (isLoadAndSavable())
    {
        saveYaml(node, bind_);
    }
}

template <typename T>
template <typename R>
typename ConfigBind<T>::template EnableIfNotSerializable<R, void> ConfigBind<T>::loadYaml(
    YAML::Node const& node,
    R&                value)
{
    value = node[name()].template as<T>();
}

template <typename T>
template <typename R>
typename ConfigBind<T>::template EnableIfNotSerializable<R, void> ConfigBind<T>::saveYaml(
    YAML::Node& node,
    R const&    value)
{
    node[name()] = value;
}

template <typename T> void ConfigBind<T>::loadYaml(YAML::Node const& node, StringSet& value)
{
    for (auto& v : node[name()])
    {
        value.insert(v.template as<String>());
    }
}

template <typename T> void ConfigBind<T>::loadYaml(YAML::Node const& node, StringList& value)
{
    value.clear();

    for (auto& v : node[name()])
    {
        value.push_back(v.template as<String>());
    }
}

template <typename T> void ConfigBind<T>::saveYaml(YAML::Node& node, StringSet const& value)
{
    YAML::Node list;

    for (auto& v : value)
    {
        list.push_back(v);
    }

    node[name()] = list;
}

template <typename T> void ConfigBind<T>::saveYaml(YAML::Node& node, StringList const& value)
{
    YAML::Node list;

    for (auto& v : value)
    {
        list.push_back(v);
    }

    node[name()] = list;
}

template <typename T> void ConfigBind<T>::loadYaml(YAML::Node const& node, StringMap& value)
{
    for (auto& v : node[name()])
    {
        value[v.first.template as<String>()] = v.second.template as<String>();
    }
}

template <typename T> void ConfigBind<T>::saveYaml(YAML::Node& node, StringMap const& value)
{
    YAML::Node ret;

    for (auto& v : value)
    {
        ret[v.first] = v.second;
    }

    node[name()] = ret;
}

template <typename T>
template <typename R>
typename ConfigBind<T>::template EnableIfSerializable<R, void> ConfigBind<T>::loadYaml(YAML::Node const& node, R& value)
{
    value.fromYaml(node[name()]);
}

template <typename T>
template <typename R>
typename ConfigBind<T>::template EnableIfSerializable<R, void> ConfigBind<T>::saveYaml(YAML::Node& node, R const& value)
{
    YAML::Node val;
    value.toYaml(val);
    node[name()] = val;
}

} // namespace microsoft::quantum

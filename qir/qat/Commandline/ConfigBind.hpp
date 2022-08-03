#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/IConfigBind.hpp"
#include "qir/qat/Commandline/ParameterParser.hpp"
#include "qir/qat/Llvm/Llvm.hpp"

#include <iomanip>
#include <iostream>
#include <sstream>
#include <type_traits>
#include <typeindex>

namespace microsoft::quantum
{

/// Generic implementation of the bind interface for different types. This class holds the name of
/// the command line parameter and a reference variable corresponding to it. It implements
/// serializers and deserializers to allow transforming strings to native values and vice versa.
template <typename T> class ConfigBind : public IConfigBind
{
  public:
    using Type = typename std::decay<T>::type;

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
    ConfigBind(Type& bind, T default_value, String const& name, String const& description);

    // Marks the configuration as being experimental.
    void markAsExperimental(Type const& off_value);

    // Interface implementation
    //

    /// Adds the argument to the parser.
    bool setupArguments(ParameterParser& parser) override;

    /// Configures the bound value. This method examines the parsed input
    /// and use updates the bound value accordingly.
    bool configure(ParameterParser& parser, bool experimental_mode) override;

    /// String representation of the bound value.
    String value() override;

    /// Pointer to underlying data.
    void* pointer() const override;

    /// Pointer to underlying default value.
    void* pointerDefaultValue() override;

    /// Type index of contained data
    std::type_index valueType() const override;

  private:
    /// Generic function to setup arguments of any type.
    template <typename R> bool setupArguments(ParameterParser&, R const&);

    /// Specialized function setting arguments up for booleans.
    bool setupArguments(ParameterParser& parser, bool const&);

    /// Generic function that changes the parameter name based on the value type and default value.
    template <typename R> void alterNameBasedOnType(R const& default_value);

    /// Specialized function that changes the parameter name based on default value for booleans.
    void alterNameBasedOnType(bool const& default_value);

    /// Specialized function that changes the parameter name based on default value for booleans.
    void alterNameBasedOnType(StringMap const& default_value);

    /// Generic string serialization.
    template <typename A> String valueAsString(A const&);

    /// Specialized serialization for booleans.
    template <typename A> String valueAsString(EnableIf<A, bool, A> const&);

    /// Specialized serialization for string map.
    template <typename A> String valueAsString(EnableIf<A, StringMap, A> const&);

    /// Generic deserialization of string values from parser.
    template <typename R> void loadValue(ParameterParser& parser, R const& default_value);

    /// Specialized deserialization of string values from parser for booleans.
    template <typename A> void loadValue(ParameterParser& parser, EnableIf<A, bool, A> const& default_value);

    /// Specialized deserialization of string values from parser for strings.
    template <typename A> void loadValue(ParameterParser& parser, EnableIf<A, String, A> const& default_value);

    /// Specialized deserialization of string-string maps
    template <typename A> void loadValue(ParameterParser& parser, EnableIf<A, StringMap, A> const& default_value);

    /// Inserts a key value pair into the string map
    void insertKeyValueInStringMap(StringMap& map, String const& part);

    Type& bind_;                   ///< Bound variable to be updated.
    Type  default_value_;          ///< Default value.
    Type  experimental_off_value_; ///< Value when experimental is not enabled.
};

template <typename T>
ConfigBind<T>::ConfigBind(Type& bind, T default_value, String const& name, String const& description)
  : IConfigBind(name, description)
  , bind_{bind}
  , default_value_{std::move(default_value)}
{
    alterNameBasedOnType(default_value_);
}

template <typename T> template <typename R> void ConfigBind<T>::alterNameBasedOnType(R const& default_value)
{
    std::stringstream ss{""};
    ss << default_value;
    setDefault(static_cast<String>(ss.str()));
}

template <typename T> void ConfigBind<T>::alterNameBasedOnType(bool const& default_value)
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

template <typename T> void ConfigBind<T>::alterNameBasedOnType(StringMap const& default_value)
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

template <typename T> bool ConfigBind<T>::setupArguments(ParameterParser& parser)
{
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

template <typename T> bool ConfigBind<T>::configure(ParameterParser& parser, bool experimental_mode)
{

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

template <typename T> template <typename A> String ConfigBind<T>::valueAsString(A const&)
{
    std::stringstream ss{""};
    ss << bind_;
    return static_cast<String>(ss.str());
}

template <typename T> template <typename A> String ConfigBind<T>::valueAsString(EnableIf<A, bool, A> const&)
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
template <typename R>
void ConfigBind<T>::loadValue(ParameterParser& parser, R const& default_value)
{
    bind_ = default_value;

    if (parser.has(name()))
    {
        std::stringstream ss{parser.get(name())};
        ss >> bind_;
    }
}

template <typename T>
template <typename A>
void ConfigBind<T>::loadValue(ParameterParser& parser, EnableIf<A, bool, A> const& default_value)
{
    bind_ = default_value;
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
void ConfigBind<T>::loadValue(ParameterParser& parser, EnableIf<A, String, A> const& default_value)
{
    bind_ = default_value;

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
void ConfigBind<T>::loadValue(ParameterParser& parser, EnableIf<A, StringMap, A> const& default_value)
{
    if (!parser.has(name()))
    {
        bind_ = default_value;
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

} // namespace microsoft::quantum

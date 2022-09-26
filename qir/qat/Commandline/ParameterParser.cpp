// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ParameterParser.hpp"

#include <iostream>
#include <stdexcept>
#include <string>
#include <unordered_map>

namespace microsoft::quantum
{

void ParameterParser::parseArgs(int argc, char const** argv)
{
    uint64_t                 i = 1;
    std::vector<ParsedValue> values;
    while (i < static_cast<uint64_t>(argc))
    {
        values.push_back(parseSingleArg(argv[i]));
        ++i;
    }

    i = 0;
    while (i < values.size())
    {
        auto& v = values[i];
        ++i;

        if (!v.is_key)
        {
            arguments_.push_back(v.value);
            continue;
        }

        unused_properties_.insert(v.value);
        if (i >= values.size())
        {

            settings_[v.value] = "true";
            continue;
        }

        auto& v2 = values[i];
        if (!v2.is_key && isOption(v.value))
        {
            settings_[v.value] = v2.value;
            ++i;
            continue;
        }

        settings_[v.value] = "true";
    }
}

void ParameterParser::addFlag(String const& v)
{
    flags_.insert(v);
}

String const& ParameterParser::get(String const& name, String const& default_value) noexcept
{
    auto it = settings_.find(name);
    if (it == settings_.end())
    {
        return default_value;
    }

    markAsUsed(name);
    return it->second;
}

String const& ParameterParser::get(String const& name)
{
    auto it = settings_.find(name);
    if (it == settings_.end())
    {
        throw std::runtime_error("Could not find setting '" + name + "'.");
    }

    markAsUsed(name);

    return it->second;
}

void ParameterParser::markAsUsed(String const& name)
{
    auto it = unused_properties_.find(name);
    if (it != unused_properties_.end())
    {
        unused_properties_.erase(it);
    }
}

ParameterParser::UnusedSettings const& ParameterParser::unusedSettings() const
{
    return unused_properties_;
}

bool ParameterParser::has(String const& name) const noexcept
{
    auto it = settings_.find(name);
    return (it != settings_.end());
}

ParameterParser::Arguments const& ParameterParser::arguments() const
{
    return arguments_;
}

String const& ParameterParser::getArg(Arguments::size_type const& n) const
{
    return arguments_[n];
}

ParameterParser::ParsedValue ParameterParser::parseSingleArg(String key)
{
    bool is_key = false;
    if (key.size() > 2 && key.substr(0, 2) == "--")
    {
        is_key = true;
        key    = key.substr(2);
    }
    else if (key.size() > 1 && key.substr(0, 1) == "-")
    {
        is_key = true;

        // Mapping shorthand notation
        key     = key.substr(1);
        auto it = shorthand_notation_.find(key);
        if (it == shorthand_notation_.end())
        {
            throw std::runtime_error("Unknown short hand notation " + key);
        }

        key = it->second;
    }
    return {is_key, key};
}

bool ParameterParser::isOption(String const& key)
{
    if (flags_.find(key) != flags_.end())
    {
        return false;
    }

    return true;
}

void ParameterParser::reset()
{
    arguments_.clear();
    settings_.clear();
    flags_.clear();
    shorthand_notation_.clear();
}

void ParameterParser::addShorthandNotation(String const& parameter, String const& shorthand)
{
    shorthand_notation_[shorthand] = parameter;
}

} // namespace microsoft::quantum

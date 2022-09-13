#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/QatTypes/QatTypes.hpp"

#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>

namespace microsoft::quantum
{

/// Parameter parser class which allows the developer to specify a set of default settings and
/// update those using the commandline argc and argv.
class ParameterParser
{
  public:
    using Arguments         = std::vector<String>;
    using Flags             = std::unordered_set<String>;
    using SettingsMap       = std::unordered_map<String, String>;
    using UnusedSettings    = std::unordered_set<String>;
    using ShorthandNotation = std::unordered_map<String, String>;

    // Construction and deconstrution configuration
    //

    ParameterParser() = default;

    // No copy construction.
    ParameterParser(ParameterParser const& other) = delete;

    // Allow move semantics.
    ParameterParser(ParameterParser&& other) = default;

    // Default destruction.
    ~ParameterParser() = default;

    // Configuration
    //

    /// Marks a name as a flag (as opposed to an option).
    /// This ensures that no parameter is expected after
    /// the flag is specified. For instance `--debug` is
    /// a flag as opposed to `--log-level 3` which is an
    /// option.
    void addFlag(String const& v);

    // Operation
    //

    /// Parses the command line arguments given the argc and argv
    /// from the main function.
    void parseArgs(int argc, char const** argv);

    /// Returns list of arguments without flags and/or options
    /// included.
    Arguments const& arguments() const;

    /// Returns the n'th commandline argument.
    String const& getArg(Arguments::size_type const& n) const;

    /// Gets a named setting, falling back to a default if the key is not found.
    String const& get(String const& name, String const& default_value) noexcept;

    /// Gets a named setting. This method throws if the setting is not present.
    String const& get(String const& name);

    /// Marks a flag as used.
    void markAsUsed(String const& name);

    /// Checks whether or not a given parameter is present.
    bool has(String const& name) const noexcept;

    /// Resets the state of the parser to its construction state
    void reset();

    /// Lists unknown settings
    UnusedSettings const& unusedSettings() const;

    /// Adds short hand notation to paramters
    void addShorthandNotation(String const& parameter, String const& shorthand);

  private:
    /// Struct that contains parsed and interpreted values of command line arguments.
    struct ParsedValue
    {
        bool   is_key{false}; ///< Whether or not a parsed value should be considered a key
        String value;         ///< Value after parsing.
    };

    // Helper functions
    //

    // Parses a single argument and returns the parsed value. This function
    // determines if the string was specified to be a key or a value.
    ParsedValue parseSingleArg(String key);

    /// Checks whether a key is an option (or a flag). Returns true if it is
    /// and option and false if it is a flags.
    bool isOption(String const& key);

    // Storage of parsed data
    //
    Flags             flags_{};              ///< Set of flags
    Arguments         arguments_{};          ///< List of remaining arguments
    SettingsMap       settings_;             ///< Settings map that keeps all specified settings.
    UnusedSettings    unused_properties_{};  ///< List of properties or flags which was not used.
    ShorthandNotation shorthand_notation_{}; ///< Map of shorthand notations
};

} // namespace microsoft::quantum

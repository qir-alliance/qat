#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/external/yaml.hpp"
#include "qir/qat/Commandline/ParameterParser.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/QatTypes/QatTypes.hpp"

#include <iomanip>
#include <iostream>
#include <sstream>
#include <type_traits>
#include <typeindex>

namespace microsoft::quantum
{

/// Interface class to bind a variable to a configuration flag. This class provides
/// the necessary interface to bind variables and populate their value based on given command-line
/// arguments.
class IConfigBind
{
  public:
    enum ParameterVisibility
    {
        None         = 0,
        CliOnly      = 1,
        ConfigOnly   = 2,
        CliAndConfig = CliOnly | ConfigOnly,
    };

    // Deleted constructors and deleted operators
    //
    // Strictly speaking the code would remain correct if we allowed copy and/or move, but
    // we have chosen to ban them by choice as potential bugs arising from allowing copy and/or
    // move can be difficult to find. We consider this behaviour a part of the interface definition.
    IConfigBind(IConfigBind const&) = delete;
    IConfigBind(IConfigBind&&)      = delete;
    IConfigBind& operator=(IConfigBind const&) = delete;
    IConfigBind& operator=(IConfigBind&&) = delete;

    // Virtual destructor
    //
    virtual ~IConfigBind();

    // Interface
    //

    /// Interface function to register configuration in the parser. This function
    /// register the configuration to the parameter parser. This makes the configuration
    /// available in the parameter parsers help function.  This method should return true if arguments
    /// were successfully setup.
    virtual bool setupArguments(ParameterParser& parser) = 0;

    /// Interface function to extract configuration from the command line arguments. Given an instance
    /// of the command line parameter parser, this function is meant to read the command line
    /// arguments, interpret it and set the bound variable value (if present). This method should
    /// return true if configure operation was successful.
    virtual bool configure(ParameterParser& parser, bool experimental_mode) = 0;

    /// Resets the value to the default value
    virtual void reset() = 0;

    /// Interface function to return a string representation of the current value of the
    /// bound variable.
    virtual String value() = 0;

    /// Pointer to underlying data.
    virtual void* pointer() const = 0;

    /// Pointer to underlying default value.
    virtual void* pointerDefaultValue() = 0;

    /// Type index of contained data
    virtual std::type_index valueType() const = 0;

    /// Method to load value from YAML configuration
    virtual void setValueFromYamlNode(YAML::Node const& node) = 0;

    /// Dumps the current value to the node
    virtual void updateValueInYamlNode(YAML::Node& node) = 0;

    // Properties
    //

    /// Returns the name of the bound configuration variable.
    String name() const;

    /// Returns the description of the configuration variable.
    String description() const;

    /// Indicates whether or not this
    bool isFlag() const;

    /// Returns the default value for the flag.
    String defaultValue() const;

    /// Indicates whether or not this is an experimental config
    bool isExperimental() const;

    /// Indicates whether the load and save functions should serialize
    /// this configuration.
    bool isLoadAndSavable() const;

    /// Indicates whether or not this paramter is available to the CLI
    bool isAvailableToCli() const;

    /// Set shorthand notation
    void setShorthandNotation(String const& name);

    /// Gets shorthand notation
    String shorthandNotation() const;

  protected:
    // Constructor
    //
    IConfigBind(
        String const&       name,
        String const&       description,
        ParameterVisibility visibility = ParameterVisibility::CliAndConfig);

    // Configuration
    //

    /// Sets the name of the configuration variable.
    void setName(String const& name);

    /// Marks the variable as a flag.
    void markAsFlag();

    /// Sets the default value as a string.
    void setDefault(String const& v);

    /// Marks the config as experimental
    void makeSettingExperimental();

  private:
    String name_{""};               ///< Name that sets the value.
    String shorthand_notation_{""}; ///< Shorthand notation.
    String description_{""};        ///< Description of the option or flag.
    bool   is_flag_{false};         ///< Whether or not the variable is a flag.
    String str_default_value_{""};  ///< Default value represented as a string.

    bool                is_experimental_{false};                        ///< Whether or not this config is experimental
    ParameterVisibility visibility_{ParameterVisibility::CliAndConfig}; ///< Visibility of the parameter
};

} // namespace microsoft::quantum

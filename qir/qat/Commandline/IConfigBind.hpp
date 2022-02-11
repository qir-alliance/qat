#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Commandline/ParameterParser.hpp"
#include "Llvm/Llvm.hpp"
#include "QatTypes/QatTypes.hpp"

#include <iomanip>
#include <iostream>
#include <sstream>
#include <type_traits>
#include <typeindex>

namespace microsoft {
namespace quantum {

/// Interface class to bind a variable to a configuration flag. This class provides
/// the necessary interface to bind variables and populate their value based on given command-line
/// arguments.
class IConfigBind
{
public:
  // Deleted constructors and deleted operators
  //
  // Strictly speaking the code would remain correct if we allowed copy and/or move, but
  // we have chosen to ban them by choice as potential bugs arising from allowing copy and/or
  // move can be difficult to find. We consider this behaviour a part of the interface definition.
  IConfigBind(IConfigBind const &) = delete;
  IConfigBind(IConfigBind &&)      = delete;
  IConfigBind &operator=(IConfigBind const &) = delete;
  IConfigBind &operator=(IConfigBind &&) = delete;

  // Virtual destructor
  //
  virtual ~IConfigBind();

  // Interface
  //

  /// Interface function to register configuration in the parser. This function
  /// register the configuration to the parameter parser. This makes the configuration
  /// available in the parameter parsers help function.  This method should return true if arguments
  /// were successfully setup.
  virtual bool setupArguments(ParameterParser &parser) = 0;

  /// Interface function to extract configuration from the command line arguments. Given an instance
  /// of the command line parameter parser, this function is meant to read the command line
  /// arguments, interpret it and set the bound variable value (if present). This method should
  /// return true if configure operation was successful.
  virtual bool configure(ParameterParser &parser, bool experimental_mode) = 0;

  /// Interface function to return a string representation of the current value of the
  /// bound variable.
  virtual String value() = 0;

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

  /// Returns the experiment off value for the flag.
  String experimentalOffValue() const;

protected:
  // Constructor
  //
  IConfigBind(String const &name, String const &description);

  // Configuration
  //

  /// Sets the name of the configuration variable.
  void setName(String const &name);

  /// Marks the variable as a flag.
  void markAsFlag();

  /// Sets the default value as a string.
  void setDefault(String const &v);

  /// Marks the config as experimental and provides an "off" value which is used
  /// whenever the config is inactive.
  void setAsExperimental(String const &v);

private:
  String name_;                   ///< Name that which sets the value.
  String description_;            ///< Description of the option or flag.
  bool   is_flag_{false};         ///< Whether or not the variable is a flag.
  String str_default_value_{""};  ///< Default value represented as a string.

  bool   is_experimental_{false};          ///< Whether or not this config is experimental
  String str_experimental_off_value_{""};  ///< Default value represented as a string.
};

}  // namespace quantum
}  // namespace microsoft

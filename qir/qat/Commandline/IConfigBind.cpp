// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/IConfigBind.hpp"

#include "qir/qat/Commandline/ConfigurationManager.hpp"

using namespace microsoft::quantum;

namespace microsoft::quantum
{

IConfigBind::IConfigBind(String const& name, String const& description, ParameterVisibility visibility)
  : name_{name}
  , description_{description}
  , visibility_{visibility}
{
}

IConfigBind::~IConfigBind() = default;

String IConfigBind::name() const
{
    return name_;
}

String IConfigBind::description() const
{
    return description_;
}

void IConfigBind::setName(String const& name)
{
    name_ = name;
}

bool IConfigBind::isFlag() const
{
    return is_flag_;
}

String IConfigBind::defaultValue() const
{
    return str_default_value_;
}

void IConfigBind::markAsFlag()
{
    is_flag_ = true;
}

void IConfigBind::setDefault(String const& v)
{
    str_default_value_ = v;
}

void IConfigBind::makeSettingExperimental()
{
    is_experimental_ = true;
}

bool IConfigBind::isExperimental() const
{
    return is_experimental_;
}

bool IConfigBind::isLoadAndSavable() const
{
    return (visibility_ & ParameterVisibility::ConfigOnly) != ParameterVisibility::None;
}

bool IConfigBind::isAvailableToCli() const
{
    return (visibility_ & ParameterVisibility::CliOnly) != ParameterVisibility::None;
}

void IConfigBind::setShorthandNotation(String const& name)
{
    shorthand_notation_ = name;
}

String IConfigBind::shorthandNotation() const
{
    return shorthand_notation_;
}

} // namespace microsoft::quantum

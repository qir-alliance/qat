// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/IConfigBind.hpp"

#include "qir/qat/Commandline/ConfigurationManager.hpp"

using namespace microsoft::quantum;

namespace microsoft::quantum
{

IConfigBind::IConfigBind(String const& name, String const& description)
  : name_{name}
  , description_{description}
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

} // namespace microsoft::quantum

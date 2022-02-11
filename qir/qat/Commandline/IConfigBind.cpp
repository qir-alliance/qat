// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Commandline/IConfigBind.hpp"

#include "Commandline/ConfigurationManager.hpp"

using namespace microsoft::quantum;

namespace microsoft {
namespace quantum {

IConfigBind::IConfigBind(String const &name, String const &description)
  : name_{name}
  , description_{description}
{}

IConfigBind::~IConfigBind() = default;

String IConfigBind::name() const
{
  return name_;
}

String IConfigBind::description() const
{
  return description_;
}

void IConfigBind::setName(String const &name)
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

void IConfigBind::setDefault(String const &v)
{
  str_default_value_ = v;
}

void IConfigBind::setAsExperimental(String const &v)
{
  is_experimental_            = true;
  str_experimental_off_value_ = v;
}

bool IConfigBind::isExperimental() const
{
  return is_experimental_;
}

String IConfigBind::experimentalOffValue() const
{
  return str_experimental_off_value_;
}

}  // namespace quantum
}  // namespace microsoft

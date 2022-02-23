// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Commandline/ConfigurationManager.hpp"

using namespace microsoft::quantum;

namespace microsoft {
namespace quantum {

void ConfigurationManager::setupArguments(ParameterParser &parser)
{
  for (auto &section : config_sections_)
  {
    if (section.enabled_by_default)
    {
      parser.addFlag("disable-" + section.id);
    }
    else
    {
      parser.addFlag("enable-" + section.id);
    }
  }

  for (auto &section : config_sections_)
  {
    for (auto &c : section.settings)
    {
      if (!c->setupArguments(parser))
      {
        throw std::runtime_error("Failed to set parser arguments up.");
      }
    }
  }
}

void ConfigurationManager::configure(ParameterParser &parser, bool experimental_mode)
{

  for (auto &section : config_sections_)
  {
    if (section.enabled_by_default)
    {
      *section.active = (parser.get("disable-" + section.id, "false") != "true");
    }
    else
    {
      *section.active = (parser.get("enable-" + section.id, "false") == "true");
    }
  }

  for (auto &section : config_sections_)
  {
    for (auto &c : section.settings)
    {
      if (!c->configure(parser, experimental_mode))
      {
        throw std::runtime_error("Failed configure the section.");
      }
    }
  }
}

void ConfigurationManager::printHelp() const
{
  std::cout << std::setfill(' ');

  // Enable or disable components
  std::cout << std::endl;
  std::cout << "Component configuration"
            << " - ";
  std::cout << "Used to disable or enable components" << std::endl;
  std::cout << std::endl;
  for (auto &section : config_sections_)
  {
    if (!section.id.empty())
    {
      if (section.enabled_by_default)
      {
        std::cout << std::setw(50) << std::left << ("--disable-" + section.id) << "Disables "
                  << section.name << ". ";
        std::cout << "Default: false" << std::endl;
      }
      else
      {
        std::cout << std::setw(50) << std::left << ("--enable-" + section.id) << "Enables "
                  << section.name << ". ";
        std::cout << "Default: false" << std::endl;
      }
    }
  }

  // Component configuration
  for (auto &section : config_sections_)
  {
    std::cout << std::endl;
    std::cout << section.name << " - ";
    std::cout << section.description << std::endl;
    std::cout << std::endl;

    for (auto &c : section.settings)
    {

      if (c->isFlag())
      {
        if (c->defaultValue() == "false")
        {
          std::cout << std::setw(50) << std::left << ("--" + c->name());
        }
        else
        {
          std::cout << std::setw(50) << std::left << ("--[no-]" + c->name());
        }
      }
      else
      {
        std::cout << std::setw(50) << std::left << ("--" + c->name());
      }

      if (c->isExperimental())
      {
        std::cout << "EXPERIMENTAL. ";
      }

      std::cout << c->description() << " ";

      std::cout << "Default: " << c->defaultValue() << std::endl;
    }
  }
}

void ConfigurationManager::printConfiguration() const
{
  std::cout << std::setfill('.');

  std::cout << "; # "
            << "Components"
            << "\n";
  for (auto &section : config_sections_)
  {
    if (!section.id.empty())
    {
      std::cout << "; " << std::setw(50) << std::left << ("disable-" + section.id) << ": "
                << (*section.active ? "false" : "true") << "\n";
    }
  }
  std::cout << "; \n";

  for (auto &section : config_sections_)
  {
    std::cout << "; # " << section.name << "\n";
    for (auto &c : section.settings)
    {
      std::cout << "; " << std::setw(50) << std::left << c->name() << ": " << c->value() << "\n";
    }
    std::cout << "; \n";
  }
}

void ConfigurationManager::setSectionName(String const &name, String const &description)
{
  if (config_sections_.empty())
  {
    throw std::runtime_error("No section created yet.");
  }
  config_sections_.back().name        = name;
  config_sections_.back().description = description;
}

void ConfigurationManager::disableSectionByDefault()
{
  if (config_sections_.empty())
  {
    throw std::runtime_error("No section created yet.");
  }

  config_sections_.back().enabled_by_default = false;
}

}  // namespace quantum
}  // namespace microsoft

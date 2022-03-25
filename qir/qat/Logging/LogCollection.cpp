// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Logging/LogCollection.hpp"

#include "Utils/Trim.hpp"

#include <vector>

namespace microsoft {
namespace quantum {

void LogCollection::debug(String const &message)
{
  messages_.push_back({Type::Debug, current_location_, message});
}

void LogCollection::info(String const &message)
{
  messages_.push_back({Type::Info, current_location_, message});
}

void LogCollection::warning(String const &message)
{
  messages_.push_back({Type::Warning, current_location_, message});
}

void LogCollection::error(String const &message)
{
  messages_.push_back({Type::Error, current_location_, message});
}

void LogCollection::internalError(String const &message)
{
  messages_.push_back({Type::InternalError, current_location_, message});
}

void LogCollection::setLocation(String const &name, int64_t line, int64_t col)
{
  current_location_.name   = name;
  current_location_.line   = line;
  current_location_.column = col;
}

LogCollection::Messages const &LogCollection::messages() const
{
  return messages_;
}

void LogCollection::setLlvmHint(String const &value)
{
  current_location_.llvm_hint = value;
  trim(current_location_.llvm_hint);
}

void LogCollection::setFrontendHint(String const &value)
{
  current_location_.frontend_hint = value;
  trim(current_location_.frontend_hint);
}

}  // namespace quantum
}  // namespace microsoft

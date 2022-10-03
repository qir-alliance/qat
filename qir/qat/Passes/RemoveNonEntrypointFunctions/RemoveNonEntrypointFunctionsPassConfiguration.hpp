#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Commandline/ConfigurationManager.hpp"

#include <limits>

namespace microsoft::quantum
{

class RemoveNonEntrypointFunctionsPassConfiguration
{
  public:
    using DeferredValuePtr = DeferredValue::DeferredValuePtr;

    void setup(ConfigurationManager& config)
    {
        config.setSectionName("Remove Non-Entrypoint Functions", "");
        entry_point_attr_ = config.getParameter("entry-point-attr");
    }

    static RemoveNonEntrypointFunctionsPassConfiguration createDisabled()
    {
        RemoveNonEntrypointFunctionsPassConfiguration ret;
        return ret;
    }

    std::string entryPointAttr() const
    {
        return entry_point_attr_->value<std::string>();
    }

  private:
    DeferredValuePtr entry_point_attr_{nullptr};
};

} // namespace microsoft::quantum

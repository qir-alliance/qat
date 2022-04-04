// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Logging/ILogger.hpp"

#include <cstdint>
#include <fstream>
#include <iostream>
#include <string>

namespace microsoft
{
namespace quantum
{
    ILogger::~ILogger()
    {
        // Ensuring that the captured function is deleted to release
        // shared memory.
        location_resolver_ = nullptr;
    }

    void ILogger::setLocationFromValue(llvm::Value const* value)
    {
        if (location_resolver_)
        {
            auto loc = location_resolver_(value);
            setLocation(loc);
        }
    }

    void ILogger::setLocationResolver(LocationResolver const& r)
    {
        location_resolver_ = r;
    }

    ILogger::Messages const& ILogger::messages() const
    {
        throw std::runtime_error("messages() is not supported by logger.");
    }

    void ILogger::dump(std::ostream& out) const
    {
        throw std::runtime_error("dump() is not supported by logger.");
    }

} // namespace quantum
} // namespace microsoft

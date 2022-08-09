// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Version/Version.hpp"

#include <cstdint>
#include <iostream>
#include <string>

namespace microsoft::quantum
{

void displayCliHeader(bool extended_info)
{
    std::cout << "QAT v. " << version::FULL << std::endl;
    std::cout << "Copyright (c) Microsoft Corporation." << std::endl;
    std::cout << "Licensed under the MIT License." << std::endl;
    if (extended_info)
    {
        std::cout << "FULL             " << version::FULL << std::endl;
        std::cout << "MAJOR            " << version::MAJOR << std::endl;
        std::cout << "MINOR            " << version::MINOR << std::endl;
        std::cout << "REVISION         " << version::REVISION << std::endl;
        std::cout << "CHANNEL          " << version::CHANNEL << std::endl;
        std::cout << "PATCH            " << version::PATCH << std::endl;
        std::cout << "COMMIT_HASH      " << version::COMMIT_HASH << std::endl;
        std::cout << "WORK_IN_PROGRESS " << version::WORK_IN_PROGRESS << std::endl;
    }
}

} // namespace microsoft::quantum

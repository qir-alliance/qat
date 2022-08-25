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

        std::cout << "COMPILED WITH    ";
#ifdef __clang__
        std::cout << "Clang " << __clang_major__ << "." << __clang_minor__ << "." << __clang_patchlevel__;
#elif __GNUC__
        std::cout << "GCC " << __GNUC__ << "." << __GNUC_MINOR__ << "." << __GNUC_PATCHLEVEL__;
#else
        std::cout << "unknown compiler";
#endif
        std::cout << std::endl;
    }
}

} // namespace microsoft::quantum

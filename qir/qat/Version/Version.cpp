// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/Version/Version.hpp"

#include <cstdint>
#include <string>
#include <iostream>

namespace microsoft::quantum {

void displayCliHeader()
{
  std::cout << "QAT v. " << version::FULL << std::endl;
  std::cout << "Copyright 2021-2022 (c) Microsoft Corporation." << std::endl;
  std::cout << "Licensed under the MIT License." << std::endl;
}

}  // namespace microsoft::quantum
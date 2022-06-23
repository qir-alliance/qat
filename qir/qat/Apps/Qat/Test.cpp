// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include <exception>
#include <iostream>
int main()
{
    std::cout << "Hello world" << std::endl;

#ifndef NDEBUG
    std::cerr << "Debugging!" << std::endl;
#endif
    throw std::runtime_error("Hello world");
    return 0;
}
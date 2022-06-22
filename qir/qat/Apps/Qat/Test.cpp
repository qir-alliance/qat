#include<iostream>

int main() 
{
    std::cout << "Hello world" << std::endl;

#ifndef NDEBUG
    std::cerr << "Debugging!" << std::endl;
#endif

    return 0;
}
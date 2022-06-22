#include<iostream>
#include<exception>
int main() 
{
    std::cout << "Hello world" << std::endl;

#ifndef NDEBUG
    std::cerr << "Debugging!" << std::endl;
#endif
    throw std::runtime_error("Hello world");
    return 0;
}
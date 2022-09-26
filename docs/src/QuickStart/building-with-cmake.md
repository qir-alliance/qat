## Building with CMake

TODO: Streamline these scetions with the CI scripts.

### Prerequisites

It is necessary for you to have the following tools before you get started on
making a new build from this project:

-   C++ compiler
-   CMake
-   LLVM 13

If you are compiling and using the command-line tool, these are necessary tools
regardless of whether you plan to develop the library itself. The build
configuration is handled by CMake, which informs you if a compiler needs to be
installed.

### On Windows

Currently CMake builds are not supported on Windows using PowerShell. It is possible to build QAT on Windows Linux Subsystem. Please refer to the Linux build instructions.

### On macOS

Those using macOS can install CMake and LLVM 13 through the use of a command-line tool
called `brew`, as follows:

```sh
brew install cmake llvm@13
```

It should not be necessary to install anything else on top of macOS, since
the compiler comes preinstalled.

### On Ubuntu 20.04

Additionally to CMake, you will also require Clang in order to build on Ubuntu
20.04. You can accomplish this by following the steps below:

```sh
wget -O - https://apt.llvm.org/llvm.sh | bash -s 13
apt install cmake
```

TODO: Finish this section.

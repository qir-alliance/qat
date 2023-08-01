# Building with CMake

## Prerequisites

It is necessary for you to have the following tools before you get started on
making a new build from this project:

- C++ compiler (Clang 14 or MSVC)
- CMake
- LLVM 14

If you are compiling and using the command-line tool, these are necessary tools
regardless of whether you plan to develop the library itself. The build
configuration is handled by CMake, which informs you if a compiler needs to be
installed.

On all systems, you will additionally need to check the submodules out. From the
root of the repository, run

```sh
git submodule update --init --recursive
```

### Prerequisites on Windows

Currently CMake builds are not supported on Windows using PowerShell. Building
with CMake on Windows Subsystem for Linux follows the steps outlined for Ubuntu.
It is possible to build QAT on Windows Linux Subsystem. Please refer to the
Linux build instructions.

### Prerequisites on macOS

Those using macOS can install CMake and LLVM 14 through the use of a
command-line tool called `brew`, as follows:

```sh
brew install cmake llvm@14
```

It should not be necessary to install anything else on top of macOS, since the
compiler comes preinstalled.

### Prerequisites on Ubuntu 20.04

Additionally to CMake, you will also require Clang in order to build on Ubuntu
20.04. You can accomplish this by following the steps below:

```sh
wget -O - https://apt.llvm.org/llvm.sh | bash -s 14
apt install cmake
```

### Prerequisites on Ubuntu 22.04

On Ubuntu 22.04, you may need to remove `llvm-13`/`llvm-12`.
If you prefer minimal change to your machines configuration, we recommend
[building with Bazel](./building-with-bazel.md).

To prepare your system with the relevant build tools, install `clang`, `cmake`
and `llvm`

```sh
apt install -y clang-14 cmake llvm-14
```

## Building QAT using CMake

Once LLVM is installed and you have checkout the submodules, create a build
folder. We suggest you use either `Debug` or `Release` to indicate what kind of
build you wish to perform:

```sh
mkdir [Debug/Release]
cd [Debug/Release]
```

Next, initiate the build directory by running

```sh
cmake ..
```

and finally, build using `make`

```sh
make qat
```

Once `qat` is compiled, you find it in the folder `qir/qat/Apps/`.

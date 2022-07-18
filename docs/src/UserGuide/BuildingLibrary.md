# Build guide

This document will guide you through all the requirements and steps that you
need to follow to build the QIR adaptor tool (QAT). The first section of this
guide helps you install the tools needed to build QAT. After you have finished
with the second section of the guide, you should have the `qat` executable
compiled and ready to run. As a part of the third part of this post, we will
show you how to build and serve all of the documentation including the user
guides, developer guides and API documentation. We will go through the steps of
compiling the whole library as well as how to run all the tests suite that has
been provided as the fourth part of this document. This part is only relevant if
you intend to extend or modify the core codebase. There is no need for it when
simply building an extension to QAT without having the need to change anything
else in the core library. There is a lot more information about how to create a
custom extension within the developers’ section.

## Prerequisites

It is necessary for you to have the following tools before you get started on
making a new build from this project:

- C++ compiler
- CMake

If you are compiling and using the command-line tool, these are necessary tools
regardless of whether you plan to develop the library itself. The build
configuration is handled by CMake, which informs you if a compiler needs to be
installed.

### On macOS

Those using macOS can install CMake through the use of a command-line tool
called `brew`, as follows:

```sh
brew install cmake
```

It should not even be necessary to install anything else on top of macOS, since
the compiler comes preinstalled. There is no need to read the next subsection
([Developer prerequisites](#developer-prerequisites)) if you are not intending
to modify the core library and can safely jump to the section
[Library Dependencies](#library-dependencies)

### On Ubuntu 20.04

Additionally to CMake, you will also require Clang in order to build on Ubuntu
20.04. You can accomplish this by following the steps below:

```sh
wget -O - https://apt.llvm.org/llvm.sh | bash -s 13
apt install cmake
```

You can skip straight to [Library Dependencies](#library-dependencies) if you do
not intend to work on developing the core library.

## Developer prerequisites

Development of the core library requires additional tools. These are used
formatting, linting and managing code quality. For this purpose, the following
tools and packages are used:

- Python 3.6
- Python packages specified in `requirements.txt`
- clang-format
- clang-tidy

The installation process varies depending on the platform you use. The following
subsections provide details on how to install these tools on each platform.

### On macOS

TODO(issue-45): Create developer prerequisites for macOS in docs.

### On Ubuntu 20.04

Installing the Clang tools on Ubuntu along with Python can be accomplished by
running these commands:

```sh
apt install clang-format-13 clang-tidy-13
apt install python3 python3-pip
```

We recommend that you use version 13 of Clang in order to be consistent with the
version of LLVM on which the library depends. In general, the code should work
with any version of clang. Make sure that the compiler environment variables are
defined correctly in order to select the correct version:

```sh
export CC=clang-13
export CXX=clang++-13
```

### Common to all platforms

Last but not least, we install the Python libraries that are required:

```sh
      pip install -r requirements.txt
      chmod +x manage
```

As a result, the `manage` tool will be available for you to help you make sure
your code is high quality. Getting a contribution merged into the code base
requires the manage tools CI flow to be successful. Thus, if you plan to
contribute you will most likely need to complete this step.

## Library Dependencies

The QAT library itself is written in C++ and depends on LLVM for compilation and
Google Test for testing purposes.
[Google Test](https://github.com/google/googletest) is checked out as a
submodule whereas LLVM needs to be installed on the system. To get check out all
submodules run

```sh
git submodule update --init --recursive
```

### Installing LLVM on macOS

TODO(issue-45): Document installation process

### Installing LLVM on Ubuntu 20.04

For the installation of LLVM from Ubuntu we use the package manager `apt`. For
full run installation, run the following command:

```sh
apt install llvm-13 lldb-13 llvm-13-dev libllvm13 llvm-13-runtime
```

By doing this, we will ensure that CMake can find LLVM and that all headers and
libraries used by the QAT library are available.

## Build instructions for users

From the root folder in the repository, create a build folder `Debug` and use
CMake to build the executable:

```sh
mkdir Debug
cd Debug
cmake ..
make qat
```

then

```sh
./qir/qat/Apps/qat
```

## Building the documentation

To build the documentation Docker image, run:

```sh
make documentation
```

To serve the documentation locally, run:

```sh
make serve-docs
```

## Building for developers

To build the tool, create a new build directory and switch to that directory:

```sh
mkdir Debug
cd Debug/
```

To build the library, first configure CMake from the build directory

```sh
cmake ..
```

and then make your target

```sh
make [target]
```

The default target is `all`. Other valid targets are the name of the folders in
`libs/` found in the passes root.

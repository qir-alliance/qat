# Quick start

(TODO: Revise )This document will guide you through all the requirements and steps that you
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

## Supported systems

In the table below, we summarize the systems currently supported.

| Operating system | Architecture | Version | Bazel | CMake | Notes                                                      |
| ---------------- | ------------ | ------- | ----- | ----- | ---------------------------------------------------------- |
| Windows          | x86_64, Arm  | 2018    | Yes   | No    | Docker images through Bazel are not supported              |
|                  | x86_64, Arm  | 2020    | Yes   | No    |                                                            |
| Ubuntu           | x86_64, Arm  | 22.04   | Yes   | Yes   |                                                            |
|                  | x86_64, Arm  | 24.04   | Yes   | Yes   |                                                            |
| macOS            | x86_64, Arm  |         | Yes   | Yes   | Some tests fail on Arm due to issues in LLVM configuration |

At the moment, we support `clang` and `msvc` to compile QAT. While `gcc` might work, it is untested and not support at the moment.

Additionally, the QAT supports experimental cross-compilation for Linux and macOS. This is useful in order to create Docker images with `x86` architecture on an `arm` platform.

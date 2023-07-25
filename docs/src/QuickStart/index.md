# Quick start

This document will guide you through all the requirements and steps that you
need to follow to build the QIR adaptor tool (QAT). QAT can be built either
using Bazel or CMake. In the following two sections, we discuss how to build QAT
using either of these tools. Building on Windows is currently only supported
[using Bazel](./building-with-bazel.md). The
[detailed description of building with Bazel](./building-with-bazel.md) outlines
how to install `bazelisk` and discusses configuration flags. If you already have
`bazelisk` installed, simply run

```sh
bazelisk build //qir/qat:qat --config [compiler] --config release
```

to build `qat` where compiler should be substituted with `clang` on Linux and
macOS, and `msvc` on Windows. If you prefer CMake, please
[see the detailed instructions here](./building-with-cmake.md).

## Supported systems

In the table below, we summarize the systems currently supported.

| Operating system | Architecture | Version | Bazel | CMake | Notes                                                                                                                 |
| ---------------- | ------------ | ------- | ----- | ----- | --------------------------------------------------------------------------------------------------------------------- |
| Windows          | x86_64, Arm  | 2019    | Yes   | No    | Docker images through Bazel are not supported                                                                         |
| Ubuntu           | x86_64, Arm  | 22.04   | Yes   | Yes   |                                                                                                                       |
|                  | x86_64, Arm  | 24.04   | Yes   | Yes   |                                                                                                                       |
| macOS            | x86_64, Arm  |         | Yes   | Yes   | Some [tests fail](https://github.com/qir-alliance/qat/issues/144) on Arm due to issues in Bazel configuration of LLVM |

At the moment, we support `clang` and `msvc` to compile QAT. While `gcc` might
work, it is untested and not supported at the moment.

Additionally, the QAT supports experimental cross-compilation for Linux and
macOS. This is useful in order to create Docker images with `x86` architecture
on `arm` platforms.

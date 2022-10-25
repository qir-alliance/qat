# QIR Adaptor Tool

[![Linux CI](https://github.com/qir-alliance/qat/actions/workflows/ci-linux-on-main-pr.yml/badge.svg?branch=main)](https://github.com/qir-alliance/qat/actions/workflows/ci-linux-on-main-pr.yml)
[![Mac CI](https://github.com/qir-alliance/qat/actions/workflows/ci-mac-on-main-pr.yml/badge.svg?branch=main)](https://github.com/qir-alliance/qat/actions/workflows/ci-mac-on-main-pr.yml)
[![Documentation](https://github.com/qir-alliance/qat/actions/workflows/trusted-cd-docs.yml/badge.svg?branch=main)](https://qir-alliance.github.io/qat/)

[![License](https://badgen.net/github/license/qir-alliance/qat)](https://opensource.org/licenses/MIT)
[![Release](https://badgen.net/github/release/qir-alliance/qat)](https://github.com/qir-alliance/qat/releases/latest)

[![Contributors](https://img.shields.io/github/contributors/qir-alliance/qat.svg)](https://github.com/qir-alliance/qat/graphs/contributors)
[![Pulls](https://img.shields.io/github/issues-pr/qir-alliance/qat.svg)](https://github.com/qir-alliance/qat/pulls)
[![QAT](https://img.shields.io/github/issues-pr-closed/qir-alliance/qat.svg)](https://github.com/qir-alliance/qat/pulls?q=is%3Apr+is%3Aclosed)

## Table of Contents

- [Purpose](#purpose-and-terminology)
- [Building](#building)
- [Getting started](#getting-started)
- [Documentation](#documentation)

## Purpose and terminology

The purpose of the tool contained in this repository is to provide means to
manipulate the intermediate representation (IR) of quantum programs. We refer to
these IRs as quantum IRs (QIRs). The main tool provided here is QIR adaptor tool
(QAT) which allows one to transform one QIR to another QIR that fulfils certain
requirements.

When we refer to a QIR in any of the documentation related to this tool, we do
so irrespective of whether we represent the QIR though human readable text, the
more storage-efficient bit-code format or in-memory representation. We note that
all of these representations are semantically identical and for that reason, QAT
is designed to work with all of them.

## Building

QAT can be built either using Bazel or CMake. In the following two sections, we
discuss how to build QAT using either of these tools. Building on Windows is
currently only supported
[using Bazel](./docs/src/QuickStart/building-with-bazel.md). The
[detailed decription of building with Bazel](./docs/src/QuickStart/building-with-bazel.md)
outlines how to install `bazelisk` and discusses configuration flags. If you
already have `bazelisk` installed, simply run

```sh
bazelisk build //qir/qat:qat --config [compiler] --config release
```

to build `qat` where compiler should be substituted with `clang` on Linux and
macOS, and `msvc` on Windows. If you prefer CMake, please
[see the detailed instructions here](./docs/src/QuickStart/building-with-cmake.md).

## Getting started

Once the project is built (see next sections), you can transform a QIR according
to a profile as follows:

```sh
qat --apply --target-def target.yaml -S path/to/example.ll
```

Likewise, you can validate that a QIR follows a specification by running (Note,
not implemented yet):

```sh
qat --validate --target-def target.yaml -S path/to/example.ll
```

## Documentation

You can access the [documentation here](https://qir-alliance.github.io/qat/).

## Feedback

If you have feedback about the content in this repository, please let us know by
filing a [new issue](https://github.com/qir-alliance/qat/issues/new)!

## Contributing

There are many ways in which you can contribute to QAT, whether by contributing
a feature or by engaging in discussions; we value contributions in all shapes
and sizes! We refer to [this document](CONTRIBUTING.md) for guidelines and ideas
for how you can get involved.

Contributing a pull request to this repo requires to agree to a
[Contributor License Agreement (CLA)](https://en.wikipedia.org/wiki/Contributor_License_Agreement)
declaring that you have the right to, and actually do, grant us the rights to
use your contribution. We are still working on setting up a suitable CLA-bot to
automate this process. A CLA-bot will automatically determine whether you need
to provide a CLA and decorate the PR appropriately. Once it is set up, simply
follow the instructions provided by the bot. You will only need to do this once.

## Code of Conduct

This project has adopted the community covenant
[Code of Conduct](https://github.com/qir-alliance/.github/blob/main/Code_of_Conduct.md#contributor-covenant-code-of-conduct).
Please contact [qiralliance@mail.com](mailto:qiralliance@mail.com) for Code of
Conduct issues or inquires.

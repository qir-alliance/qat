# QIR Adaptor Tool

[![Linux CI](https://github.com/qir-alliance/qat/actions/workflows/ci-linux-on-main-pr.yml/badge.svg?branch=main)](https://github.com/qir-alliance/qat/actions/workflows/ci-linux-on-main-pr.yml)
[![Mac CI](https://github.com/qir-alliance/qat/actions/workflows/ci-mac-on-main-pr.yml/badge.svg?branch=main)](https://github.com/qir-alliance/qat/actions/workflows/ci-mac-on-main-pr.yml)
[![Documentation](https://github.com/qir-alliance/qat/actions/workflows/cd-docs.yml/badge.svg?branch=main)](https://qir-alliance.github.io/qat/)

[![License](https://badgen.net/github/license/qir-alliance/qat)](https://opensource.org/licenses/MIT)
[![Release](https://badgen.net/github/release/qir-alliance/qat)](https://github.com/qir-alliance/qat/releases/latest)

[![Contributors](https://img.shields.io/github/contributors/qir-alliance/qat.svg)](https://github.com/qir-alliance/qat/graphs/contributors)
[![Pulls](https://img.shields.io/github/issues-pr/qir-alliance/qat.svg)](https://github.com/qir-alliance/qat/pulls)
[![QAT](https://img.shields.io/github/issues-pr-closed/qir-alliance/qat.svg)](https://github.com/qir-alliance/qat/pulls?q=is%3Apr+is%3Aclosed)

## Table of Contents

- [Purpose](#purpose)
- [Building](#building)
- [Getting started](#getting-started)
- [Next steps](#next-steps)

## Purpose and terminology

The purpose of the tool contained in this repository is to provide means to
manipulate the intermediate representation (IR) of quantum programs. We refer to
these IRs as quantum IRs (QIRs). The main tool provided here is QIR adaptor tool
(QAT) which allows one to transform one QIR to another QIR that fulfils certain
requirements.

When we refer to a QIR in any of the documentation related to this tool, we do
so irrespective of whether we represent the QIR though human readable text, the
more storage-efficient bitcode format or in-memory representation. We note that
all of these representations are semantically identical and for that reason, QAT
is designed to work with all of them.

## Building

To build the tool, create a new build directory and switch to that directory:

```sh
mkdir Debug
cd Debug/
```

To build the library, first configure CMake from the build directory

```sh
cmake ..
```

and then make your target:

```sh
make qat
```

For full instructions on dependencies and how to build, follow
[these instructions](./docs/src/UserGuide/BuildingLibrary.md).

## Getting started

Once the project is built (see next sections), you can transform a QIR according
to a profile as follows:

```sh
./qir/qat/Apps/qat --generate --profile base -S path/to/example.ll
```

Likewise, you can validate that a QIR follows a specification by running (Note,
not implemented yet):

```sh
./qir/qat/Apps/qat --validate --profile base -S path/to/example.ll
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

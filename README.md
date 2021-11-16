# QIR Adaptor Tool

![Linux CI](https://github.com/qir-alliance/qat/actions/workflows/ci-linux-on-main-pr.yml/badge.svg)
![Mac CI](https://github.com/qir-alliance/qat/actions/workflows/ci-mac-on-main-pr.yml/badge.svg)
![Documentation](https://github.com/qir-alliance/qat/actions/workflows/cd-docs.yml/badge.svg)

[![](https://img.shields.io/github/contributors/qir-alliance/qat.svg)](https://github.com/qir-alliance/qat/graphs/contributors)
[![](https://img.shields.io/github/issues-pr/qir-alliance/qat.svg)](https://github.com/qir-alliance/qat/pulls)
[![](https://img.shields.io/github/issues-pr-closed/qir-alliance/qat.svg)](https://github.com/qir-alliance/qat/pulls?q=is%3Apr+is%3Aclosed)

[![](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Table of Contents

- [Building](#building)
- [Getting started](#getting-started)
- [Next steps](#next-steps)

This document contains a brief introduction on how to use the QIR passes. A more comprehensive [walk-through is found here](./docs/src/index.md).

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

and then make your target

```sh
make qat
```

For full instructions on dependencies and how to build, follow [these instructions](./docs/src/UserGuide/BuildingLibrary.md).

## Getting started

Once the project is built (see next sections), you can transform a QIR according to a profile as follows:

```sh
./Source/Apps/qat --generate --profile base -S path/to/example.ll
```

Likewise, you can validate that a QIR follows a specification by running (Note, not implemented yet):

```sh
./Source/Apps/qat --validate --profile base -S path/to/example.ll
```

## Next steps

You can access the [documentation here](https://qir-alliance.github.io/qat/).

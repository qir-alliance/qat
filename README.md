# QIR Adaptor Tool

[![Linux CI](https://github.com/qir-alliance/qat/actions/workflows/ci-linux-on-main-pr.yml/badge.svg?branch=main)](https://github.com/qir-alliance/qat/actions/workflows/ci-linux-on-main-pr.yml)
[![Mac CI](https://github.com/qir-alliance/qat/actions/workflows/ci-mac-on-main-pr.yml/badge.svg?branch=main)](https://github.com/qir-alliance/qat/actions/workflows/ci-mac-on-main-pr.yml)
[![Documentation](https://github.com/qir-alliance/qat/actions/workflows/cd-docs.yml/badge.svg?branch=main)](https://qir-alliance.github.io/qat/)

[![](https://badgen.net/github/license/qir-alliance/qat)](https://opensource.org/licenses/MIT)
[![](https://badgen.net/github/release/qir-alliance/qat)](https://github.com/qir-alliance/qat/releases/tag/v0.0.2)

[![](https://img.shields.io/github/contributors/qir-alliance/qat.svg)](https://github.com/qir-alliance/qat/graphs/contributors)
[![](https://img.shields.io/github/issues-pr/qir-alliance/qat.svg)](https://github.com/qir-alliance/qat/pulls)
[![](https://img.shields.io/github/issues-pr-closed/qir-alliance/qat.svg)](https://github.com/qir-alliance/qat/pulls?q=is%3Apr+is%3Aclosed)

## Table of Contents

- [Building](#building)
- [Getting started](#getting-started)
- [Next steps](#next-steps)

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

For full instructions on dependencies and how to build, follow [these instructions](./docs/src/UserGuide/BuildingLibrary.md).

## Getting started

Once the project is built (see next sections), you can transform a QIR according to a profile as follows:

```sh
./qir/qat/Apps/qat --generate --profile base -S path/to/example.ll
```

Likewise, you can validate that a QIR follows a specification by running (Note, not implemented yet):

```sh
./qir/qat/Apps/qat --validate --profile base -S path/to/example.ll
```

## Next steps

You can access the [documentation here](https://qir-alliance.github.io/qat/).

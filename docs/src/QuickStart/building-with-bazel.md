# Building with Bazel

## Prerequisites

Building with Bazel is mostly self-contained meaning that Bazel will download
most of the dependencies and arrange them in you workspace such that you do not
need to checkout submodules or install extra packages. However, following
external dependencies needs installing in order to use Bazel for building:

- C++ compiler (Clang 14 or MSVC 14.20)
- Bazelisk (or Bazel 5.0)

We recommend the usage of Bazelisk as it is a wrapper that automatically
downloads the correct version of Bazel for your project. The details of
installing Bazelisk can be
[found here](https://www.npmjs.com/package/@bazel/bazelisk). You can also use
Bazel without the wrapper. To do this, you need to install Bazel with the exact
version specified in the `.bazelversion` file and in the subsequent sections
replace `bazelisk` with `bazel`.

To install on macOS use `brew`:

```sh
brew install bazelisk
```

To install on Windows use `choco`:

```sh
choco install bazelisk
```

On any other platform, we suggest you use `npm`. Note that `npm` also works with
macOS and Windows

```sh
npm install -g @bazel/bazelisk
```

Once installed, verify that Bazelisk is correctly installed by running

```sh
bazelisk --help
```

If you experience any trouble with this step, please refer to the
[official documentation](https://www.npmjs.com/package/@bazel/bazelisk).

## Building QAT using Bazel

Before building, decide whether you are building with `clang` or `msvc` as well
as whether you wish to make a `release` build or a `debug` build. On all
operating systems, Bazelisk follows the pattern

```sh
bazelisk build [target] --config [clang/msvc] --config [debug/release]
```

On macOS and Ubuntu, you can build QAT as

```sh
bazelisk build //qir/qat:qat --config clang --config release
```

On Windows, you would use the `msvc` compiler

```sh
bazelisk build //qir/qat:qat --config msvc --config release
```

You will note that you do not need to checkout submodules and/or install LLVM
locally on your machine. Bazel will download all dependencies and compile them
from scratch. The benefit of this is that builds are much more reproducible and
less dependent on you local system settings. The downside is that build times
can be longer since everything is compiled from scratch.

You will note that you can run QAT directly using Bazel by

```sh
bazelisk run //qir/qat:qat --config msvc --config release -- [qat arguments]
```

In the subsequent sections feel free to substitute the QAT binary with this
command.

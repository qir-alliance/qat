# Code quality and continuous integration

## Using the manage tool

Before making a pull request with changes to this library, please ensure that
style checks passes, that the code compiles, unit test passes and that there are
no errors found by the static analyser.

For code formatting and linting, we use [Trunk](https://trunk.io) to manage this
process. To install trunk run

```sh
curl https://get.trunk.io -fsSL | bash
```

In order for `clang-tidy` to work, you need to generate a
`compile_commands.json`. To do this, run the first part of the CMake build
process:

```sh
mkdir Debug
cd Debug
cmake ..
```

and then copy `compile_commands.json` into the root directory:

```sh
cp compile_commands.json ../
```

To check the style, run

```sh
trunk check
```

To automatically format the code use

```sh
trunk fmt
```

## Running tests

In order to run the tests, you first need to build the library. Assuming that
this is already done and the corresponding build is in `Debug/`:

```sh
cmake ..
make
```

and then running following command:

```sh
ctest
```

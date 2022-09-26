# Running QAT

TODO: Yet to be written.

## Basic usage

The easiest way to use QAT is by running it with a target definition:

```sh
qat --target-def path/to/target-def.yaml -S -o output.ll input.ll
```

The file `target-def.yaml` sets the behaviour of QAT, whereas `-S` tells QAT to emit human readible LLVM code (as opposed to the binary format). The output file is specified by `-o` and finally, a list of one or more input files is given for QAT to process. Providing more than a single input file, QAT will link these into a single intermediate representation.

To get a full list of the commandline arguments and flags, run `qat -h` or `qat --help`.

## Configuration

QAT transforms a generic QIR into a target QIR. The target QIR is defined through the target definition provided as a YAML configuration file. Note that it is possible to configure QAT entirely through the commandline, we recommend the use of YAML configurations as the overall number configurable settings is pretty large.

On a high level, the configuration is divided into three sections: `qat`, `adaptor` and `target`. The first section `qat` is highlevel configuration of QAT and defines things such as whether the target requires adaption, validation and what the adaptor pipeline looks like. The second section `adaptor` defines the configuration for each of the adaptor components. The third section `target` defines requirements for the target which QAT will use to validate that the final result really is compliant with the desired target.

## QAT configuration

Before explaining how adaptors and target validation is used, we will briefly examine a few useful settings in the `qat` section. First and foremost, `dump-config` is a useful setting that allows the user to dump the current configuration. To provide compatibility with the human readible IR, the config is dumped as comments. This feature is in particular useful as a commandline flag

```sh
qat --target-def path/to/target-def.yaml -S --dump-config input.ll > output.ll
```

Note that rather than using the `-o` option, we pipe the output into the output file. This is capture the configuration together with the resulting output of QAT. This ensures that the two are kept together for reproducibility.

Another couple of useful features are `strip-exisiting-dbg` and `add-ir-debug`. These two can be set from the command line using `--strip-exisiting-dbg` and `--add-ir-debug`, respectively. The first, `strip-exisiting-dbg`, removes all existing debug information from the loaded modules. The other `add-ir-debug` adds debug symbols referring to the LL file itself. This is discussed in [detail here](../UsingQAT/DebuggingIR.md)

## Adaptor examples

In this section we will demonstrate some of the adaptor examples that helps the user manipulate the IR to conform to target specification.

In many of the sections below, we will refer to demos. From the repository root, these can be found in the folder `qir/demos`. A prerequisite to running the demos is to have an environment variable `QAT_BINARY` containing the path to the QAT binary. In each demo directory there is a `Makefile` with suggested commands to run.

### Inlining

One of the first important examples of QAT is replication of some of the LLVM functionality.

### Loop unrolling

TODO:

### Static resource allocation

TODO:

### Replacement linking

In this example we consider two quantum computers. The first computer implements `z`and `cnot`. The second computer implements `x`, `h` and `cnot`.

```text
OPENQASM 3;

qubit a;
qubit b;

z a;
cnot a b;
```

After compiling to QIR we get (`main.ll`),

```llvm
define void @example() #0 {
entry:
	%a = call %Qubit* @__quantum__rt__qubit_allocate()
	%b = call %Qubit* @__quantum__rt__qubit_allocate()
	call void @__quantum__qis__z__body(%Qubit* %a)
	call void @__quantum__qis__cnot__body(%Qubit* %a, %Qubit* %b)
	call void @__quantum__rt__qubit_release(%Qubit* %b)
	call void @__quantum__rt__qubit_release(%Qubit* %a)
	ret void
}
```

Obviously, this code will not run on the second computer since that machine does it makes use of a `z` gate. While we could rewrite the frontend code, the beauti of an intermediate represenation is that such tasks can be performed at this level and hence, the user does not need to worry about hardware compatibility of the frontend code.

QAT allows to address this issue by using a concept known as replacement linking. Replacement linking is linking process by which one function call is replaced by another if the and only if the other function is present in the IR. To facilitate this, we annotate the function `__quantum__qis__z__body` as follows:

```llvm
declare void @__quantum__qis__z__body(%Qubit*) #1

attributes #1 = { "replaceWith"="soft_z" }
```

This states taht if the function `soft_z` is available, replace all calls to `__quantum__qis__z__body` with `soft_z`. Passing the `main.ll` through QAT does not result in any changes. However, adding a `lib.ll` with following code:

```llvm
define void @soft_z(%Qubit* %q) {
entry:
  call void @__quantum__qis__h__body(%Qubit* %q)
  call void @__quantum__qis__x__body(%Qubit* %q)
  call void @__quantum__qis__h__body(%Qubit* %q)
  ret void
}
```

will replace the calls `__quantum__qis__z__body` in `main.ll`. This is done by invoking QAT as follows:

```sh
qat --apply -S --target-def target.yaml --validate main.ll lib.ll
```

From the repository root, the code for this example can be found in `qat/demos/ReplaceLinking`. In this concrete demo, calling

```sh
qat --apply -S --target-def target.yaml --no-always-inline --validate main.ll lib.ll
```

produces

```llvm
; ModuleID = 'qat-link'
source_filename = "qat-link"

%Qubit = type opaque

define void @example() #0 {
entry:
  call void @soft_z(%Qubit* null)
  call void @__quantum__qis__cnot__body(%Qubit* null, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  ret void
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)

declare void @__quantum__rt__qubit_release(%Qubit*)

define void @soft_z(%Qubit* %q) #1 {
entry:
  call void @__quantum__qis__h__body(%Qubit* %q)
  call void @__quantum__qis__x__body(%Qubit* %q)
  call void @__quantum__qis__h__body(%Qubit* %q)
  ret void
}

declare void @__quantum__qis__h__body(%Qubit*)

declare void @__quantum__qis__x__body(%Qubit*)

attributes #0 = { "EntryPoint" "maxQubitIndex"="1" "maxResultIndex"="0" "requiredQubits"="2" "requiredResults"="0" }
attributes #1 = { "maxQubitIndex"="0" "maxResultIndex"="0" "requiredQubits"="0" "requiredResults"="0" }
```

as would be expected. We note that we have disabled inlining as to maintain the function `soft_z`.

Each backend can now provide a library that makes software implementations of the gates that are not supported natively by the system.

### Circuit separation

TODO:

## Target validation

TODO:

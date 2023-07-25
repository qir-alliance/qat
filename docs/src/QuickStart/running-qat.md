# Running QAT

In the [section on targeting QIR](../UsingQAT/TargetingQIR.md) we will discuss
the individual validators and adaptors. However, for the sake of getting started
quickly, in this section, we will take the reader through the basic usage of
QAT, its configuration and how to use selected adaptors using examples.

## Basic usage

The easiest way to use QAT is by running it with a target configuration:

```sh
qat --target-def path/to/target-def.yaml -S -o output.ll input.ll
```

The file `target-def.yaml` sets the behaviour of QAT, whereas `-S` tells QAT to
emit human readable LLVM code (as opposed to the binary format). The output file
is specified by `-o` and finally, a list of one or more input files is given for
QAT to process. Providing more than a single input file, QAT will link these
into a single intermediate representation.

To get a full list of the commandline arguments and flags, run `qat -h` or
`qat --help`.

## Target configuration

The target QIR is defined through the target configuration provided as a YAML
configuration file. Note that it is possible to configure QAT entirely through
the commandline, we recommend the use of YAML configurations as the overall
number configurable settings is pretty large.

On a high level, the configuration is divided into three sections: `qat`,
`adaptor` and `target`. The first section `qat` is highlevel configuration of
QAT and defines things such as whether the target requires adaption, validation
and what the adaptor pipeline looks like. The second section `adaptor` defines
the configuration for each of the adaptor components. The third section `target`
defines requirements for the target which QAT will use to validate that the
final result really is compliant with the desired target.

## QAT configuration

Before demonstrating how adaptors and target validation can be used, we will
briefly examine a few useful settings in the `qat` section. First and foremost,
`dump-config` is a useful setting that allows the user to dump the current
configuration. To provide compatibility with the human readable IR, the config
is dumped as comments. This feature is in particular useful as a commandline
flag

```sh
qat --target-def path/to/target-def.yaml -S --dump-config input.ll > output.ll
```

Note that rather than using the `-o` option, we redirect the output into the
output file. This is capture the configuration together with the resulting
output of QAT and ensure that the two are kept together for reproducibility.

Another couple of useful features are `strip-existing-dbg` and `add-ir-debug`.
These two can be set from the command line using `--strip-existing-dbg` and
`--add-ir-debug`, respectively. The first, `strip-existing-dbg`, removes all
existing debug information from the loaded modules. The other `add-ir-debug`
adds debug symbols referring to the LL file itself. This is discussed in
[detail here](../UsingQAT/DebuggingIR.md).

## Adaptor examples

In this section we will demonstrate some of the adaptor examples which
manipulate the IR to conform to target specification.

In many of the sections below, we will refer to demos. From the repository root,
these can be found in the folder `qir/demos`. A prerequisite to running the
demos is to have an environment variable `QAT_BINARY` containing the path to the
QAT binary. In each demo directory there is a `Makefile` with suggested commands
to run.

### Inlining

One of the first important examples of QAT is replication of some of the LLVM
functionality. In this and the next section, we will demonstrate some aspects of
this as we discuss the LLVM adaptor. This adaptor provides capabilities for
function inlining, loop unrolling, dead code elimination. In this first example,
we dicuss inlining and its relevance in construction of quantum programs.

Consider a Q# program that has a `MiniCircuit` which we want to use at two
distinct places, such as

```text
operation MiniCircuit(q1: Qubit,q2: Qubit): Unit {
    H(q1);
    H(q2);
    CNOT(q1, q2);
}

operation Main(): Unit {
       use q1 = Qubit();
       use q2 = Qubit();
       MiniCircuit(q1, q2);
       MiniCircuit(q1, q2);
}
```

This program produces IR similar to

```llvm
define internal void @InlineExample__Main__body() {
entry:
  call void @InlineExample__MiniCircuit__body(%Qubit* null, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  call void @InlineExample__MiniCircuit__body(%Qubit* null, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  ret void
}

define internal void @InlineExample__MiniCircuit__body(%Qubit* %q1, %Qubit* %q2) {
entry:
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %q1)
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %q2)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %q1, %Qubit* %q2)
  ret void
}
```

Any backend without support for function calls would not be able to run this
program. However, if we would inline the functions to the place where they are
called, we would not need function call as a requirement for the backend.
Function inlining is used classically and LLVM provides a ready made inliner
pass that we can use. This integrated into QAT and can be ran as follows:

```sh
qat --always-inline -S --apply -o output.ll input.ll
```

The resulting IR becomes:

```llvm
define void @ InlineExample__Main() #0 {
entry:
  call void @__quantum__qis__h__body(%Qubit* null)
  call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  call void @__quantum__qis__cnot__body(%Qubit* null, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  call void @__quantum__qis__h__body(%Qubit* null)
  call void @__quantum__qis__h__body(%Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  call void @__quantum__qis__cnot__body(%Qubit* null, %Qubit* nonnull inttoptr (i64 1 to %Qubit*))
  ret void
}
```

The LLVM optimisation adaptor exposes the inlining configuration thereby
providing some control over the behaviour. A similar example can be found in
`qir/demos/Inlining`. The key benefit is that we can write programs where
subcircuits are separated in to functions without having to rely on the backend
supporting function calls. This is one important aspect of writing parameterised
quantum programs. The other aspect is loop unrolling which we will touch upon in
the next section.

### Loop unrolling

Another important LLVM pass is the loop unrolling pass. Loop unrolling in
combination with inlining allows to fully parameterize subcircuits. In our
example from before, we could imagine a scenario where the function
`MiniCircuit` would take an extra integer `N` parameter and apply an H-gate `N`
times. With loop unrolling this would become a series of H gates with no
additional control or need for branching, and using inlining, subcircuits would
be placed directly in the main program.

```text
OPENQASM 3;
int n_iterations = 5;
int iteration = 0;
qubit q;

while (iteration < n_iterations) {
    h q;
    iteration += 1;
}
```

The above OpenQASM program can be translated into a QIR similar to:

```llvm
define internal void @loop_unrolling() {
entry:
  br label %header__1

header__1:
  %0 = phi i64 [ 1, %entry ], [ %2, %body__1 ]
  %1 = icmp slt i64 %0, 6
  br i1 %1, label %body__1, label %exit__1

body__1:
  call void @__quantum__qis__h__body(%Qubit* null)
  %2 = add i64 %0, 1
  br label %header__1

exit__1:
  ret void
}
```

The control logic associated with the loop gives rise to a `phi` node which most
of todays hardware backends would not be able to handle. However, since the loop
is constant in length, we can unroll the loop by using the `unroll-loop`
parameter:

```sh
qat --apply -S  --unroll-loops input.ll
```

This simplifies the code to a series of H gates applied to the zero'th qubit:

```llvm
define internal void @loop_unrolling() {
entry:
  call void @__quantum__qis__h__body(%Qubit* null)
  call void @__quantum__qis__h__body(%Qubit* null)
  call void @__quantum__qis__h__body(%Qubit* null)
  call void @__quantum__qis__h__body(%Qubit* null)
  call void @__quantum__qis__h__body(%Qubit* null)

  ret void
}

```

The inlining and loop unrolling passes are the most significant passes used from
the LLVM framework. The LLVM adaptor also have a few other passes. The details
of these are described briefly in the commandline help page which can be found
by running `qat -h`.

### Static resource allocation

The generic QIR allows for dynamic qubit allocation as the default way to
allocate qubits. One of the core differences between simulators and hardware
backends is how qubits are allocated: While simulators, in theory, can allocate
as many qubits as need dynamically, hardware backends has a hard limit on the
number of qubits and further more, does not implement the necessary logic to
perform dynamic management. For this reason, it is necessary to transform
dynamic qubit management into static allocation in order to make certain QIRs
compatible with backends that does not implement qubit management.

In this example, we demonstrate the "Target QIS mapping" adaptor and how it can
be used to transform dynamic qubit management into static allocations. Consider
the program

```text
OPENQASM 3;

qubit q;
h q;
```

The equivalent generic QIR is

```llvm
define void @example() #0 {
entry:
  %q = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__qis__h__body(%Qubit* %q)
  call void @__quantum__rt__qubit_release(%Qubit* %q)
  ret void
}
```

We note that the use of `__quantum__rt__qubit_allocate` and
`__quantum__rt__qubit_release` which are the functions that can be problematic
for hardware backends. Running

```sh
qat --use-static-qubit-allocation --apply -S  input.ll
```

will transform the input to

```llvm
define void @example() #0 {
entry:
  call void @__quantum__qis__h__body(%Qubit* null)
  ret void
}
```

This demo is found in `qir/demo/QubitAllocation`. Note that static qubit
allocation is not a straight forward task and there are many corner cases for
which it simply will not work. For instance, recursively allocating qubit where
recursion stops on a runtime parameter is one case that cannot be mapped. QAT
does a best effort, but at this point there is no garantuee of correctness.

Advanced experimental features are available by adding the flag `--experimental`
to the command line arguments. Run `qat --experimental -h` to see these
parameters and their description.

### Replacement linking

In this example we consider two quantum computers. The first computer implements
`z`and `cnot`. The second computer implements `x`, `h` and `cnot`.

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

Obviously, this code will not run on the second computer since that machine does
it makes use of a `z` gate. While we could rewrite the frontend code, the beauty
of an intermediate representation is that such tasks can be performed at this
level and hence, the user does not need to worry about hardware compatibility of
the frontend code.

QAT allows to address this issue by using a concept known as replacement
linking. Replacement linking is linking process by which one function call is
replaced by another if the and only if the other function is present in the IR.
To facilitate this, we annotate the function `__quantum__qis__z__body` as
follows:

```llvm
declare void @__quantum__qis__z__body(%Qubit*) #1

attributes #1 = { "replaceWith"="soft_z" }
```

This states that if the function `soft_z` is available, replace all calls to
`__quantum__qis__z__body` with `soft_z`. Passing the `main.ll` through QAT does
not result in any changes. However, adding a `lib.ll` with following code:

```llvm
define void @soft_z(%Qubit* %q) {
entry:
  call void @__quantum__qis__h__body(%Qubit* %q)
  call void @__quantum__qis__x__body(%Qubit* %q)
  call void @__quantum__qis__h__body(%Qubit* %q)
  ret void
}
```

will replace the calls `__quantum__qis__z__body` in `main.ll`. This is done by
invoking QAT as follows:

```sh
qat --apply -S --target-def target.yaml --validate main.ll lib.ll
```

From the repository root, the code for this example can be found in
`qat/demos/ReplaceLinking`. In this concrete demo, calling

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

as would be expected. We note that we have disabled inlining as to maintain the
function `soft_z`.

Each backend can now provide a library that makes software implementations of
the gates that are not supported natively by the system.

### Grouping QIS

Grouping QIS is an experimental adaptor that allows separation of the classical
operations and pure quantum circuits. In this section we will concentrate on
showing how to use this feature. If you are interested in the

TODO(tfr): Write this section once the circuit separation has been revised.

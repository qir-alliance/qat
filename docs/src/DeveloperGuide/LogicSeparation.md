# QAT Application: Logic separation

## Architecture considerations

In this section, we will discuss some classical architectures and then make
considerations regarding quantum architectures.

### Motivation: Classical co-processors

Before diving into quantum architectures, we first make a brief note on
classical architectures: For decades we have seen classical architectures
composed of multiple processing units. For instance, in the nineties it was
common to have a co-processor supporting the main x86 architecture with such
tasks as floating point operations. Other co-processing architectures were built
to enhance the computers sound capabilities and in 2001, we saw graphical
processing units (GPUs) emerge. To this day, GPUs are still an essentially
co-processor for many computing tasks including gaming, physics simulation, and
graphics to mention a few.

While floating point operation co-processors eventually became integrated into
the CPU, other co-processors such as GPU remains stand-alone units today. On a
high-level, the use of a GPU for simulation roughly follows this diagram:

```text
┌─────────────┐     Programming     ┌─────────────┐
│             │  State preparation  │             │
│             ├─────────────────────▶             │
│             │                     │             │
│   Primary   │                     │  Secondary  │
│ processing  │                     │ processing  │
│    unit     │                     │    unit     │
│             │                     │             │
│             ◀─────────────────────┤             │
│             │   Result readout    │             │
└─────────────┘                     └─────────────┘
```

First the secondary processing unit (SPU) is programmed and as a part of this
process the initial state (i.e. registers and memory) is prepared. The SPU then
executes the program and the results are read out by the primary processing unit
(PPU).

## Classical-quantum processing architecture

While one could imagine a quantum architecture in which everything is integrated
into a single processing unit that both can process classical and quantum
registers, it is unlikely that this kind of architecture will emerge in the near
future due to the vastly different environments in which the two processes take
place. Therefore, one feasible architecture is one in which we consider the
quantum processing unit (QPU) as SPU and the CPU the PPU much like is the case
for CPUs and GPUs today.

Disregarding the more advanced scenarios where PPUs and SPUs work in parallel,
the basic flow of a classical-quantum program execution follows a pattern as
given below:

```text
      Classical             PPU-SPU             Quantum
   processing unit  │      interface      │ processing unit
                    │                     │
                  │ │                     │
Classical program │ │                     │
        execution │ │                     │
                  │ │  State preparation  │
                  ▼ │     Programming     │
                    ├─────────────────────▶
                    │                     │ │
                    │                     │ │ Quantum program
                    │                     │ │ execution
                    │   Result readout    │ │
                    ◀─────────────────────┤ ▼
                  │ │                     │
Classical program │ │                     │
        execution │ │  State preparation  │
                  │ │     Programming     │
                  ▼ ├─────────────────────▶
                    │                     │ │
                    │                     │ │ Quantum program
                    │                     │ │ execution
                    │   Result readout    │ │
                    ◀─────────────────────┤ ▼
                    │                     │
                    ▼                     ▼
                    Time
```

We note that in some cases, either the state programming or the readout process
may be not contain instructions. In these cases, blocks with state programming
and/or readout will simply be empty and therefore it has no influence on the
general structure.

### Problem definition

The QIR specification does not put any requirements for a generic QIR to provide
a separation of instructions intended for the CPU and QPU. However, under the
assumption that quantum architectures follow the PPU-SPU pattern described in
the previous section such a separation is necessary to perform the program
execution. Our aim in this document will be to define how the separation should
be performed and what qualifies an entity to be a CPU or QPU element.

We will assume that branching and jumping is not possible within the QPU since
this is a classical phenomenon. The consequence is that CPU-QPU separation must
happen at the level of `BasicBlocks` in LLVM rather than at a function or even
program level. While it may be that some QPUs have basic branching support, we
note that it will be manageable to identify multi-block segments which are
compatible with a given QPU target after the separation.

## Definitions

### Registers

For traditional PPU-SPU architectures, registers are limited in scope to the
processing unit on which they reside. That is, a register on a CPU cannot be
accessed from the GPU and vice versa. The value of a given register is only
available through data transport through the two units. For CPU-QPU
architectures, this limitation is the same. While the CPU may hold a reference
to a qubit, the physical qubit itself resides on the QPU and can only be
manipulated through the CPU-QPU interface.

Quantum register types

| LLVM type name | Description                                                          |
| -------------- | -------------------------------------------------------------------- |
| `Qubit*`       | Qubit register amounting to a physical qubit or simulation data type |
| `Result*`      | Result register                                                      |

Classical register types

| LLVM type name | Description |
| -------------- | ----------- |
| `i1`           |             |
| `i2`           |             |
| `i8`           |             |
| `i16`          |             |
| `i32`          |             |
| `i64`          |             |
| `struct`       |             |

On the CPU, `Qubit*` and `Result*` are treated as integers. This means that they
should never be dereferenced nor should the "memory address" be written to.

### Instructions and instruction classification

The QIR specification has two high-level classes of instructions: Those which
are calls to functions with names starting with `__quantum__` and all other
instructions. Function calls to functions starting with `__quantum__` are
expected to follow the QIR specification and these calls are further divided
into two groups: Intrinsic functions (`__quantum__qis__`) and runtime functions
(`__quantum__rt__`). The latter are expected to be provided by the runtime
library given by the frontend and/or the target machine, whereas the former are
intrinsic functions. The intrinsic functions may either run on the CPU, the QPU
or serve as instruction to transfer data between the two processing units.

We classify `__quantum__qis__` functions into four categories: Purely CPU,
purely QPU, setup/transport from CPU to QPU and result/transport from QPU to
CPU. The classification happens on the basis of the function signature: The
function arguments together with the return result determine where the call will
be executed according to following rules:

- Any `void` function location is purely determined by its arguments:
    - Void functions that only have quantum register types as arguments are
      classified as pure QPU instructions
    - Void functions that only have classical register types as arguments are
      classified as pure CPU instructions
    - Void functions that takes a mixture are classified as CPU to QPU
      setup/transport instructions
- Any function that returns a quantum register is:
    - A pure quantum instruction if all of the function arguments are quantum
      registers
    - A CPU to QPU setup/transport instruction in any other case
- A function that returns a classical register is:
    - A pure classical instruction if all of the arguments are classical registers
    - A QPU to CPU result/transport instruction in any other case

### Pass definition

As an example we will consider following code block:

```llvm
define i64 @LogicGrouping(i64 %z) local_unnamed_addr #0 {
entry:
  %0 = icmp slt i64 %z, 0
  %a1.i.i = select i1 %0, %Qubit* null, %Qubit* inttoptr (i64 1 to %Qubit*)
  %a2.i.i = select i1 %0, %Qubit* inttoptr (i64 1 to %Qubit*), %Qubit* null
  tail call void @__quantum__qis__x__body(%Qubit* %a1.i.i)
  tail call void @__quantum__qis__z__body(%Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* %a1.i.i, %Qubit* %a2.i.i)
  tail call void @__quantum__qis__mz__body(%Qubit* %a2.i.i, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* %a2.i.i)
  %1 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  %2 = mul i64 %z, 45
  %.op.op.i.i = add i64 %2, 13
  %3 = select i1 %1, i64 -7, i64 %.op.op.i.i
  ret i64 %3
}
```

In the above 2-qubit (`0` and `1`) circuit, we use a classical parameter to
decide which qubit should be the control qubit (`a1`) and which is the target
(`a2`). We apply an X gate to the control qubit and then apply a Z gate to the
qubit with id 0 regardless of whether it is the control or target qubit. This is
followed by a CNOT gate and finally a measurement. The result from the
measurement is used to compute a classical result. Our goal is now to separate
instructions into blocks of pure quantum instructions, pure classical
instructions and data transfer. The data transfer blocks can be thought of as a
mix of classical and quantum instructions as these may manipulate registers on
either the CPU or QPU.

For the above example code, we envision a separation similar to following code
snippet:

```llvm
define i64 @LogicGrouping(i64 %z) local_unnamed_addr #0 {
entry:
  %0 = icmp slt i64 %z, 0
  %1 = mul i64 %z, 45
  %2 = add i64 %1, 13
  br label %load

load:                                             ; preds = %entry
  %3 = select i1 %0, %Qubit* null, %Qubit* inttoptr (i64 1 to %Qubit*)
  %4 = select i1 %0, %Qubit* inttoptr (i64 1 to %Qubit*), %Qubit* null
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__x__body(%Qubit* %3)
  tail call void @__quantum__qis__z__body(%Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* %3, %Qubit* %4)
  tail call void @__quantum__qis__mz__body(%Qubit* %4, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* %4)
  br label %readout

readout:                                          ; preds = %quantum
  %5 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  br label %post-classical

post-classical:                                   ; preds = %readout
  %6 = select i1 %5, i64 -7, i64 %2
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret i64 %6
}
```

In the above program, the original instructions are rearranged into blocks
following the pattern previously discussed with an `entry` block, a `load`
block, a `quantum` program block, a `readout` block and a `post-classical`
processing block. Visualized as above, the blocks are executed as follows:

```text
    Classical             PPU-SPU             Quantum
 processing unit  │      interface      │ processing unit
                  │                     │
           entry│ │                     │
                ▼ │        load         │
                  ├─────────────────────▶
                  │       readout       │ │ quantum
                  ◀─────────────────────┤ ▼
 post-classical │ │                     │
                ▼ │                     │
  exit-grouping │ │                     │
                ▼ │                     │
                  ▼                     ▼
                  Time
```

With this separation, it becomes straight-forward to execute the program parts
in accordance with the required processing unit as well as to ensure that proper
setup of the QPU was performed before initiating the quantum calculation.

### Block Separation Strategy

Our block separation strategy follows a divide-and-conquer approach: First we
sort instructions into new blocks according to the source processing. Each of
these blocks are then sub-divided based on the destination processing unit. We
illustrate this in the following diagram:

```text
            1st split       2nd split

                                 ┌──────────┐
                                 │Classical │     entry
                 ┌──────────┐ ┌─▶│   Dest   │
                 │          │ │  └──────────┘
                 │Classical │ │  ┌──────────┐
              ┌─▶│  Source  ├─┤  │ Quantum  │      load
              │  │          │ └─▶│   Dest   │
              │  └──────────┘    └──────────┘
              │                  ┌──────────┐
┌──────────┐  │  ┌──────────┐    │ Quantum  │    quantum
│          │  │  │          │ ┌─▶│   Dest   │
│ Original │  │  │ Quantum  │ │  └──────────┘
│  block   │──┼─▶│  Source  ├─┤  ┌──────────┐
│          │  │  │          │ │  │Classical │    readout
└──────────┘  │  └──────────┘ └─▶│   Dest   │
              │                  └──────────┘
              │  ┌──────────┐    ┌──────────┐
              │  │          │    │Classical │ post-classical
              │  │Classical │ ┌─▶│   Dest   │
              └─▶│  Source  │─┤  └──────────┘
                 │          │ │  ┌ ─ ─ ─ ─ ─
                 └──────────┘ │   Empty (QD)│
                              └─▶│
                                  ─ ─ ─ ─ ─ ┘
```

We note the second split is reversed depending type of instructions it contains.

We order instruction blocks (during the second split) such that instructions
whose source and destination processing units are the same come first. We note
that the second split is technically easier to make as the blocks processed in
the first split already have certain guarantees provided:

1. We are guaranteed that we only need to make one split
2. We are guaranteed that the order of all dependencies is preserved when
   splitting instructions into the two blocks

The first split is more involved as we need to identify dependencies between
classical and quantum circuits and may end up with an output similar to:

```text
                 ┌──────────┐
                 │Classical │
              ┌─▶│  Source  │
              │  └──────────┘
              │  ┌──────────┐
              │  │ Quantum  │
              ├─▶│  Source  │
              │  └──────────┘
              │  ┌──────────┐
              │  │Classical │
              ├─▶│  Source  │
┌──────────┐  │  └──────────┘
│          │  │  ┌──────────┐
│ Original │  │  │ Quantum  │
│  block   │──┼─▶│  Source  │
│          │  │  └──────────┘
└──────────┘  │  ┌──────────┐
              │  │Classical │
              ├─▶│  Source  │
              │  └──────────┘
              │       .
              │       .
              │       .
              │  ┌──────────┐
              │  │Classical │
              └─▶│  Source  │
                 └──────────┘
```

The main reason for this is that we may make a measurement and then use that
measurement to decide what the next quantum circuit looks like. As an example,
consider following circuit:

```llvm
define i64 @LogicGrouping(i64 %z) local_unnamed_addr #0 {
entry:
  %0 = icmp slt i64 %z, 0
  %a1.i.i = select i1 %0, %Qubit* null, %Qubit* inttoptr (i64 1 to %Qubit*)
  %a2.i.i = select i1 %0, %Qubit* inttoptr (i64 1 to %Qubit*), %Qubit* null
  tail call void @__quantum__qis__x__body(%Qubit* %a1.i.i)
  tail call void @__quantum__qis__z__body(%Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* %a1.i.i, %Qubit* %a2.i.i)
  tail call void @__quantum__qis__mz__body(%Qubit* %a2.i.i, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* %a2.i.i)
  %1 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  %a3.i.i = select i1 %1, %Qubit* inttoptr (i64 1 to %Qubit*), %Qubit* null
  %2 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  %a4.i.i = select i1 %2, %Qubit* null, %Qubit* inttoptr (i64 1 to %Qubit*)
  tail call void @__quantum__qis__x__body(%Qubit* %a3.i.i)
  tail call void @__quantum__qis__z__body(%Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* %a3.i.i, %Qubit* %a4.i.i)
  tail call void @__quantum__qis__mz__body(%Qubit* %a4.i.i, %Result* nonnull inttoptr (i64 1 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* %a4.i.i)
  %3 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 1 to %Result*))
  %4 = mul i64 %z, 9
  %5 = shl i64 %z, 1
  %val.i.i = select i1 %3, i64 %5, i64 %4
  %6 = mul i64 %val.i.i, 5
  %7 = add i64 %6, -7
  ret i64 %7
}
```

After grouping according to the source processing unit, we arrive at

```llvm
define i64 @LogicGrouping(i64 %z) local_unnamed_addr #0 {
entry:
  %0 = icmp slt i64 %z, 0
  %1 = select i1 %0, %Qubit* null, %Qubit* inttoptr (i64 1 to %Qubit*)
  %2 = select i1 %0, %Qubit* inttoptr (i64 1 to %Qubit*), %Qubit* null
  br label %quantum

quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__x__body(%Qubit* %1)
  tail call void @__quantum__qis__z__body(%Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1, %Qubit* %2)
  tail call void @__quantum__qis__mz__body(%Qubit* %2, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* %2)
  %3 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  %4 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  br label %post-classical

post-classical:                                   ; preds = %quantum
  %5 = select i1 %3, %Qubit* inttoptr (i64 1 to %Qubit*), %Qubit* null
  %6 = select i1 %4, %Qubit* null, %Qubit* inttoptr (i64 1 to %Qubit*)
  %7 = mul i64 %z, 9
  %8 = shl i64 %z, 1
  br label %quantum2

quantum2:                                         ; preds = %post-classical
  tail call void @__quantum__qis__x__body(%Qubit* %5)
  tail call void @__quantum__qis__z__body(%Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* %5, %Qubit* %6)
  tail call void @__quantum__qis__mz__body(%Qubit* %6, %Result* nonnull inttoptr (i64 1 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* %6)
  %9 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 1 to %Result*))
  br label %post-classical1

post-classical1:                                  ; preds = %quantum2
  %10 = select i1 %9, i64 %8, i64 %7
  %11 = mul i64 %10, 5
  %12 = add i64 %11, -7
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical1
  ret i64 %12
}
```

which contains two quantum circuits where the second circuit depends on the
first one. That is, in the block `post-classical` we select which qubits to use
for the execute, and hence, we would not be able to run the second circuit prior
to this classical calculation.

Further expanding each of the source blocks, we get the `load` and `readout`
blocks:

```llvm
define i64 @LogicGrouping(i64 %z) local_unnamed_addr #0 {
entry:
  %0 = icmp slt i64 %z, 0
  br label %load

load:                                             ; preds = %entry
  %1 = select i1 %0, %Qubit* null, %Qubit* inttoptr (i64 1 to %Qubit*)
  %2 = select i1 %0, %Qubit* inttoptr (i64 1 to %Qubit*), %Qubit* null
  br label %quantum

quantum:                                          ; preds = %load
  tail call void @__quantum__qis__x__body(%Qubit* %1)
  tail call void @__quantum__qis__z__body(%Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1, %Qubit* %2)
  tail call void @__quantum__qis__mz__body(%Qubit* %2, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* %2)
  br label %readout

readout:                                          ; preds = %quantum
  %3 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  %4 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  br label %post-classical

post-classical:                                   ; preds = %readout
  %5 = mul i64 %z, 9
  %6 = shl i64 %z, 1
  br label %load4

load4:                                            ; preds = %post-classical
  %7 = select i1 %3, %Qubit* inttoptr (i64 1 to %Qubit*), %Qubit* null
  %8 = select i1 %4, %Qubit* null, %Qubit* inttoptr (i64 1 to %Qubit*)
  br label %quantum2

quantum2:                                         ; preds = %load4
  tail call void @__quantum__qis__x__body(%Qubit* %7)
  tail call void @__quantum__qis__z__body(%Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* %7, %Qubit* %8)
  tail call void @__quantum__qis__mz__body(%Qubit* %8, %Result* nonnull inttoptr (i64 1 to %Result*))
  tail call void @__quantum__qis__reset__body(%Qubit* %8)
  br label %readout3

readout3:                                         ; preds = %quantum2
  %9 = tail call i1 @__quantum__qis__read_result__body(%Result* nonnull inttoptr (i64 1 to %Result*))
  br label %post-classical1

post-classical1:                                  ; preds = %readout3
  %10 = select i1 %9, i64 %6, i64 %5
  %11 = mul i64 %10, 5
  %12 = add i64 %11, -7
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical1
  ret i64 %12
}
```

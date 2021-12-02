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
co-processor for many computing tasks including gaming, physics simulation and
graphics to mention a few.

While floating operations co-processors eventually became integrated into the
CPU, other co-processors such as GPU remains stand-alone units today. On a
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

TODO: Finish this section

### Problem definition

The QIR specification does not put any requirements for a generic QIR to provide
a separation of instructions intended for the CPU and QPU. However, under the
assumption that quantum architectures follow the PPU-SPU pattern described in
the previous section such a separation is necessary to perform the program
execution. Our aim in this document will be to define how the separation should
be performed and what qualifies an entity to be a CPU or QPU element.

We will assume that branching is not possible within the QPU since this is a
classical phenomena. The consequence is that CPU-QPU separation must happen at
the level of `BasicBlocks` in LLVM rather than at a function or even program
level. While it may be that some QPUs has basic branching support, we note that
it will be manageable to identify multi-block segments which are compatible with
a given QPU target after the separation.

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
should never be dereferenced nor nor should the "memory address" be written to.

### Instructions and instruction classification

The QIR specification has two high-level classes of instructions: Those which
are calls to functions with names starting with `__quantum__` and all other
instructions. Function calls to functions starting with `__quantum__` are
expected to follow the QIR specification and these calls are further divided
into two groups: Intrinsic functions (`__quantum__qis__`) and runtime functions
(`__quantum__rt__`). The latter is expected to be provided by the runtime
library given by the frontend and/or the target machine whereas the former are
intrinsic functions. The intrinsic functions may either run on the CPU, the QPU
or serve as instruction to transfer data between the two processing units.

We classify `__quantum__qis__` functions into four categories: Purely CPU,
purely QPU, setup/transport from CPU to QPU and result/transport from QPU to
CPU. The classification happens on the basis function signature: The function
arguments together with the return result determines the where the call will be
executed according to following rules:

- Any `void` function location is purely determined by its arguments:
  - Void functions that only has quantum register types as arguments are
    classified as pure QPU instructions
  - Void functions that only has classical register types as arguments are
    classified as pure CPU instructions
  - Void functions that that takes a mixture are classified as CPU to QPU
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
  %1 = select i1 %0, %Qubit* null, %Qubit* inttoptr (i64 1 to %Qubit*) ;; TODO(tfr): This should be moved to a transfer section
  %2 = select i1 %0, %Qubit* inttoptr (i64 1 to %Qubit*), %Qubit* null ;; TODO(tfr): This should be moved to a transfer section
  %3 = mul i64 %z, 45
  %4 = add i64 %3, 13
  br label %quantum
;; load: ;; TODO(tfr): Make this section.
quantum:                                          ; preds = %entry
  tail call void @__quantum__qis__x__body(%Qubit* %1)
  tail call void @__quantum__qis__z__body(%Qubit* null)
  tail call void @__quantum__qis__cnot__body(%Qubit* %1, %Qubit* %2)
  tail call void @__quantum__qis__mz__body(%Qubit* %2, %Result* null)
  tail call void @__quantum__qis__reset__body(%Qubit* %2)
  br label %readout

readout:                                          ; preds = %quantum
  %5 = tail call i1 @__quantum__qis__read_result__body(%Result* null)
  br label %post-classical

post-classical:                                   ; preds = %readout
  %6 = select i1 %5, i64 -7, i64 %4
  br label %exit_quantum_grouping

exit_quantum_grouping:                            ; preds = %post-classical
  ret i64 %6
}
```

TODO(tfr): add support for load. In the above program, the original instructions
are rearranged into blocks following the pattern previously discussed with an
`entry` block, a `load` block, a `quantum` program block, a `readout` block and
a `post-classical` processing block. Visualised in as above the blocks are
executed as follows:

```
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

With this separation it becomes straight-forward to execute the program parts in
accordance with the processing unit which the require as well as to ensure that
proper setup of the QPU was performed before initiating the quantum calculation.

## Pass usage

###

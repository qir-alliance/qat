# Architecture Overview

This document assumes familiarity with LLVM,
[LLVM intermediate representation (IR)](https://llvm.org/docs/LangRef.html),
LLVM passes and the `opt` tool which is used to apply passes to IRs. We also
assume that the reader is familiar with the
[QIR specification](https://github.com/qir-alliance/qir-spec), the conventions
used for functions and its opaque types. We further assume that the reader is
familiar with basic C++. This is in particular true later on when we dig into
the details of building pass components. Throughout this document we will assume
that any reference to a QIR, is a valid within the specification requirements.

The aim of this document is to walk the reader through the vision and
architecture of the QIR adaptor tool (QAT). To this end, we will be discussing
how QAT uses both built-in and custom written LLVM passes to transform generic
QIRs into ones which are targeted specific platforms and/or capabilities.

We refer to any generic QIR as just "the QIR" or the generic QIR where as those
target for specific platforms and/or capabilities, we call specialised QIRs. The
description of the requirements for the specialised QIR we call a QIR profile.
When we talk about applying a profile to a generic QIR, we talk about the
process which transform the generic QIR into the specialised one. Likewise, when
we talk about validating that a specialised QIR fulfils the description of a
profile.

In building QAT, we note that there are two main challenges to overcome:

1. Applying a profile to a generic QIR, and,
2. Validating that a QIR is compliant with a profile specification.

We may on occasion refer to the former as a transformation and the latter as an
analysis to clarify the similarity to LLVM passes. The architecture described in
this document attempts to address both of these challenges in way that we
believe to be customisable and scalable in terms of profile requirements.

Before digging into the details of the design of QAT, we first note that LLVMøs
`opt` has many of the properties that we desire: Modularised, extendable in a
non-invasive manner and differentiates between analysis and transformation. The
downsides to `opt` is that we cannot pass a configuration to the individual
passes, it is difficult to control which concrete passes are ran and, under the
assumption that a profile is described by a collection of passes, there is no
elegant way to bundle these into a single argument. In our design, it will be
our goal to preserve the good aspects of `opt` while adding the capabilities we
miss to make profile transformations and validation.

Before spelling the system requirements out, we consider a couple of examples of
what we may need for functionality.

## Example: Function inlining

Let us first consider the case of quantum architecture that does not support
classical function calls. That is, a valid program must be all inlined. This is
a task that can be handled by `opt` by supplying the command line argument
`--always-inline`. This flag turns the inline pipeline on and attempts to inline
as many function calls as possible. For QAT to be a useful tool, we would want a
similar mechanism that allows to activate or deactivate existing (and new) LLVM
passes. We would thus need something like

```sh
qat --always-inline --profile base --apply -S filename.ll
```

where `--apply` tells the tool to apply the profile and `-S` tells the tool to
emit human readable LLVM IR code. Furthermore, if the inline pass is provided as
an external module, we would need to be able load it

```sh
qat --always-inline --profile base --load path/to/lib.(dylib|so|dll) --apply -S filename.ll
```

We note that from a developer point of view, the underlying code would also need
a way to let QAT know that it expects a command line argument
`--always-inline/--no-always-inline`.

## Example: Static qubit allocation

To get a better understanding of the problem at hand, let us examine another
example: Qubit allocation. As we run our quantum program, we may use a simulator
or we may deploy it on one of the hardware providers. Depending on whether we
are running in one environment or the other, qubits are different entities: In a
computer simulation they are often objects. They could for instance be allocated
on the heap in a non-sequential manner. In this context, it makes sense to talk
about a qubits life time through instructions that allocates and releases them.
On hardware, on the other hand, qubits are physical entities typically
sequentially enumerated from 0 to N - 1. Physical qubits may (or may not) have
the constraint some qubits are unavailable to the user. Though not always,
hardware may further have the constraint that user can only perform a single
measurement at the end of the program execution. This means that qubits cannot
be reused within one program execution.

This puts requirements on what we may need from static qubit allocation. For any
static allocation, we would need at least following information:

- Whether or not to map qubits to fixed integers
- Reuse qubits or not
- List unavailable qubits

It is not hard to imagine that this could be extended even further by imposing
customised allocation schemes. In contrast to the previous example, this example
requires a much more detailed configuration to define the mode of operation. One
could for instance imagine something along the lines of

```sh
qat --use-static-allocation --reuse-qubits --defect-qubits 3,7,9 --max-qubits 10 --apply -S filename.ll
```

Hence, unlike normal LLVM passes, we will need a detailed configuration to be
passed along with the transformation.

## Design requirements

To distinguish between LLVM passes and QAT extensions, we will refer to QAT
extensions as profile components. A profile component may consist of several
passes and furthermore should be accompanied by a configuration to describe its
behaviour. Like LLVM `opt` we require that QAT must be extensible through
dynamic libraries. This allow third party to easily extend the tool to their
needs while benefiting from the components that QAT ships with.

## Architecture description

On a high level, the process of the IRs can be divided into three main tasks: 1)
Loading the QIR, 2) creating a generator and validator and 3) transform and
validate the QIR. We summarize this process in the diagram below, listing the
components and settings used in the process and how they feed into one and
another:

```text
┌ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┐
                         User input
└ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┬ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┘
┌─────────────────────────────▼─────────────────────────────┐
│            Configuration and parameter parser             │
└─────────────┬───────────────────────────────┬─────────────┘
┌─────────────▼─────────────┐   ┌─────────────▼─────────────┐
│        IR file list       │   │      Profile config       │
└─────────────┬─────────────┘   └─────────────┬─────────────┘
┌─────────────▼─────────────┐   ┌─────────────▼─────────────┐
│       Module loader       │   │     Profile Generator     │
└─────────────┬─────────────┘   └─────────────┬─────────────┘
┌─────────────▼─────────────┐   ┌─────────────▼─────────────┐
│       Single module       │   │          Profile          │
│      transformations      │   └──────┬──────────────┬─────┘
└─────────────┬─────────────┘   ┌──────▼─────┐ ┌──────▼─────┐
┌─────────────▼─────────────┐   │            │ │            │
│   Adding debug symbols    ├───▶ Generation ├─┼▶Validation ├─────┐
└───────────────────────────┘   │            │ │            │     │
                                └──────┬─────┘ └──────┬─────┘     │
                                ┌──────▼──────────────▼─────┐     │
                                │          Logger           │     │
                                └───────────────────────────┘     │
                                              │                   │
                                              ▼                   ▼
                                     ┌ ─ ─ ─ ─ ─ ─ ─ ─ ┐┌ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┐
                                       Standard error     Standard Output:
                                     │    or file:     ││   Resulting IR    │
                                          JSON Logs
                                     └ ─ ─ ─ ─ ─ ─ ─ ─ ┘└ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┘
```

The profile consists of a generator and a validator. The generator is
responsible for performing as many transformations as possible to get the
original QIR to be compliant with the selected profile. This is done by each of
the components taking a configuration which then installs LLVM passes to execute
said transactions. This is illustrated on the left hand-side in the following
figure whereas the pass execution is illustrated on the right hand-side:

```text
                                                    ┌ ─ ─ ─ ─ ─ ─ ─ ┐
                                                       LLVM module
┌───┐                                               └ ─ ─ ─│─ ─ ─ ─ ┘
│   │                                                      │ Apply profile
│ C │                                                      │ process
│ o │                                     ┌ Generator ─ ─ ─│─ ─ ─ ─ ─
│ n │If                                            ┌───────▼───────┐ │
│ f │component                     Install│        │  Inline pass  │
│ i │active:  ┌───────────────────┐passes   ┌───┐  └───────┬───────┘ │
│ g ├─────────▶    LLVM passes    │───────┼─▶   │  ┌───────▼───────┐
│ u │         └───────────────────┘         │   │  │  Unroll pass  │ │
│ r │                                     │ │ P │  └───────┬───────┘
│ a │         ┌───────────────────┐         │ a │  ┌───────▼───────┐ │
│ t ├─────────▶  Transformation   │───────┼─▶ s │  │Transform pass │
│ i │         └───────────────────┘         │ s │  └───────┬───────┘ │
│ o │                                     │ │   │  ┌───────▼───────┐
│ n │         ┌ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┐         │ m │  │  Inline pass  │ │
│   ├─────────▶    LLVM passes     ───────┼─▶ a │  └───────┬───────┘
│ m │         └ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┘         │ n │  ┌───────▼───────┐ │
│ a │                                     │ │ a │  │   Fold pass   │
│ n │         ┌───────────────────┐         │ g │  └───────┬───────┘ │
│ a ├─────────▶     Grouping      │───────┼─▶ e │  ┌───────▼───────┐
│ g │         └───────────────────┘         │ r │  │  Group pass   │ │
│ e │                                     │ │ s │  └───────┬───────┘
│ r │                                       │   │          │         │
│   │                                     │ │   │          │
└───┘                                       └───┘          │         │
                                          └ ─ ─ ─ ─ ─ ─ ─ ─│─ ─ ─ ─ ─
                                                           │
                                                   ┌ ─ ─ ─ ▼ ─ ─ ─ ┐
                                                     Output module
                                                   └ ─ ─ ─ ─ ─ ─ ─ ┘
```

For each component available, QAT checks if the component is active and if it
is, the components setup function is ran with its configuration class. This
class can be configured from the command line or through the profile. We note
that the figure does not contain a comprehensive list of passes that can be
installed. Whether or not any of the listed passes is added to the pass managers
is happening at the discretion of each of the components and is further subject
to the configuration provided to these components. This means that depending on
the profile configuration, the pass may perform one task or another. This is in
particular true for the transformation pass which uses a set of rules to perform
replacements in the IR.

The transformation component is a highly configurable component that does
replacements of pieces of the DAG in the IR with using a custom replacer
function. The infrastructure is written such that it is possible to express a
new pattern in just a couple of lines and the developer can focus on the
replacement routine rather than the task of capturing the right segment of
instructions.

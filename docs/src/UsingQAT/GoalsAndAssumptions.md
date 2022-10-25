# QAT: Goals, assumptions and limitations

## Goals

QAT primary purpose is to manipulate and validate QIR via a command-line
interface. Concretely, QAT aims at performing following tasks:

- Simplifying logic
- Transforming logic
- Adding debugging using LLVM IRs as the source
- Validating the logic compatibility with a specific profile

One of the biggest strength of the LLVM infrastructure is the large amount of
optimizations available. For instance, the LLVM optimization tool `opt` allows
constant folding, unrolling of loops, inlining of functions and branch
elimination amongst others. These optimizations are useful in order to simplify
complicated programs to something that can be ran on processors with a limited
classical instruction set.

Transforming logic involves transforming qubit allocations into static
allocations, separating logic and removing unwanted logic. In case of qubit
allocations, the generic method to acquire a qubit resource is through
`__quantum__rt__qubit_allocate` and release again through
`__quantum__rt__qubit_release`. Such runtime functions are not currently
supported by available hardware. More generally, available hardware does not
have support for any runtime functions which makes it inadequate way to express
quantum programs. While we expect that runtime libraries will become
increasingly available as the industry develops, it is an immediate need to
eliminate these from the QIR. QAT is capable of solving this problem in a
multitude of ways. In case of `__quantum__rt__qubit_allocate`, QAT has a pass
which allows to replace these with static qubit numbers under certain
conditions. Another example of a QAT transformation is the ability to separate
classical driver logic from the quantum programs in mixed quantum-classical
programs.

The third goal of QAT is to allow QIRs to be annotate with debug information
based on an input LLVM IR as the source file. The intend is to provide
functionality to help developers to debug at an IR level by incorporating means
to annotating debug information referring to the `.ll` file. This functionality
complements existing debug information and can, optionally, override it if
needed.

The fourth goal of QAT is to validate whether or not a QIR is compliant with the
capabilities of a specific quantum system. This is done through profiles which
are configurations describing allowing types, instructions, functions and modes
of operating.

## Assumptions & limitations

In the following subsections we will outline some of the assumptions and
limitations of the current implementation of algorithms addressing the previous
listed tasks. This document does not discuss the assumptions and limitations of
experimental features such as recursion unfolding, but limits itself to what we
consider stable in the latest release.

### Simplifying logic through LLVM passes

For logic simplification, it is an assumption that the passes used will not
perform any transformation causing unsupported instructions. This is a strong
assumption as LLVM, for instance, may attempt to vectorize loops thereby making
use of vector registers and corresponding instructions. To mitigate this, we
have limit the LLVM passes available to a handful and parametrized the
configuration of them. This serves to increase reproducibility across platforms
as well as to provide control over the pass behaviour. However, it does not
provide a strict guarantee that these types of transformations will not occur.
We therefore rely on the validation functionality to ensure that the final
program is compliant with the targeted architecture.

### Transforming abstractions

Transformations to replace dynamic qubit allocation with static qubit allocation
relies on a strong assumption that no subcircuit rely on recursion. The core
issue that gives rise to this assumption is that it is not possible to replace a
dynamic qubit allocation with a static one inside a program unless there is
strict guarantees that 1) the function does not call itself and 2) that the
acquisition time of the qubit is restricted to the life time of the function
scope.

Transformations that remove reference counting relies on an assumption that all
arrays and other ADTs are successfully removed. This assumption may not be true
and would under normal circumstances be caught be the validation step assuming
an appropriate profile is used.

Transformations that remove strings, assumes that strings and functions
consuming or producing strings can be treated as "debug" statements which has no
other side effect than to output the string content to the screen. Such an
assumption may not hold true for frontends that uses dictionaries with strings
as key for instance.

### Annotating QIR with Debug information

A core assumption related to annotating the QIR with debug information is that
the human readable version of the IR (the `.ll`-file) is the source of truth and
can be referred to by line and column numbers rather than the bitcode. This
assumption may not hold true as the different versions of LLVM may produce
different `.ll` files which are not necessarily compatible with one and another.
Therefore, if the bitcode file is used as input in a cloud service, the referred
to line and column numbers may differ from those produced locally.

### Logic separation

The logic separation functionality assumes that instructions belonging to the
primary (CPU) and secondary (QPU) processing units can be distinguished solely
by its operation signatures. That is, `void` function calls which only takes
`Qubit*` and `Result*` as arguments are pure quantum instructions whereas
function calls that returns classical entities (such as `i8`, `i64` etc.) but
take `Qubit*` and `Result*` as arguments are read out functions. This puts a
natural limit to what can be executed on the QPU since this approach does not
allow it for any classical instruction to make its way to the QPU.

Another assumption is that QPU is performing a single run with multiple quantum
programs to be loaded and executed. Subsequently, it is the assumption that the
machine stays coherent throughout the full program execution which is not
necessarily the case.

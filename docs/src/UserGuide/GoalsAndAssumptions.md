# QAT: Goals, assumptions and limitations

## Goals

QAT primary purpose is to manipulate and validate QIR via a command-line interface. Concretely, QAT aims at performing following tasks:

- Simplifying logic
- Transforming logic
- Adding debugging using LLVM IRs as the source
- Validating the logic compatibility with a specific profile

One of the biggest strength of the LLVM infrastructure is the large amount of optimizations available. For instance, the LLVM optimization tool `opt` allows constant folding, unrolling of loops, inlining of functions and branch elimination amongst others. These optimizations are useful in order to simplify complicated programs to something that can be ran on processors with a limited classical instruction set.

Transforming logic involves transforming qubit allocations into static allocations, separating logic and removing unwanted logic. In case of qubit allocations, the generic method to acquire a qubit resource is through `__quantum__rt__qubit_allocate` and release again through `__quantum__rt__qubit_release`. Such runtime functions are not currently supported by available hardware. More generally, available hardware does not have support for any runtime functions which makes it inadequate way to express quantum programs. While we expect that runtime libraries will become increasingly available as the industry develops, it is an immediate need to eliminate these from the QIR. QAT is capable of solving this problem in a multitude of ways. In case of `__quantum__rt__qubit_allocate`, QAT has a pass which allows to replace these with static qubit numbers under certain conditions. Another example of a QAT transformation is the ability to separate classical driver logic from the quantum programs in mixed quantum-classical programs.

The third goal of QAT is to allow QIRs to be annotate with debug information based on an input LLVM IR as the source file. This helps the developer.

## Assumptions & limitations

### Simplifying logic through LLVM passes

### Annotating QIR with Debug information

### Transforming abstractions

### Logic separation

# Targeting QIR

## List of adaptors

##

/qir/qat/Apps/qat --help
Usage: ./qir/qat/Apps/qat [options] filename

## Component configuration - Used to disable or enable components

--disable-qat Disables QAT base configuration. Default: false
--disable-adaptor.transformation-rules Disables Transformation rules. Default: false
--disable-adaptor.replacement-linking Disables Replacement linking. Default: false
--disable-adaptor.llvm-optimization Disables LLVM optimizations. Default: false
--disable-adaptor.pre-transform-trimming Disables Pre-transform trimming. Default: false
--disable-adaptor.transformation-rules Disables Pass configuration. Default: false
--disable-adaptor.post-transform Disables Post-transform optimisation. Default: false
--disable-adaptor.post-transform-validation Disables Pre-transform validation. Default: false
--disable-adaptor.static-resources Disables Static resource manipulation. Default: false
--disable-adaptor.grouping Disables Circuit separation. Default: false
--disable-target.profile Disables Target profile validation. Default: false
--disable-target.qis Disables Target QIS validation. Default: false

## QAT base configuration - Configuration of QAT defining the high-level behaviour.

--apply Applies a adaptor to transform the IR in correspondence with the adaptor. Default: false
--validate Executes the validation procedure. Default: false
--adaptor Sets the adaptor. Default: generic
--adaptor-pipeline Overrides the adaptor pipleline. Default:
--emit-llvm, -S Emits LLVM IR to the standard output. Default: false
--target-def YAML file containing the definition for the target. Default:
--save-config YAML file to which the config will be save. Default:
--verify-module Verifies the module after transformation. Default: false
--experimental Enables experimental features. Default: false
--dump-config Prints the configuration to the standard output. Default: false
--add-ir-debug Annotates the IR with debug information. Default: false
--strip-existing-dbg Strips existing debug symbols. Default: false
--output, -o Output file. If empty, the output is sent to stdout. Default:
--save-logs Saves the logs report to specified filename in JSON format. Default:
--version, -v Shows the version of QAT. Default: false
--help, -h Show help page. Default: false

## Transformation rules - Rules used to transform instruction sequences in the QIR.

--[no-]optimize-result-one Maps branching based on quantum measurements compared to one to base adaptor type measurement. Default: true
--[no-]optimize-result-zero Maps branching based on quantum measurements compared to zero to base adaptor type measurement. Default: true
--[no-]optimize-result-comparison Maps branching based on quantum measurements compared to each other to base adaptor type measurement. Default: true
--[no-]use-static-qubit-array-allocation Maps allocation of qubit arrays to static array allocation. Default: true
--[no-]use-static-qubit-allocation Maps qubit allocation to static allocation. Default: true
--[no-]use-static-result-allocation Maps result allocation to static allocation. Default: true
--[no-]disable-reference-counting Disables reference counting by instruction removal. Default: true
--[no-]disable-alias-counting Disables alias counting by instruction removal. Default: true
--[no-]disable-string-support Disables string support by instruction removal. Default: true
--[no-]disable-record-output-support Disables record output support by instruction removal. Default: true

Replacement linking - Replaces function calls if the given function is present in the IR

--replace-functions Functions to be replaced. Default:
--remove-call-attributes Discard all call attributes Default: false

## LLVM optimizations - Enables specific LLVM optimizations before and after transformation.

--unroll-loops Aggressively unroll loops. Default: false
--[no-]allow-partial Enables or disables partial unrolling. When disabled only full unrolling is allowed. Default: true
--[no-]allow-peeling Enables or disables loop peeling. Default: true
--[no-]allow-runtime Enables or disables unrolling of loops with runtime trip count. Default: true
--[no-]allow-upper-bound Enables or disables the use of trip count upper bound in loop unrolling. Default: true
--[no-]allow-profile-based-peeling Enables or disables loop peeling basing on profile. Default: true
--full-unroll-count Sets the max full unroll count. Default: 1024
--unroll-opt-level Sets the optimization level for loop unrolling. Default: 3
--only-when-forced If true, only loops that explicitly request unrolling via metadata are considered. Default: false
--forget-scev If true, forget all loops when unrolling. If false, forget top-most loop of the currently processed loops. Default: false
--always-inline Aggressively inline function calls. Default: false
--inlining-parameter Number of code lines acceptable when inlining. Default: 2147483647
--[no-]eliminate-constants Uses LLVM pass to eliminate constants. Default: true
--[no-]eliminate-dead-code Uses LLVMs aggressive dead code elimination. Default: true
--[no-]eliminate-memory Maps memory into registers where feasible. Default: true

## Pre-transform trimming -

## Pass configuration - Configuration of the pass and its corresponding optimizations.

--reuse-qubits Use to define whether or not to reuse qubits. Default: false
--reuse-results Use to define whether or not to reuse results. Default: false
--entry-point-attr Specifies the attribute indicating the entry point. Default: EntryPoint

## Post-transform optimisation - Optimisations performed after

--[no-]lower-switch Lower switch statements. Default: true
--[no-]should-eleminate-zext-i1 Replace zext instruction for i1 with select. Default: true
--defer-measurements Wether or not measurement and recording functions should be moved to the end of the program. Default: false

## Static resource manipulation - Manipulates statically allocated qubits and results

--[no-]annotate-qubit-use Annotate the number of qubits used Default: true
--[no-]annotate-result-use Annotate the number of results used Default: true
--[no-]annotate-max-qubit-index Annotate the maximum qubit index used Default: true
--[no-]annotate-max-result-index Annotate the maximum result index used Default: true
--reindex-qubits Re-indexes statically allocated qubits with sequential ids starting from 0 Default: false
--replace-qubit-on-reset Replaces a qubit with new qubit if the qubit is reset Default: false
--[no-]inline-after-id-change Inlines instructions after id was changed Default: true

Circuit separation - Separation of quantum and classical circuits

## Target profile validation - Configuration for profile validation

--requires-qubits Whether or not qubits are required in the IR. Default: false
--requires-results Whether or not results are required in the IR. Default: false
--[no-]allow-internal-calls Whether or not internal calls are allowed. Default: true
--[no-]allow-poison Whether or not poison values are allowed. Default: true
--[no-]allow-undef Whether or not undef values are allowed. Default: true

## Target QIS validation - Configuration for QIS validation

--[no-]allowed-any-qis Whether or not to allow any quantum instruction. Default: true

# Targeting QIR

TODO: replace --adaptor with --target

An important aspect is that the default values change with the target configuration. The defaults listed in this section are those for the `generic` target configuration.

## QAT Configuration

### Component configuration - Used to disable or enable components

TODO: Fix disable to not containg section.flag but just flag.

| Name                                      | Description                            | Default value |
| ----------------------------------------- | -------------------------------------- | ------------- |
| disable-qat                               | Disables QAT base configuration.       | false         |
| disable-adaptor.transformation-rules      | Disables Transformation rules.         | false         |
| disable-adaptor.replacement-linking       | Disables Replacement linking.          | false         |
| disable-adaptor.llvm-optimization         | Disables LLVM optimizations.           | false         |
| disable-adaptor.pre-transform-trimming    | Disables Pre-transform trimming.       | false         |
| disable-adaptor.transformation-rules      | Disables Pass configuration.           | false         |
| disable-adaptor.post-transform Disables   | Post-transform optimisation.           | false         |
| disable-adaptor.post-transform-validation | Disables Pre-transform validation.     | false         |
| disable-adaptor.static-resources          | Disables Static resource manipulation. | false         |
| disable-adaptor.grouping                  | Disables Circuit separation.           | false         |
| disable-target.profile                    | Disables Target profile validation.    | false         |
| disable-target.qis                        | Disables Target QIS validation.        | false         |

### QAT base configuration - Configuration of QAT defining the high-level behaviour.

| Name                     | Description                                                               | Default value |
| ------------------------ | ------------------------------------------------------------------------- | ------------- |
| apply                    | Applies a adaptor to transform the IR in correspondence with the adaptor. | false         |
| validate                 | Executes the validation procedure.                                        | false         |
| adaptor                  | Sets the adaptor.                                                         | generic       |
| adaptor-pipeline         | Overrides the adaptor pipleline.                                          |               |
| emit-human-readible-llvm | Emits LLVM IR to the standard output.                                     | false         |
| target-def               | YAML file containing the definition for the target.                       |               |
| save-config              | YAML file to which the config will be save.                               |               |
| verify-module            | Verifies the module after transformation.                                 | false         |
| experimental             | Enables experimental features.                                            | false         |
| dump-config              | Prints the configuration to the standard output.                          | false         |
| add-ir-debug             | Annotates the IR with debug information.                                  | false         |
| strip-existing-dbg       | Strips existing debug symbols.                                            | false         |
| output                   | Output file. If empty, the output is sent to stdout.                      |               |
| save-logs                | Saves the logs report to specified filename in JSON format.               |               |
| version                  | Shows the version of QAT.                                                 | false         |
| help                     | Show help page.                                                           | false         |

## Validating a QIR

Validating the QIR consists of two separate tasks: Validating that the QIR is compliant with the profile specification and validating that the QIR only uses

### Target profile validation - Configuration for profile validation

| Name                 | Description                                    | Default value |
| -------------------- | ---------------------------------------------- | ------------- |
| requires-qubits      | Whether or not qubits are required in the IR.  | false         |
| requires-results     | Whether or not results are required in the IR. | false         |
| allow-internal-calls | Whether or not internal calls are allowed.     | true          |
| allow-poison         | Whether or not poison values are allowed.      | true          |
| allow-undef          | Whether or not undef values are allowed.       | true          |

### Target QIS validation - Configuration for QIS validation

| Name            | Description                                      | Default value |
| --------------- | ------------------------------------------------ | ------------- |
| allowed-any-qis | Whether or not to allow any quantum instruction. | true          |

## List of adaptors

### Transformation rules - Rules used to transform instruction sequences in the QIR.

| Name                              | Description                                                                                           | Default value |
| --------------------------------- | ----------------------------------------------------------------------------------------------------- | ------------- |
| optimize-result-one               | Maps branching based on quantum measurements compared to one to base adaptor type measurement.        | true          |
| optimize-result-zero              | Maps branching based on quantum measurements compared to zero to base adaptor type measurement.       | true          |
| optimize-result-comparison        | Maps branching based on quantum measurements compared to each other to base adaptor type measurement. | true          |
| use-static-qubit-array-allocation | Maps allocation of qubit arrays to static array allocation.                                           | true          |
| use-static-qubit-allocation       | Maps qubit allocation to static allocation.                                                           | true          |
| use-static-result-allocation      | Maps result allocation to static allocation.                                                          | true          |
| disable-reference-counting        | Disables reference counting by instruction removal.                                                   | true          |
| disable-alias-counting            | Disables alias counting by instruction removal.                                                       | true          |
| disable-string-support            | Disables string support by instruction removal.                                                       | true          |
| disable-record-output-support     | Disables record output support by instruction removal.                                                | true          |

### Pass configuration - Configuration of the pass and its corresponding optimizations.

TODO: Pass Configuration is a poor choice of name. Move these up to the transformation rules and make this dereferenced values

| Name             | Description                                         | Default value |
| ---------------- | --------------------------------------------------- | ------------- |
| reuse-qubits     | Use to define whether or not to reuse qubits.       | false         |
| reuse-results    | Use to define whether or not to reuse results.      | false         |
| entry-point-attr | Specifies the attribute indicating the entry point. | EntryPoint    |

### Post-transform optimisation - Optimisations performed after

| Name                     | Description                                                                                  | Default value |
| ------------------------ | -------------------------------------------------------------------------------------------- | ------------- |
| lower-switch             | Lower switch statements.                                                                     | true          |
| should-eleminate-zext-i1 | Replace zext instruction for i1 with select.                                                 | true          |
| defer-measurements       | Wether or not measurement and recording functions should be moved to the end of the program. | false         |

### Replacement linking - Replaces function calls if the given function is present in the IR

| Name                   | Description                 | Default value |
| ---------------------- | --------------------------- | ------------- |
| replace-functions      | Functions to be replaced.   |               |
| remove-call-attributes | Discard all call attributes | false         |

### LLVM optimizations - Enables specific LLVM optimizations before and after transformation.

| Name                        | Description                                                                                                | Default value |
| --------------------------- | ---------------------------------------------------------------------------------------------------------- | ------------- |
| unroll-loops                | Aggressively unroll loops.                                                                                 | false         |
| allow-partial               | Enables or disables partial unrolling. When disabled only full unrolling is allowed.                       | true          |
| allow-peeling               | Enables or disables loop peeling.                                                                          | true          |
| allow-runtime               | Enables or disables unrolling of loops with runtime trip count.                                            | true          |
| allow-upper-bound           | Enables or disables the use of trip count upper bound in loop unrolling.                                   | true          |
| allow-profile-based-peeling | Enables or disables loop peeling basing on profile.                                                        | true          |
| full-unroll-count           | Sets the max full unroll count.                                                                            | 1024          |
| unroll-opt-level            | Sets the optimization level for loop unrolling.                                                            | 3             |
| only-when-forced            | If true, only loops that explicitly request unrolling via metadata are considered.                         | false         |
| forget-scev                 | If true, forget all loops when unrolling. If false, forget top-most loop of the currently processed loops. | false         |
| always-inline               | Aggressively inline function calls.                                                                        | false         |
| inlining-parameter          | Number of code lines acceptable when inlining.                                                             | 2147483647    |
| eliminate-constants         | Uses LLVM pass to eliminate constants.                                                                     | true          |
| eliminate-dead-code         | Uses LLVMs aggressive dead code elimination.                                                               | true          |
| eliminate-memory            | Maps memory into registers where feasible.                                                                 | true          |

### Static resource manipulation - Manipulates statically allocated qubits and results

| Name                      | Description                                                                | Default value |
| ------------------------- | -------------------------------------------------------------------------- | ------------- |
| annotate-qubit-use        | Annotate the number of qubits used                                         | true          |
| annotate-result-use       | Annotate the number of results used                                        | true          |
| annotate-max-qubit-index  | Annotate the maximum qubit index used                                      | true          |
| annotate-max-result-index | Annotate the maximum result index used                                     | true          |
| reindex-qubits            | Re-indexes statically allocated qubits with sequential ids starting from 0 | false         |
| replace-qubit-on-reset    | Replaces a qubit with new qubit if the qubit is reset                      | false         |
| inline-after-id-change    | Inlines instructions after id was changed                                  | true          |

# Targeting QIR

An important aspect is that the default values change with the target configuration. The defaults listed in this section are those for the `generic` target configuration.

## QAT Configuration

QAT has some high level configuration that dictates what tasks QAT should do and how it should do it. For instance, the QAT configuration will determine whether or not QAT will adapt the QIR to become compliant with a target QIR, what the adaptor pipeline looks like and whether or not it should validate target compliance afterwards.

Below we list all settings that are used to configure how QAT is running:

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

TODO: replace --adaptor with --target, or deprecate?

## Validating a QIR

Validating the QIR consists of two separate tasks: Validating that the QIR is compliant with the profile specification and validating that the QIR only uses

### Target profile validation - Configuration for profile validation

| Name                 | Description                                | Default value |
| -------------------- | ------------------------------------------ | ------------- |
| allow-internal-calls | Whether or not internal calls are allowed. | true          |
| allow-poison         | Whether or not poison values are allowed.  | true          |
| allow-undef          | Whether or not undef values are allowed.   | true          |

TODO: Move to QIS validation

| Name             | Description                                    | Default value |
| ---------------- | ---------------------------------------------- | ------------- |
| requires-qubits  | Whether or not qubits are required in the IR.  | false         |
| requires-results | Whether or not results are required in the IR. | false         |

### Target QIS validation - Configuration for QIS validation

This configuration deals with the validation of the quantum instruction set (QIS). Specifically,

| Name            | Description                                      | Default value |
| --------------- | ------------------------------------------------ | ------------- |
| allowed-any-qis | Whether or not to allow any quantum instruction. | true          |

## Adaptors

In this section we discuss configuration of the available adaptors.

### Adaptor deactivation - Used to disable or enable adaptors

This configuration section allows the user to disable one or more adaptors. By default all adaptors are activated. While this does not mean that they actively perform any transformation of the IR, it does mean that the adaptor code is loaded and that the adaptor will be operating in accordance with its settings.

The indiidual adaptors that can be disabled are listed here:

| Name                                      | Description                            | Default value |
| ----------------------------------------- | -------------------------------------- | ------------- |
| disable-adaptor.transformation-rules      | Disables Transformation rules.         | false         |
| disable-adaptor.replacement-linking       | Disables Replacement linking.          | false         |
| disable-adaptor.llvm-optimization         | Disables LLVM optimizations.           | false         |
| disable-adaptor.pre-transform-trimming    | Disables Pre-transform trimming.       | false         |
| disable-adaptor.transformation-rules      | Disables Pass configuration.           | false         |
| disable-adaptor.post-transform            | Disables Post-transform optimisation.  | false         |
| disable-adaptor.post-transform-validation | Disables Pre-transform validation.     | false         |
| disable-adaptor.static-resources          | Disables Static resource manipulation. | false         |
| disable-adaptor.grouping                  | Disables Circuit separation.           | false         |

Note that some of these adaptors are "hidden" in the sense that they do not have a configuration and that their behaviour is derived from other adaptors configuration. One such example is the `pre-transform-trimming` (TODO.) adaptor which is intended to run before `transform-rules`

TODO: Fix disable to not containg section.flag but just flag.
TODO: `disable-qat` does not make sense as there is no corresponding setup function. The same counts for `disable-target.*`
TODO: Rename PreTransformTrimmingPass -> RemoveNonEntrypointFunctions

| Name                   | Description                         | Default value |
| ---------------------- | ----------------------------------- | ------------- |
| disable-target.profile | Disables Target profile validation. | false         |
| disable-target.qis     | Disables Target QIS validation.     | false         |
| disable-qat            | Disables QAT base configuration.    | false         |

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

TODO: Move `entry-point-attr` to a top level `spec` section

### Post-transform optimisation - Optimisations performed after

TODO: It feels like this adaptor should be called something else and possibly be split into two adaptors

| Name                     | Description                                  | Default value |
| ------------------------ | -------------------------------------------- | ------------- |
| lower-switch             | Lower switch statements.                     | true          |
| should-eleminate-zext-i1 | Replace zext instruction for i1 with select. | true          |

TODO: In the long run, `defer-measurement` should be removed and covered by the grouping pass.

| Name               | Description                                                                                  | Default value |
| ------------------ | -------------------------------------------------------------------------------------------- | ------------- |
| defer-measurements | Wether or not measurement and recording functions should be moved to the end of the program. | false         |

### Replacement linking - Replaces function calls if the given function is present in the IR

Replacement linking is an adaptor that enables replacement of functions subject to the replacing function being present in the IR. As an example, imagine a backend that implements an X gate but not a Z gate. A QIR that makes use of Z gates would not run on said hardware unless we would map Z into the sequence HXH where H is the Hadamard gate. The replacement linking adaptor allows us to define a software implemention of Z in a separate library and use annotattions on the Z gate function to replace the gate if a software implementation is provided.

| Name                   | Description                 | Default value |
| ---------------------- | --------------------------- | ------------- |
| replace-functions      | Functions to be replaced.   |               |
| remove-call-attributes | Discard all call attributes | false         |

### LLVM optimizations - Enables specific LLVM optimizations before and after transformation.

The LLVM optimization adaptor runs provides selected LLVM passes to perform tranditional optimization tasks such as function inlining, loop unrolling, dead code elimination, memory elimination and constant elimination. For each of these passes, we provide a number of parameters that allows tuning of the individual passes to the extend possible:

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

### Static resource adaptor - Manipulates statically allocated qubits and results

In case of a QIR that uses statically allocated qubits and/or results, the static resource adaptor allows manipulation to archieve certain properties. One such property is enforcing sequential indexing starting 0 and another is the ability to ensure that a new qubit is used whenever a reset occurs. The latter garantuees that qubits are not reused within the lifetime of the program and is a prerequisite for measurement at the end of the program execution.

| Name                      | Description                                                                | Default value |
| ------------------------- | -------------------------------------------------------------------------- | ------------- |
| annotate-qubit-use        | Annotate the number of qubits used                                         | true          |
| annotate-result-use       | Annotate the number of results used                                        | true          |
| annotate-max-qubit-index  | Annotate the maximum qubit index used                                      | true          |
| annotate-max-result-index | Annotate the maximum result index used                                     | true          |
| reindex-qubits            | Re-indexes statically allocated qubits with sequential ids starting from 0 | false         |
| replace-qubit-on-reset    | Replaces a qubit with new qubit if the qubit is reset                      | false         |
| inline-after-id-change    | Inlines instructions after id was changed                                  | true          |

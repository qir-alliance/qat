# Targeting QIR

## QAT Configuration

QAT has some high level configuration that dictates what tasks QAT should do and
how it should do it. For instance, the QAT configuration will determine whether
or not QAT will adapt the QIR to become compliant with a target QIR, what the
adaptor pipeline looks like and whether or not it should validate target
compliance afterwards.

Below we list all settings that are used to configure how QAT is running:

| Name                     | Description                                                               | Default value |
| ------------------------ | ------------------------------------------------------------------------- | ------------- |
| apply                    | Applies a adaptor to transform the IR in correspondence with the adaptor. | false         |
| validate                 | Executes the validation procedure.                                        | false         |
| adaptor-pipeline         | Overrides the adaptor pipeline.                                           |               |
| emit-human-readable-llvm | Emits LLVM IR to the standard output.                                     | false         |
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

The flags `apply` and `validate` are used to specify whether QAT should apply
adaptors and validate the resulting QIR, respectively. These flags can be
applied independently of one and another. Hence, it is possible to validate a
QIR without first transforming it as well as transforming it without the need of
validating it.

The QIR transformation process is dictated by the `adapator-pipeline` which
determines which adaptors QAT will use and in which order. The default pipeline
is `replacement-linking`, `llvm-optimization`,
`remove-non-entrypoint-functions`, `target-qis-mapping`,
`target-profile-mapping`, `straightline-code-requirement`, `static-resources`,
`grouping`. Each of these adaptors are discussed in detail below.

The parameter `target-def` is used to load configuration of QAT including all
adaptors and validations settings. This parameter is usful to create definitions
that can be used to target specific hardware without the need of providing an
exhaustive list of commandline arguments.

## Validating a QIR

Validating the QIR consists of two separate tasks: Validating that the QIR is
compliant with the profile specification and validating that the QIR only uses
the specified quantum instruction set.

### Target profile validation - Configuration for profile validation

Profile validation consists of confirming the compliance with required classical
behaviour. This includes options to define specific behaviours such as which
types are allowed, externally callable functions and use of poison and undef:

| Name                     | Description                                        | Default value | CLI |
| ------------------------ | -------------------------------------------------- | ------------- | --- |
| allow-internal-calls     | Whether or not internal calls are allowed.         | true          | Yes |
| allow-poison             | Whether or not poison values are allowed.          | true          | Yes |
| allow-undef              | Whether or not undef values are allowed.           | true          | Yes |
| opcodes                  | List of allowed opcodes                            |               | No  |
| allowlist-opcodes        | Whether or not to use allow list for op-codes.     |               | No  |
| allowlist-external-calls | Whether or not to use allow list external calls.   |               | No  |
| allowlist-pointer-types  | Whether or not to use allow list pointer types.    |               | No  |
| allow-primitive-return   | Whether or not primitive return types are allowed. |               | No  |
| allow-struct-return      | Whether or not struct return types are allowed.    |               | No  |
| allow-pointer-return     | Whether or not pointer return types are allowed.   |               | No  |
| external-calls           | Allowed external calls.                            |               | No  |
| allowed-pointer-types    | Allowed pointer types.                             |               | No  |

Not all of these are available through the CLI since they require a lot of data.
For instance, `opcodes` is only allowed to be specified through the config file,
since this is a list of objects.

### Target QIS validation - Configuration for QIS validation

Similar to the target profile validation, the target QIS validation deals with
the validation of the quantum instruction set (QIS). Specifically, these
settings are used to specify whether or not we require qubits and/or results to
be present in the IR and whether we allow all QIS, or only those which were
allowed listed:

| Name             | Description                                      | Default value | CLI |
| ---------------- | ------------------------------------------------ | ------------- | --- |
| allowed-any-qis  | Whether or not to allow any quantum instruction. | true          | Yes |
| requires-qubits  | Whether or not qubits are required in the IR.    | false         | Yes |
| requires-results | Whether or not results are required in the IR.   | false         | Yes |
| allowed-qis      | List of allowed QIS signatures                   |               | No  |

Like the target profile validator, the `allowed-qis` is only available through
the configuration file.

## Adaptors

In this section we discuss configuration of the available adaptors.

### Adaptor deactivation - Used to disable or enable adaptors

This configuration section allows the user to disable one or more adaptors. By
default all adaptors are activated. While this does not mean that they actively
perform any transformation of the IR, it does mean that the adaptor code is
loaded and that the adaptor will be operating in accordance with its settings.

The indiidual adaptors that can be disabled are listed here:

| Name                                    | Description                               | Default value |
| --------------------------------------- | ----------------------------------------- | ------------- |
| disable-replacement-linking             | Disables Replacement linking.             | false         |
| disable-llvm-optimization               | Disables LLVM optimizations.              | false         |
| disable-remove-non-entrypoint-functions | Disables Remove Non-Entrypoint Functions. | false         |
| disable-target-qis-mapping              | Disables Pass configuration.              | false         |
| disable-target-profile-mapping          | Disables Post-transform optimisation.     | false         |
| disable-straightline-code-requirement   | Disables Pre-transform validation.        | false         |
| disable-static-resources                | Disables Static resource manipulation.    | false         |
| disable-grouping                        | Disables QIS Grouping.                    | false         |

Note that some of these adaptors are not configurable. One such example is the
`remove-non-entrypoint-functions` which either is there or not. This particular
adaptor works is just a traditional LLVM pass, but is delivered as an adaptor
since QAT does not allow single passes to be added to the pipeline without an
adaptor to manage its configuration. Moreover, since the pass does not require
any configuration, its configuration section is empty.

### LLVM optimizations - Enables specific LLVM optimizations before and after transformation

The LLVM optimization adaptor runs provides selected LLVM passes to perform
traditional optimization tasks such as function inlining, loop unrolling, dead
code elimination, memory elimination and constant elimination. For each of these
passes, we provide a number of parameters that allows tuning of the individual
passes to the extend possible:

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

The purpose of this adaptor is to simplify the IR as much as possible prior to
targeting the IR. While we have taken great care to ensure that these passes act
predictably, note that there may be occasions where they produce a different IR
than that desired. One such example is promoting if-else statements to switch
statements where applicable. This is not always desirable since not all backends
has support for this.

### Target QIS mapping - Rules used to transform instruction sequences in the QIR

This adaptor transforms the QIR into a QIR that is targeted with respect to the
quantum instruction set. The adaptor provides a number of different
transformations including mapping dynamic qubit/result allocation into static
qubit/result allocation and optimize comparisons against constant quantum
results `Zero` and `One`:

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
| reuse-qubits                      | Use to define whether or not to reuse qubits.                                                         | false         |
| reuse-results                     | Use to define whether or not to reuse results.                                                        | false         |
| entry-point-attr                  | Specifies the attribute indicating the entry point.                                                   | EntryPoint    |

It is worth noting that the mapping of dynamic qubits to static qubits is
limited in scope and done as a best-effort. The reason for this limitation is
that there exists scenarios in which this mapping simply is not possible. One
such example is a recursive function that allocates one qubit for every
recursion and terminates at runtime given depth `N`.

There are a number of experimental features in this adaptor. To list these use
`qat -h --experimental`.

### Target profile mapping - Optimisations performed after

Like target QIS mapping, the target profile mapping maps known IR patterns into
other patterns. This adaptor only uses LLVM passes at the moment, but could be
extended using our pattern matching pass to accommodate special requirements.
Options as the moment are:

| Name                     | Description                                                                            | Default value |
| ------------------------ | -------------------------------------------------------------------------------------- | ------------- |
| lower-switch             | Lower switch statements.                                                               | true          |
| should-eliminate-zext-i1 | Replace zext instruction for i1 with select.                                           | true          |
| defer-measurements       | Whether measurement and recording functions should be moved to the end of the program. | false         |

We note that deferred measurements should be moved to the circuit separation
pass.

### Replacement linking - Conditionally replaces function calls

Replacement linking is an adaptor that enables replacement of functions subject
to the replacing function being present in the IR. As an example, imagine a
backend that implements an X gate but not a Z gate. A QIR that makes use of Z
gates would not run on said hardware unless we would map Z into the sequence HXH
where H is the Hadamard gate. The replacement linking adaptor allows us to
define a software implementation of Z in a separate library and use annotattions
on the Z gate function to replace the gate if a software implementation is
provided.

| Name                   | Description                 | Default value |
| ---------------------- | --------------------------- | ------------- |
| replace-functions      | Functions to be replaced.   |               |
| remove-call-attributes | Discard all call attributes | false         |

### Static resource adaptor - Manipulates statically allocated qubits and results

In case of a QIR that uses statically allocated qubits and/or results, the
static resource adaptor allows manipulation to achieve certain properties. One
such property is enforcing consecutive indexing starting 0 and another is the
ability to ensure that a new qubit is used whenever a reset occurs. The latter
garantuees that qubits are not reused within the lifetime of the program and is
a prerequisite for measurement at the end of the program execution.

| Name                      | Description                                                                | Default value |
| ------------------------- | -------------------------------------------------------------------------- | ------------- |
| annotate-qubit-use        | Annotate the number of qubits used                                         | true          |
| annotate-result-use       | Annotate the number of results used                                        | true          |
| annotate-max-qubit-index  | Annotate the maximum qubit index used                                      | true          |
| annotate-max-result-index | Annotate the maximum result index used                                     | true          |
| reindex-qubits            | Re-indexes statically allocated qubits with sequential ids starting from 0 | false         |
| replace-qubit-on-reset    | Replaces a qubit with new qubit if the qubit is reset                      | false         |
| inline-after-id-change    | Inlines instructions after id was changed                                  | true          |

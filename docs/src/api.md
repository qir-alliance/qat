# Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`namespace `[`microsoft::quantum`](#namespacemicrosoft_1_1quantum) | 
`namespace `[`microsoft::quantum::notation`](#namespacemicrosoft_1_1quantum_1_1notation) | Shorthand notations to make it easy and readible to create patterns.
`class `[`microsoft::quantum::ModuleLoader::SingleModuleTransformation`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation) | 
`struct `[`microsoft::quantum::BasicAllocationManager::AllocatedMemoryBlock`](#structmicrosoft_1_1quantum_1_1_basic_allocation_manager_1_1_allocated_memory_block) | Defines a named register/memory address segment with start position, end position and count. We think of the address space as a continuous sequence of spaces that can store values and we refer to a bounded continuous sequence memory addresses as a segment (or memory address segment):          start                   end
`struct `[`microsoft::quantum::LogCollection::Location`](#structmicrosoft_1_1quantum_1_1_log_collection_1_1_location) | Class that holds the location of where the incident happened.
`struct `[`microsoft::quantum::LogCollection::Message`](#structmicrosoft_1_1quantum_1_1_log_collection_1_1_message) | Struct to hold a message together with its type and location.
`struct `[`microsoft::quantum::ParameterParser::ParsedValue`](#structmicrosoft_1_1quantum_1_1_parameter_parser_1_1_parsed_value) | Struct that contains parsed and interpreted values of command line arguments.
`struct `[`microsoft::quantum::ConfigurationManager::Section`](#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section) | [Section](#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section) defines a section in the configuration. It holds the type of the configuration class, the name of the section a description, the instance of the configuration class itself and list of parameter bindings.

# namespace `microsoft::quantum` {#namespacemicrosoft_1_1quantum}

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`class `[`microsoft::quantum::BasicAllocationManager`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager) | AllocationManager is a simple qubit and results allocator that can be used at compile-time. It is based on an assumption that all qubit allocating function calls are inlined and that qubits/results can be allocated with strictly growing IDs.
`class `[`microsoft::quantum::IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager) | Interface class for allocation management. This interface provides means to allocate and release statically allocated resources such as qubits and results. In a future version, it may be extended with get and store in order to support Arrays and Tuples.
`class `[`microsoft::quantum::QatConfig`](#classmicrosoft_1_1quantum_1_1_qat_config) | Main configuration class for the qat command-line program.
`class `[`microsoft::quantum::ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind) | Generic implementation of the bind interface for different types. This class holds the name of the command line parameter and a reference variable corresponding to it. It implements serialisers and deserialisers to allow transforming strings to native values and vice versa.
`class `[`microsoft::quantum::ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager) | [ConfigurationManager](#classmicrosoft_1_1quantum_1_1_configuration_manager) is a class that holds a collection of configurations (sections). Each of these sections are embodied in their own class with a one-to-one mapping between configuration section and the configuration type. As an example, if one wishes to make a configuration for the class Foo, one would create a class FooConfig which would hold all the variables that are configurable and then add FooConfig to the [ConfigurationManager](#classmicrosoft_1_1quantum_1_1_configuration_manager) using `[addConfig()](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a26df4c5ae50f18bac796518303f8aa92)`. For FooConfig to fulfill the concept of a configuration, it must implement a setup functions whose first argument is the [ConfigurationManager](#classmicrosoft_1_1quantum_1_1_configuration_manager).
`class `[`microsoft::quantum::IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind) | Interface class to bind a variable to a configuration flag. This class provides the necessary interface to bind variables and populate their value based on given command-line arguments.
`class `[`microsoft::quantum::ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser) | Parameter parser class which allows the developer to specify a set of default settings and update those using the commandline argc and argv.
`class `[`microsoft::quantum::DefaultProfileGenerator`](#classmicrosoft_1_1quantum_1_1_default_profile_generator) | [DefaultProfileGenerator](#classmicrosoft_1_1quantum_1_1_default_profile_generator) defines a profile that configures the rule set used by the [Profile](#classmicrosoft_1_1quantum_1_1_profile) pass. This profile is useful for generating dynamic profiles and is well suited for testing purposes or YAML configured transformation of the IR.
`class `[`microsoft::quantum::LlvmPassesConfiguration`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration) | 
`class `[`microsoft::quantum::ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator) | 
`class `[`microsoft::quantum::CommentLogger`](#classmicrosoft_1_1quantum_1_1_comment_logger) | Concrete [ILogger](#classmicrosoft_1_1quantum_1_1_i_logger) implementation that prints all messages as IR comments to llvm::errs().
`class `[`microsoft::quantum::ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger) | Logger interface to allow the collection of different types of messages during QIR transformation and/or validation.
`class `[`microsoft::quantum::LogCollection`](#classmicrosoft_1_1quantum_1_1_log_collection) | Concrete [ILogger](#classmicrosoft_1_1quantum_1_1_i_logger) implementation that collects all messages and their corresponding location in a list that can be traversed later on.
`class `[`microsoft::quantum::ModuleLoader`](#classmicrosoft_1_1quantum_1_1_module_loader) | 
`class `[`microsoft::quantum::Profile`](#classmicrosoft_1_1quantum_1_1_profile) | [Profile](#classmicrosoft_1_1quantum_1_1_profile) class that defines a set of rules which constitutes the profile definition. Each of the rules can be used to transform a generic QIR and/or validate that the QIR is compliant with said rule.
`class `[`microsoft::quantum::RemoveDisallowedAttributesPass`](#classmicrosoft_1_1quantum_1_1_remove_disallowed_attributes_pass) | 
`class `[`microsoft::quantum::RuleFactory`](#classmicrosoft_1_1quantum_1_1_rule_factory) | Rule factory provides a high-level methods to build a rule set that enforces certain aspects of QIR transformation.
`class `[`microsoft::quantum::FactoryConfiguration`](#classmicrosoft_1_1quantum_1_1_factory_configuration) | 
`class `[`microsoft::quantum::IOperandPrototype`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype) | [IOperandPrototype](#classmicrosoft_1_1quantum_1_1_i_operand_prototype) describes an IR pattern and allows matching against LLVMs llvm::Value type. Each value may or may not be captured during the matching process which means that they are stored in a map under a given name. Capturing is enabled using `captureAs(name)` which sets the name the value should be stored under.
`class `[`microsoft::quantum::AnyPattern`](#classmicrosoft_1_1quantum_1_1_any_pattern) | Pattern that matches any operand.
`class `[`microsoft::quantum::CallPattern`](#classmicrosoft_1_1quantum_1_1_call_pattern) | 
`class `[`microsoft::quantum::StorePattern`](#classmicrosoft_1_1quantum_1_1_store_pattern) | 
`class `[`microsoft::quantum::LoadPattern`](#classmicrosoft_1_1quantum_1_1_load_pattern) | 
`class `[`microsoft::quantum::BitCastPattern`](#classmicrosoft_1_1quantum_1_1_bit_cast_pattern) | 
`class `[`microsoft::quantum::IntToPtrPattern`](#classmicrosoft_1_1quantum_1_1_int_to_ptr_pattern) | 
`class `[`microsoft::quantum::ConstIntPattern`](#classmicrosoft_1_1quantum_1_1_const_int_pattern) | 
`class `[`microsoft::quantum::BranchPattern`](#classmicrosoft_1_1quantum_1_1_branch_pattern) | 
`class `[`microsoft::quantum::SelectPattern`](#classmicrosoft_1_1quantum_1_1_select_pattern) | 
`class `[`microsoft::quantum::BasicBlockPattern`](#classmicrosoft_1_1quantum_1_1_basic_block_pattern) | 
`class `[`microsoft::quantum::SwitchPattern`](#classmicrosoft_1_1quantum_1_1_switch_pattern) | 
`class `[`microsoft::quantum::PhiPattern`](#classmicrosoft_1_1quantum_1_1_phi_pattern) | 
`class `[`microsoft::quantum::UnnamedInvokePattern`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern) | 
`class `[`microsoft::quantum::ReplacementRule`](#classmicrosoft_1_1quantum_1_1_replacement_rule) | Rule that describes a pattern and how to make a replacement of the matched values. The class contains a OperandPrototype which is used to test whether an LLVM IR value follows a specific pattern. The class also holds a function pointer to logic that allows replacement of the specified value.
`class `[`microsoft::quantum::RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set) | [RuleSet](#classmicrosoft_1_1quantum_1_1_rule_set) contains a set of replacement rules and the corresponding logic to apply the rules. The class allows one to apply the rules by which each rule is tested one-by-one until a successful attempt at performing a replace has happened, or the list was exhausted.
`class `[`microsoft::quantum::IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper) | 
`class `[`microsoft::quantum::TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass) | This class applies a set of transformation rules to the IR to transform it into a new IR. The rules are added using the [RuleSet](#classmicrosoft_1_1quantum_1_1_rule_set) class which allows the developer to create one or more rules on how to transform the IR.
`class `[`microsoft::quantum::TransformationRulesPassConfiguration`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration) | Configuration class for the RuleTransformation pass.
`class `[`microsoft::quantum::ValidationPass`](#classmicrosoft_1_1quantum_1_1_validation_pass) | 
`class `[`microsoft::quantum::ValidationPassConfiguration`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration) | 
`class `[`microsoft::quantum::Validator`](#classmicrosoft_1_1quantum_1_1_validator) | [Validator](#classmicrosoft_1_1quantum_1_1_validator) class that defines a set of rules which constitutes the profile definition. Each of the rules can be used to transform a generic QIR and/or validate that the QIR is compliant with said rule.

## class `microsoft::quantum::BasicAllocationManager` {#classmicrosoft_1_1quantum_1_1_basic_allocation_manager}

```
class microsoft::quantum::BasicAllocationManager
  : public microsoft::quantum::IAllocationManager
```

AllocationManager is a simple qubit and results allocator that can be used at compile-time. It is based on an assumption that all qubit allocating function calls are inlined and that qubits/results can be allocated with strictly growing IDs.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public virtual `[`Address`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1abf24411fc914344277ef965d27112b18)` `[`allocate`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1aa6eff65c005184b4f42402c4d10abf0e)`(String const & name,`[`Index`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a8b959912df70a013f90086320202f833)` const & count)` | Allocates a possibly named segment of a given count. Calling allocate without and arguments allocates a single anonymous resource and returns the address. In case of a larger segment, the function returns the address pointing to the first element. Allocation is guaranteed to be sequential.
`public virtual void `[`release`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a11c187cae2ab95bb7455b8cbba5ec31a)`(`[`Address`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1abf24411fc914344277ef965d27112b18)` const & address)` | Releases the segment by address.
`public virtual void `[`reset`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a264bece62aef1a34fd44f9a31a4cc1f7)`()` | Resets the allocation manager and all its statistics.
`public void `[`setReuseRegisters`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a9da0b491a9905108ac5272b8ce77c4da)`(bool val)` | Configuration function to set mode of qubit allocation. If function argument is true, the allocation manager will reuse qubits.
`typedef `[`Mappings`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a5745fc89f2ee86a2c4eb06f3ab18cd81) | Vector of memory segments.
`typedef `[`BasicAllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1ab2a8de7c7e97d8d6215ce9a9ab33efb8) | Allocator pointer type.
`private `[`Index`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a8b959912df70a013f90086320202f833)` `[`next_qubit_index_`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a30e5762f371872889ad4c9b94634ef84) | Variable to keep track of the next qubit to be allocated.
`private `[`Mappings`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a5745fc89f2ee86a2c4eb06f3ab18cd81)` `[`mappings_`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a3c19ab0794038faca7938067e32e1044) | Each allocation has a register/memory mapping which keeps track of the allocation index, the segment count and its name (if any).
`private `[`Index`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a8b959912df70a013f90086320202f833)` `[`allocation_index_`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a753c355029564baad30e65463237e66d) | 
`private bool `[`reuse_qubits_`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a39aa4f5770f4ec8833bf5a23d167e0a2) | Whether or not to reuse qubits.
`private  `[`BasicAllocationManager`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a89f658a262734938a4a0bdc3d65da1f3)`() = default` | Public construction of this object is only allowed as a shared pointer. To create a new AllocationManager, use AllocationManager::createNew().
`public static `[`BasicAllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1ab2a8de7c7e97d8d6215ce9a9ab33efb8)` `[`createNew`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1adfbd5dd1597bf34ed173f303618f9453)`()` | Creates a new allocation manager. The manager is kept as a shared pointer to enable allocation across different passes and/or replacement rules.

### Members

#### `public virtual `[`Address`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1abf24411fc914344277ef965d27112b18)` `[`allocate`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1aa6eff65c005184b4f42402c4d10abf0e)`(String const & name,`[`Index`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a8b959912df70a013f90086320202f833)` const & count)` {#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1aa6eff65c005184b4f42402c4d10abf0e}

Allocates a possibly named segment of a given count. Calling allocate without and arguments allocates a single anonymous resource and returns the address. In case of a larger segment, the function returns the address pointing to the first element. Allocation is guaranteed to be sequential.

#### `public virtual void `[`release`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a11c187cae2ab95bb7455b8cbba5ec31a)`(`[`Address`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1abf24411fc914344277ef965d27112b18)` const & address)` {#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a11c187cae2ab95bb7455b8cbba5ec31a}

Releases the segment by address.

#### `public virtual void `[`reset`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a264bece62aef1a34fd44f9a31a4cc1f7)`()` {#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a264bece62aef1a34fd44f9a31a4cc1f7}

Resets the allocation manager and all its statistics.

#### `public void `[`setReuseRegisters`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a9da0b491a9905108ac5272b8ce77c4da)`(bool val)` {#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a9da0b491a9905108ac5272b8ce77c4da}

Configuration function to set mode of qubit allocation. If function argument is true, the allocation manager will reuse qubits.

#### `typedef `[`Mappings`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a5745fc89f2ee86a2c4eb06f3ab18cd81) {#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a5745fc89f2ee86a2c4eb06f3ab18cd81}

Vector of memory segments.

#### `typedef `[`BasicAllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1ab2a8de7c7e97d8d6215ce9a9ab33efb8) {#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1ab2a8de7c7e97d8d6215ce9a9ab33efb8}

Allocator pointer type.

#### `private `[`Index`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a8b959912df70a013f90086320202f833)` `[`next_qubit_index_`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a30e5762f371872889ad4c9b94634ef84) {#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a30e5762f371872889ad4c9b94634ef84}

Variable to keep track of the next qubit to be allocated.

#### `private `[`Mappings`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a5745fc89f2ee86a2c4eb06f3ab18cd81)` `[`mappings_`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a3c19ab0794038faca7938067e32e1044) {#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a3c19ab0794038faca7938067e32e1044}

Each allocation has a register/memory mapping which keeps track of the allocation index, the segment count and its name (if any).

#### `private `[`Index`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a8b959912df70a013f90086320202f833)` `[`allocation_index_`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a753c355029564baad30e65463237e66d) {#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a753c355029564baad30e65463237e66d}

#### `private bool `[`reuse_qubits_`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a39aa4f5770f4ec8833bf5a23d167e0a2) {#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a39aa4f5770f4ec8833bf5a23d167e0a2}

Whether or not to reuse qubits.

#### `private  `[`BasicAllocationManager`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a89f658a262734938a4a0bdc3d65da1f3)`() = default` {#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1a89f658a262734938a4a0bdc3d65da1f3}

Public construction of this object is only allowed as a shared pointer. To create a new AllocationManager, use AllocationManager::createNew().

#### `public static `[`BasicAllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1ab2a8de7c7e97d8d6215ce9a9ab33efb8)` `[`createNew`](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1adfbd5dd1597bf34ed173f303618f9453)`()` {#classmicrosoft_1_1quantum_1_1_basic_allocation_manager_1adfbd5dd1597bf34ed173f303618f9453}

Creates a new allocation manager. The manager is kept as a shared pointer to enable allocation across different passes and/or replacement rules.

## class `microsoft::quantum::IAllocationManager` {#classmicrosoft_1_1quantum_1_1_i_allocation_manager}

Interface class for allocation management. This interface provides means to allocate and release statically allocated resources such as qubits and results. In a future version, it may be extended with get and store in order to support Arrays and Tuples.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1afe2f09c01ee0cf4312ba249fba743826)`(`[`IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager)` const &) = delete` | 
`public  `[`IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a563e54784aa25d9af5a27d9db84cd4f5)`(`[`IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager)` &&) = delete` | 
`public `[`IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a81ca574ab646c14ca8a7995558f3c503)`(`[`IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager)` const &) = delete` | 
`public `[`IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a86f9df1c929eec9cff34ad6ae2e96a90)`(`[`IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager)` &&) = delete` | 
`public virtual  `[`~IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1af0c9a4cf370d3d2bd7932c3af24b8584)`()` | 
`public `[`Address`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1abf24411fc914344277ef965d27112b18)` `[`allocate`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a0477e1fd52989e76d877dc7329f7ce3d)`(String const & name,`[`Index`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a8b959912df70a013f90086320202f833)` const & count)` | Abstract member function to allocate an element or sequence of elements. The developer should not assume continuity of the address segment as this is not guaranteed. Note this function may throw if allocation is not possible.
`public void `[`release`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a0fcd1d870506fb163d70c63cc865cb06)`(`[`Address`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1abf24411fc914344277ef965d27112b18)` const & address)` | Abstract member function to release a previously allocated function. Note this function may throw if an invalid address is passed.
`public void `[`reset`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1ae53a2911903febc00fb6a9139ef247af)`()` | Abstract member function to reset the allocation manager. This function clears all allocations and resets all statistics.
`public uint64_t `[`allocationsInUse`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a7c2530c73296df6cf87ff54dc9c6509c)`() const` | Current number of registers in use. This function is used to inquire about the current number registers/resources in use.
`public uint64_t `[`maxAllocationsUsed`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a6b70408d5752024218c5dbc7cc88a2b1)`() const` | Maximum number of registers in use at any one time. The maximum number of registers used at any one time. As an example of usage, this function is useful to calculate the total number of qubits required to execute the entry function.
`protected  `[`IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a7e7355f5d220774b4ac4b93227f1c215)`() = default` | 
`protected void `[`updateRegistersInUse`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1ac135ced7582a21cdb00ab4704f78c988)`(uint64_t n)` | 
`typedef `[`Address`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1abf24411fc914344277ef965d27112b18) | Value type for address.
`typedef `[`Index`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a8b959912df70a013f90086320202f833) | Index type used to access an array element.
`typedef `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a7c77d7b2d94d3b6a98bb5402a854cca4) | Pointer interface.
`private uint64_t `[`registers_in_use_`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a701b23ea261abe369472f06bb5622aaf) | Used to track the number of registers in use.
`private uint64_t `[`max_registers_used_`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a3b015daabc5ca30e78ef3f3489bff9ea) | Used to track the max number of registers used.

### Members

#### `public  `[`IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1afe2f09c01ee0cf4312ba249fba743826)`(`[`IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1afe2f09c01ee0cf4312ba249fba743826}

#### `public  `[`IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a563e54784aa25d9af5a27d9db84cd4f5)`(`[`IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager)` &&) = delete` {#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a563e54784aa25d9af5a27d9db84cd4f5}

#### `public `[`IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a81ca574ab646c14ca8a7995558f3c503)`(`[`IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a81ca574ab646c14ca8a7995558f3c503}

#### `public `[`IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a86f9df1c929eec9cff34ad6ae2e96a90)`(`[`IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager)` &&) = delete` {#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a86f9df1c929eec9cff34ad6ae2e96a90}

#### `public virtual  `[`~IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1af0c9a4cf370d3d2bd7932c3af24b8584)`()` {#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1af0c9a4cf370d3d2bd7932c3af24b8584}

#### `public `[`Address`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1abf24411fc914344277ef965d27112b18)` `[`allocate`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a0477e1fd52989e76d877dc7329f7ce3d)`(String const & name,`[`Index`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a8b959912df70a013f90086320202f833)` const & count)` {#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a0477e1fd52989e76d877dc7329f7ce3d}

Abstract member function to allocate an element or sequence of elements. The developer should not assume continuity of the address segment as this is not guaranteed. Note this function may throw if allocation is not possible.

#### `public void `[`release`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a0fcd1d870506fb163d70c63cc865cb06)`(`[`Address`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1abf24411fc914344277ef965d27112b18)` const & address)` {#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a0fcd1d870506fb163d70c63cc865cb06}

Abstract member function to release a previously allocated function. Note this function may throw if an invalid address is passed.

#### `public void `[`reset`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1ae53a2911903febc00fb6a9139ef247af)`()` {#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1ae53a2911903febc00fb6a9139ef247af}

Abstract member function to reset the allocation manager. This function clears all allocations and resets all statistics.

#### `public uint64_t `[`allocationsInUse`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a7c2530c73296df6cf87ff54dc9c6509c)`() const` {#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a7c2530c73296df6cf87ff54dc9c6509c}

Current number of registers in use. This function is used to inquire about the current number registers/resources in use.

#### `public uint64_t `[`maxAllocationsUsed`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a6b70408d5752024218c5dbc7cc88a2b1)`() const` {#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a6b70408d5752024218c5dbc7cc88a2b1}

Maximum number of registers in use at any one time. The maximum number of registers used at any one time. As an example of usage, this function is useful to calculate the total number of qubits required to execute the entry function.

#### `protected  `[`IAllocationManager`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a7e7355f5d220774b4ac4b93227f1c215)`() = default` {#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a7e7355f5d220774b4ac4b93227f1c215}

#### `protected void `[`updateRegistersInUse`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1ac135ced7582a21cdb00ab4704f78c988)`(uint64_t n)` {#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1ac135ced7582a21cdb00ab4704f78c988}

#### `typedef `[`Address`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1abf24411fc914344277ef965d27112b18) {#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1abf24411fc914344277ef965d27112b18}

Value type for address.

#### `typedef `[`Index`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a8b959912df70a013f90086320202f833) {#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a8b959912df70a013f90086320202f833}

Index type used to access an array element.

#### `typedef `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a7c77d7b2d94d3b6a98bb5402a854cca4) {#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a7c77d7b2d94d3b6a98bb5402a854cca4}

Pointer interface.

#### `private uint64_t `[`registers_in_use_`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a701b23ea261abe369472f06bb5622aaf) {#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a701b23ea261abe369472f06bb5622aaf}

Used to track the number of registers in use.

#### `private uint64_t `[`max_registers_used_`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a3b015daabc5ca30e78ef3f3489bff9ea) {#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a3b015daabc5ca30e78ef3f3489bff9ea}

Used to track the max number of registers used.

## class `microsoft::quantum::QatConfig` {#classmicrosoft_1_1quantum_1_1_qat_config}

Main configuration class for the qat command-line program.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public void `[`setup`](#classmicrosoft_1_1quantum_1_1_qat_config_1a3453916656ed32adc70d0e16ea9f8ff2)`(`[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` & config)` | Setup function that binds instance variables to the command-line/configuration entries. This function also provide descriptions of each of the properties below.
`public String `[`load`](#classmicrosoft_1_1quantum_1_1_qat_config_1a73a541e8890c7ed75d2aec2df80effd1)`() const` | List of dynamic libraries to load.
`public bool `[`shouldGenerate`](#classmicrosoft_1_1quantum_1_1_qat_config_1ab86a6de025d87d49c79463d91ba6b1fb)`() const` | Flag that indicates whether or not we are generating a new QIR by applying a profile.
`public bool `[`verifyModule`](#classmicrosoft_1_1quantum_1_1_qat_config_1ab771ab8819977883ff040ba696944a91)`() const` | Flag to indicate whether or not to verify that the (Q)IR is a valid LLVM IR.
`public bool `[`shouldValidate`](#classmicrosoft_1_1quantum_1_1_qat_config_1a5e52d30213e859ac0f6c092739f7a76f)`() const` | Flag to indicate whether or not to validate the compliance with the QIR profile.
`public String `[`profile`](#classmicrosoft_1_1quantum_1_1_qat_config_1a8471474e4cd2ed108c1b2fa8a43b6be1)`() const` | String to request a specific profile name. Default is base.
`public bool `[`shouldEmitLlvm`](#classmicrosoft_1_1quantum_1_1_qat_config_1a9c1e8c39ad5357fdce6d78958edf5734)`() const` | Indicates whether or not the QIR adaptor tool should emit LLVM IR to the standard output.
`public bool `[`isOpt0Enabled`](#classmicrosoft_1_1quantum_1_1_qat_config_1a661187744fb869aac04c61a1b891ef4a)`() const` | Tells if the optimisation level 0 is enabled. Note higher OX override lower ones.
`public bool `[`isOpt1Enabled`](#classmicrosoft_1_1quantum_1_1_qat_config_1a18b7791a32761b123d41e978b22bace2)`() const` | Tells if the optimisation level 1 is enabled. Note higher OX override lower ones.
`public bool `[`isOpt2Enabled`](#classmicrosoft_1_1quantum_1_1_qat_config_1ab90482eeb3f65c1615de6190d2f397f6)`() const` | Tells if the optimisation level 2 is enabled. Note higher OX override lower ones.
`public bool `[`isOpt3Enabled`](#classmicrosoft_1_1quantum_1_1_qat_config_1aaee0c9d224c6c35685cfbc876cf1c33b)`() const` | Tells if the optimisation level 3 is enabled. Note higher OX override lower ones.
`public bool `[`isDebugMode`](#classmicrosoft_1_1quantum_1_1_qat_config_1a4759429710fdce34260511cefdce97c3)`() const` | Enables debug output.
`public bool `[`shouldDumpConfig`](#classmicrosoft_1_1quantum_1_1_qat_config_1a125ccb99efb430e7ac9169058066c724)`() const` | Request the full configuration to be dumped to the screen.
`private String `[`load_`](#classmicrosoft_1_1quantum_1_1_qat_config_1a91faee45348489f2215cbfa11bc43019) | 
`private bool `[`generate_`](#classmicrosoft_1_1quantum_1_1_qat_config_1ab17c42cbb679a537ec0e6c1fc3e924f6) | 
`private bool `[`validate_`](#classmicrosoft_1_1quantum_1_1_qat_config_1a7226beebeae29c70f01e6dc331eddc81) | 
`private String `[`profile_`](#classmicrosoft_1_1quantum_1_1_qat_config_1a47d998af25ec5c06f3bca65a9ce8154b) | 
`private bool `[`emit_llvm_`](#classmicrosoft_1_1quantum_1_1_qat_config_1a6efd888d4abe462700262ee12e550444) | 
`private bool `[`opt0_`](#classmicrosoft_1_1quantum_1_1_qat_config_1abcbb79bf5d4d7df71531aca85b94ab61) | 
`private bool `[`opt1_`](#classmicrosoft_1_1quantum_1_1_qat_config_1a30b3a68d4498d0a2bd8a715010c482a8) | 
`private bool `[`opt2_`](#classmicrosoft_1_1quantum_1_1_qat_config_1a50e79c9388340fb4c0a0d8c5f1f43a62) | 
`private bool `[`opt3_`](#classmicrosoft_1_1quantum_1_1_qat_config_1a6c228a9c86d12a046c90ba1bb2b740e8) | 
`private bool `[`verify_module_`](#classmicrosoft_1_1quantum_1_1_qat_config_1a1296f13fbf364b2616d3ec369e29a190) | 
`private bool `[`debug_`](#classmicrosoft_1_1quantum_1_1_qat_config_1ad1306d2947481e57c34008cb2cff265c) | 
`private bool `[`dump_config_`](#classmicrosoft_1_1quantum_1_1_qat_config_1a367e8e2d039e15e414e6a0d66cc5082e) | 

### Members

#### `public void `[`setup`](#classmicrosoft_1_1quantum_1_1_qat_config_1a3453916656ed32adc70d0e16ea9f8ff2)`(`[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` & config)` {#classmicrosoft_1_1quantum_1_1_qat_config_1a3453916656ed32adc70d0e16ea9f8ff2}

Setup function that binds instance variables to the command-line/configuration entries. This function also provide descriptions of each of the properties below.

#### `public String `[`load`](#classmicrosoft_1_1quantum_1_1_qat_config_1a73a541e8890c7ed75d2aec2df80effd1)`() const` {#classmicrosoft_1_1quantum_1_1_qat_config_1a73a541e8890c7ed75d2aec2df80effd1}

List of dynamic libraries to load.

#### `public bool `[`shouldGenerate`](#classmicrosoft_1_1quantum_1_1_qat_config_1ab86a6de025d87d49c79463d91ba6b1fb)`() const` {#classmicrosoft_1_1quantum_1_1_qat_config_1ab86a6de025d87d49c79463d91ba6b1fb}

Flag that indicates whether or not we are generating a new QIR by applying a profile.

#### `public bool `[`verifyModule`](#classmicrosoft_1_1quantum_1_1_qat_config_1ab771ab8819977883ff040ba696944a91)`() const` {#classmicrosoft_1_1quantum_1_1_qat_config_1ab771ab8819977883ff040ba696944a91}

Flag to indicate whether or not to verify that the (Q)IR is a valid LLVM IR.

#### `public bool `[`shouldValidate`](#classmicrosoft_1_1quantum_1_1_qat_config_1a5e52d30213e859ac0f6c092739f7a76f)`() const` {#classmicrosoft_1_1quantum_1_1_qat_config_1a5e52d30213e859ac0f6c092739f7a76f}

Flag to indicate whether or not to validate the compliance with the QIR profile.

#### `public String `[`profile`](#classmicrosoft_1_1quantum_1_1_qat_config_1a8471474e4cd2ed108c1b2fa8a43b6be1)`() const` {#classmicrosoft_1_1quantum_1_1_qat_config_1a8471474e4cd2ed108c1b2fa8a43b6be1}

String to request a specific profile name. Default is base.

#### `public bool `[`shouldEmitLlvm`](#classmicrosoft_1_1quantum_1_1_qat_config_1a9c1e8c39ad5357fdce6d78958edf5734)`() const` {#classmicrosoft_1_1quantum_1_1_qat_config_1a9c1e8c39ad5357fdce6d78958edf5734}

Indicates whether or not the QIR adaptor tool should emit LLVM IR to the standard output.

#### `public bool `[`isOpt0Enabled`](#classmicrosoft_1_1quantum_1_1_qat_config_1a661187744fb869aac04c61a1b891ef4a)`() const` {#classmicrosoft_1_1quantum_1_1_qat_config_1a661187744fb869aac04c61a1b891ef4a}

Tells if the optimisation level 0 is enabled. Note higher OX override lower ones.

#### `public bool `[`isOpt1Enabled`](#classmicrosoft_1_1quantum_1_1_qat_config_1a18b7791a32761b123d41e978b22bace2)`() const` {#classmicrosoft_1_1quantum_1_1_qat_config_1a18b7791a32761b123d41e978b22bace2}

Tells if the optimisation level 1 is enabled. Note higher OX override lower ones.

#### `public bool `[`isOpt2Enabled`](#classmicrosoft_1_1quantum_1_1_qat_config_1ab90482eeb3f65c1615de6190d2f397f6)`() const` {#classmicrosoft_1_1quantum_1_1_qat_config_1ab90482eeb3f65c1615de6190d2f397f6}

Tells if the optimisation level 2 is enabled. Note higher OX override lower ones.

#### `public bool `[`isOpt3Enabled`](#classmicrosoft_1_1quantum_1_1_qat_config_1aaee0c9d224c6c35685cfbc876cf1c33b)`() const` {#classmicrosoft_1_1quantum_1_1_qat_config_1aaee0c9d224c6c35685cfbc876cf1c33b}

Tells if the optimisation level 3 is enabled. Note higher OX override lower ones.

#### `public bool `[`isDebugMode`](#classmicrosoft_1_1quantum_1_1_qat_config_1a4759429710fdce34260511cefdce97c3)`() const` {#classmicrosoft_1_1quantum_1_1_qat_config_1a4759429710fdce34260511cefdce97c3}

Enables debug output.

#### `public bool `[`shouldDumpConfig`](#classmicrosoft_1_1quantum_1_1_qat_config_1a125ccb99efb430e7ac9169058066c724)`() const` {#classmicrosoft_1_1quantum_1_1_qat_config_1a125ccb99efb430e7ac9169058066c724}

Request the full configuration to be dumped to the screen.

#### `private String `[`load_`](#classmicrosoft_1_1quantum_1_1_qat_config_1a91faee45348489f2215cbfa11bc43019) {#classmicrosoft_1_1quantum_1_1_qat_config_1a91faee45348489f2215cbfa11bc43019}

#### `private bool `[`generate_`](#classmicrosoft_1_1quantum_1_1_qat_config_1ab17c42cbb679a537ec0e6c1fc3e924f6) {#classmicrosoft_1_1quantum_1_1_qat_config_1ab17c42cbb679a537ec0e6c1fc3e924f6}

#### `private bool `[`validate_`](#classmicrosoft_1_1quantum_1_1_qat_config_1a7226beebeae29c70f01e6dc331eddc81) {#classmicrosoft_1_1quantum_1_1_qat_config_1a7226beebeae29c70f01e6dc331eddc81}

#### `private String `[`profile_`](#classmicrosoft_1_1quantum_1_1_qat_config_1a47d998af25ec5c06f3bca65a9ce8154b) {#classmicrosoft_1_1quantum_1_1_qat_config_1a47d998af25ec5c06f3bca65a9ce8154b}

#### `private bool `[`emit_llvm_`](#classmicrosoft_1_1quantum_1_1_qat_config_1a6efd888d4abe462700262ee12e550444) {#classmicrosoft_1_1quantum_1_1_qat_config_1a6efd888d4abe462700262ee12e550444}

#### `private bool `[`opt0_`](#classmicrosoft_1_1quantum_1_1_qat_config_1abcbb79bf5d4d7df71531aca85b94ab61) {#classmicrosoft_1_1quantum_1_1_qat_config_1abcbb79bf5d4d7df71531aca85b94ab61}

#### `private bool `[`opt1_`](#classmicrosoft_1_1quantum_1_1_qat_config_1a30b3a68d4498d0a2bd8a715010c482a8) {#classmicrosoft_1_1quantum_1_1_qat_config_1a30b3a68d4498d0a2bd8a715010c482a8}

#### `private bool `[`opt2_`](#classmicrosoft_1_1quantum_1_1_qat_config_1a50e79c9388340fb4c0a0d8c5f1f43a62) {#classmicrosoft_1_1quantum_1_1_qat_config_1a50e79c9388340fb4c0a0d8c5f1f43a62}

#### `private bool `[`opt3_`](#classmicrosoft_1_1quantum_1_1_qat_config_1a6c228a9c86d12a046c90ba1bb2b740e8) {#classmicrosoft_1_1quantum_1_1_qat_config_1a6c228a9c86d12a046c90ba1bb2b740e8}

#### `private bool `[`verify_module_`](#classmicrosoft_1_1quantum_1_1_qat_config_1a1296f13fbf364b2616d3ec369e29a190) {#classmicrosoft_1_1quantum_1_1_qat_config_1a1296f13fbf364b2616d3ec369e29a190}

#### `private bool `[`debug_`](#classmicrosoft_1_1quantum_1_1_qat_config_1ad1306d2947481e57c34008cb2cff265c) {#classmicrosoft_1_1quantum_1_1_qat_config_1ad1306d2947481e57c34008cb2cff265c}

#### `private bool `[`dump_config_`](#classmicrosoft_1_1quantum_1_1_qat_config_1a367e8e2d039e15e414e6a0d66cc5082e) {#classmicrosoft_1_1quantum_1_1_qat_config_1a367e8e2d039e15e414e6a0d66cc5082e}

## class `microsoft::quantum::ConfigBind` {#classmicrosoft_1_1quantum_1_1_config_bind}

```
class microsoft::quantum::ConfigBind
  : public microsoft::quantum::IConfigBind
```

Generic implementation of the bind interface for different types. This class holds the name of the command line parameter and a reference variable corresponding to it. It implements serialisers and deserialisers to allow transforming strings to native values and vice versa.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind_1add72d6ec0b9c45ba77ab6a09fc8fdb64)`() = delete` | 
`public  `[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind_1a3c94547061224e639410f1a9f1aad7d5)`(`[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind)` const &) = delete` | 
`public  `[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind_1a8101db17a9cdd06af800d4dfde69429b)`(`[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind)` &&) = delete` | 
`public `[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_config_bind_1aa9e6d006f4cf1f84c37e12db08bf4f6f)`(`[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind)` const &) = delete` | 
`public `[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_config_bind_1af9aa44e312eee794fd285e08ff3c5a1f)`(`[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind)` &&) = delete` | 
`public  `[`~ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind_1a34ce40d1f7ce30de6a89e0b92361facb)`() = default` | 
`public  `[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind_1a2def0c5e98c88c3d42a69bed7576531b)`(Type & bind,T default_value,String const & name,String const & description)` | Constructor to bind value to parameter. This class holds a reference to a variable together with the name it is expected to have when passed through the parameter parser.
`public virtual bool `[`setupArguments`](#classmicrosoft_1_1quantum_1_1_config_bind_1a982835cd6cae95c8212bad2b1784a8aa)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` & parser)` | Adds the argument to the parser.
`public virtual bool `[`configure`](#classmicrosoft_1_1quantum_1_1_config_bind_1a76d719752f3842a2358e320dd1ae36d1)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` const & parser)` | Configures the bound value. This method examines the parsed input and use updates the bound value accordingly.
`public virtual String `[`value`](#classmicrosoft_1_1quantum_1_1_config_bind_1af0690262d2d2d5ffefa00637e8b28d6e)`()` | String representation of the bound value.
`typedef `[`Type`](#classmicrosoft_1_1quantum_1_1_config_bind_1a34ce5439e320211aa46f8e19d69ef005) | 
`typedef `[`EnableIf`](#classmicrosoft_1_1quantum_1_1_config_bind_1a1ed6bdd7a038383a0e05092e2db38dc2) | Helper template to conditionally disable implementation unless a specific type is used.
`private Type & `[`bind_`](#classmicrosoft_1_1quantum_1_1_config_bind_1adb5f78032f7ff3a25ebfce01722248fd) | Bound variable to be updated.
`private Type `[`default_value_`](#classmicrosoft_1_1quantum_1_1_config_bind_1adf3bf81ad0af724a356c3a7cf748961b) | Default value.
`private template<>`  <br/>`bool `[`setupArguments`](#classmicrosoft_1_1quantum_1_1_config_bind_1a03c3168509e9de32089d771495a44569)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` &,R const &)` | Generic function to setup arguments of any type.
`private bool `[`setupArguments`](#classmicrosoft_1_1quantum_1_1_config_bind_1adafa765a888b90743bb8bb580f4c918b)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` & parser,bool const &)` | Specialised function setting arguments up for booleans.
`private template<>`  <br/>`void `[`alterNameBasedOnType`](#classmicrosoft_1_1quantum_1_1_config_bind_1a5db8c4c39dfa20601d8e58347fc38c59)`(R const & default_value)` | Generic function that changes the parameter name based on the value type and default value.
`private void `[`alterNameBasedOnType`](#classmicrosoft_1_1quantum_1_1_config_bind_1a019a0e9aa950c8bd42c4eacced067c2b)`(bool const & default_value)` | Specialised function that changes the parameter name based on default value for booleans.
`private template<>`  <br/>`String `[`valueAsString`](#classmicrosoft_1_1quantum_1_1_config_bind_1a98323b299e3d27dec347ccd309f3b200)`(A const &)` | Generic string serialization.
`private template<>`  <br/>`String `[`valueAsString`](#classmicrosoft_1_1quantum_1_1_config_bind_1a7e33292902037a5a90e3d4e3ce8755d5)`(`[`EnableIf`](#classmicrosoft_1_1quantum_1_1_config_bind_1a1ed6bdd7a038383a0e05092e2db38dc2)`< A, bool, A > const &)` | Specialised serialization for booleans.
`private template<>`  <br/>`void `[`loadValue`](#classmicrosoft_1_1quantum_1_1_config_bind_1a5cbd568fff11a1c40158fa03122688e5)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` const & parser,R const & default_value)` | Generic deserialization of string values from parser.
`private template<>`  <br/>`void `[`loadValue`](#classmicrosoft_1_1quantum_1_1_config_bind_1ae4b367794d58331a4d11cc0629a1f0b0)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` const & parser,`[`EnableIf`](#classmicrosoft_1_1quantum_1_1_config_bind_1a1ed6bdd7a038383a0e05092e2db38dc2)`< A, bool, A > const & default_value)` | Specialised deserialization of string values from parser for booleans.
`private template<>`  <br/>`void `[`loadValue`](#classmicrosoft_1_1quantum_1_1_config_bind_1a07acf17c320eb3289b9b662f16bab122)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` const & parser,`[`EnableIf`](#classmicrosoft_1_1quantum_1_1_config_bind_1a1ed6bdd7a038383a0e05092e2db38dc2)`< A, String, A > const & default_value)` | Specialised deserialization of string values from parser for strings.

### Members

#### `public  `[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind_1add72d6ec0b9c45ba77ab6a09fc8fdb64)`() = delete` {#classmicrosoft_1_1quantum_1_1_config_bind_1add72d6ec0b9c45ba77ab6a09fc8fdb64}

#### `public  `[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind_1a3c94547061224e639410f1a9f1aad7d5)`(`[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_config_bind_1a3c94547061224e639410f1a9f1aad7d5}

#### `public  `[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind_1a8101db17a9cdd06af800d4dfde69429b)`(`[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind)` &&) = delete` {#classmicrosoft_1_1quantum_1_1_config_bind_1a8101db17a9cdd06af800d4dfde69429b}

#### `public `[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_config_bind_1aa9e6d006f4cf1f84c37e12db08bf4f6f)`(`[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_config_bind_1aa9e6d006f4cf1f84c37e12db08bf4f6f}

#### `public `[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_config_bind_1af9aa44e312eee794fd285e08ff3c5a1f)`(`[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind)` &&) = delete` {#classmicrosoft_1_1quantum_1_1_config_bind_1af9aa44e312eee794fd285e08ff3c5a1f}

#### `public  `[`~ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind_1a34ce40d1f7ce30de6a89e0b92361facb)`() = default` {#classmicrosoft_1_1quantum_1_1_config_bind_1a34ce40d1f7ce30de6a89e0b92361facb}

#### `public  `[`ConfigBind`](#classmicrosoft_1_1quantum_1_1_config_bind_1a2def0c5e98c88c3d42a69bed7576531b)`(Type & bind,T default_value,String const & name,String const & description)` {#classmicrosoft_1_1quantum_1_1_config_bind_1a2def0c5e98c88c3d42a69bed7576531b}

Constructor to bind value to parameter. This class holds a reference to a variable together with the name it is expected to have when passed through the parameter parser.

#### `public virtual bool `[`setupArguments`](#classmicrosoft_1_1quantum_1_1_config_bind_1a982835cd6cae95c8212bad2b1784a8aa)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` & parser)` {#classmicrosoft_1_1quantum_1_1_config_bind_1a982835cd6cae95c8212bad2b1784a8aa}

Adds the argument to the parser.

#### `public virtual bool `[`configure`](#classmicrosoft_1_1quantum_1_1_config_bind_1a76d719752f3842a2358e320dd1ae36d1)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` const & parser)` {#classmicrosoft_1_1quantum_1_1_config_bind_1a76d719752f3842a2358e320dd1ae36d1}

Configures the bound value. This method examines the parsed input and use updates the bound value accordingly.

#### `public virtual String `[`value`](#classmicrosoft_1_1quantum_1_1_config_bind_1af0690262d2d2d5ffefa00637e8b28d6e)`()` {#classmicrosoft_1_1quantum_1_1_config_bind_1af0690262d2d2d5ffefa00637e8b28d6e}

String representation of the bound value.

#### `typedef `[`Type`](#classmicrosoft_1_1quantum_1_1_config_bind_1a34ce5439e320211aa46f8e19d69ef005) {#classmicrosoft_1_1quantum_1_1_config_bind_1a34ce5439e320211aa46f8e19d69ef005}

#### `typedef `[`EnableIf`](#classmicrosoft_1_1quantum_1_1_config_bind_1a1ed6bdd7a038383a0e05092e2db38dc2) {#classmicrosoft_1_1quantum_1_1_config_bind_1a1ed6bdd7a038383a0e05092e2db38dc2}

Helper template to conditionally disable implementation unless a specific type is used.

#### `private Type & `[`bind_`](#classmicrosoft_1_1quantum_1_1_config_bind_1adb5f78032f7ff3a25ebfce01722248fd) {#classmicrosoft_1_1quantum_1_1_config_bind_1adb5f78032f7ff3a25ebfce01722248fd}

Bound variable to be updated.

#### `private Type `[`default_value_`](#classmicrosoft_1_1quantum_1_1_config_bind_1adf3bf81ad0af724a356c3a7cf748961b) {#classmicrosoft_1_1quantum_1_1_config_bind_1adf3bf81ad0af724a356c3a7cf748961b}

Default value.

#### `private template<>`  <br/>`bool `[`setupArguments`](#classmicrosoft_1_1quantum_1_1_config_bind_1a03c3168509e9de32089d771495a44569)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` &,R const &)` {#classmicrosoft_1_1quantum_1_1_config_bind_1a03c3168509e9de32089d771495a44569}

Generic function to setup arguments of any type.

#### `private bool `[`setupArguments`](#classmicrosoft_1_1quantum_1_1_config_bind_1adafa765a888b90743bb8bb580f4c918b)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` & parser,bool const &)` {#classmicrosoft_1_1quantum_1_1_config_bind_1adafa765a888b90743bb8bb580f4c918b}

Specialised function setting arguments up for booleans.

#### `private template<>`  <br/>`void `[`alterNameBasedOnType`](#classmicrosoft_1_1quantum_1_1_config_bind_1a5db8c4c39dfa20601d8e58347fc38c59)`(R const & default_value)` {#classmicrosoft_1_1quantum_1_1_config_bind_1a5db8c4c39dfa20601d8e58347fc38c59}

Generic function that changes the parameter name based on the value type and default value.

#### `private void `[`alterNameBasedOnType`](#classmicrosoft_1_1quantum_1_1_config_bind_1a019a0e9aa950c8bd42c4eacced067c2b)`(bool const & default_value)` {#classmicrosoft_1_1quantum_1_1_config_bind_1a019a0e9aa950c8bd42c4eacced067c2b}

Specialised function that changes the parameter name based on default value for booleans.

#### `private template<>`  <br/>`String `[`valueAsString`](#classmicrosoft_1_1quantum_1_1_config_bind_1a98323b299e3d27dec347ccd309f3b200)`(A const &)` {#classmicrosoft_1_1quantum_1_1_config_bind_1a98323b299e3d27dec347ccd309f3b200}

Generic string serialization.

#### `private template<>`  <br/>`String `[`valueAsString`](#classmicrosoft_1_1quantum_1_1_config_bind_1a7e33292902037a5a90e3d4e3ce8755d5)`(`[`EnableIf`](#classmicrosoft_1_1quantum_1_1_config_bind_1a1ed6bdd7a038383a0e05092e2db38dc2)`< A, bool, A > const &)` {#classmicrosoft_1_1quantum_1_1_config_bind_1a7e33292902037a5a90e3d4e3ce8755d5}

Specialised serialization for booleans.

#### `private template<>`  <br/>`void `[`loadValue`](#classmicrosoft_1_1quantum_1_1_config_bind_1a5cbd568fff11a1c40158fa03122688e5)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` const & parser,R const & default_value)` {#classmicrosoft_1_1quantum_1_1_config_bind_1a5cbd568fff11a1c40158fa03122688e5}

Generic deserialization of string values from parser.

#### `private template<>`  <br/>`void `[`loadValue`](#classmicrosoft_1_1quantum_1_1_config_bind_1ae4b367794d58331a4d11cc0629a1f0b0)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` const & parser,`[`EnableIf`](#classmicrosoft_1_1quantum_1_1_config_bind_1a1ed6bdd7a038383a0e05092e2db38dc2)`< A, bool, A > const & default_value)` {#classmicrosoft_1_1quantum_1_1_config_bind_1ae4b367794d58331a4d11cc0629a1f0b0}

Specialised deserialization of string values from parser for booleans.

#### `private template<>`  <br/>`void `[`loadValue`](#classmicrosoft_1_1quantum_1_1_config_bind_1a07acf17c320eb3289b9b662f16bab122)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` const & parser,`[`EnableIf`](#classmicrosoft_1_1quantum_1_1_config_bind_1a1ed6bdd7a038383a0e05092e2db38dc2)`< A, String, A > const & default_value)` {#classmicrosoft_1_1quantum_1_1_config_bind_1a07acf17c320eb3289b9b662f16bab122}

Specialised deserialization of string values from parser for strings.

## class `microsoft::quantum::ConfigurationManager` {#classmicrosoft_1_1quantum_1_1_configuration_manager}

[ConfigurationManager](#classmicrosoft_1_1quantum_1_1_configuration_manager) is a class that holds a collection of configurations (sections). Each of these sections are embodied in their own class with a one-to-one mapping between configuration section and the configuration type. As an example, if one wishes to make a configuration for the class Foo, one would create a class FooConfig which would hold all the variables that are configurable and then add FooConfig to the [ConfigurationManager](#classmicrosoft_1_1quantum_1_1_configuration_manager) using `[addConfig()](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a26df4c5ae50f18bac796518303f8aa92)`. For FooConfig to fulfill the concept of a configuration, it must implement a setup functions whose first argument is the [ConfigurationManager](#classmicrosoft_1_1quantum_1_1_configuration_manager).

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a3a000c5eef536e365983e27e78bb9925)`() = default` | Configuration manager is default constructible, non-copyable and non-movable.
`public  `[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1ae1baf10338105bd77858f23a6b36496b)`(`[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` const &) = delete` | 
`public  `[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a84f40eee5235c96e4a6720956863a436)`(`[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` &&) = delete` | 
`public `[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a7a63e5acf3323db8b8cb692f24e423a8)`(`[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` const &) = delete` | 
`public `[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a04894caab8e065333c355fa91615e13b)`(`[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` &&) = delete` | 
`public void `[`setupArguments`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a7e86e3245a053f6ff51a0dbf0400cc63)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` & parser)` | Adds all bound variables as parser arguments.
`public void `[`configure`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1ac77595dff2caa3a03a10a2ce28a015cc)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` const & parser)` | Configures the value of each bound variable given a parser instance.
`public template<>`  <br/>`inline void `[`setConfig`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a5c48db919bc0000008f4b5be4a392c75)`(T const & value)` | Given an instance of the [ConfigurationManager](#classmicrosoft_1_1quantum_1_1_configuration_manager), this method override settings of class T.
`public template<>`  <br/>`inline T const  & `[`get`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1abfc9248a27430fbfc8fca5dff9396ea9)`() const` | Gets the configuration instance of type T.
`public void `[`printHelp`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1aca98cb6740798749a66641756def243f)`() const` | Prints options for configurability to the terminal.
`public void `[`printConfiguration`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a7759fda07cacba7d9fa33a6b7e592649)`() const` | Prints the configuration to the terminal. The configuration print is LLVM IR compatible meaning that every line starts with a semicolon ; to ensure that it is interpreted as a comment.
`public template<>`  <br/>`inline void `[`addConfig`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a26df4c5ae50f18bac796518303f8aa92)`(String const & id,T const & default_value)` | Adds a new configuration of type T.
`public template<>`  <br/>`inline bool `[`isActive`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a7b0d12b1e6b3aa4461c4a2fcde23e559)`()` | Whether or not the component associated with T is active.
`public void `[`setSectionName`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1aff1f83daecc597a806f001a738d16dd3)`(String const & name,String const & description)` | Sets the section name. This method is used by the configuration class to set a section name.
`public template<>`  <br/>`inline void `[`addParameter`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a4fc3568630101aa029ca87b48d2cd199)`(T & bind,T default_value,String const & name,String const & description)` | Adds a new parameter with a default value to the configuration section. This function should be used by the configuration class.
`public template<>`  <br/>`inline void `[`addParameter`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1aa67d059880a727bfabc5b6467d13d301)`(T & bind,String const & name,String const & description)` | Adds a new parameter to the configuration section. This method uses the bound variable value as default value. This function should be used by the configuration class.
`typedef `[`IConfigBindPtr`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1af61fa67ec0014fbd15ba33935de6e216) | Pointer class used to bind a parameter to a value.
`typedef `[`ConfigList`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a26f163aa8940c36278da8b280882583d) | List of bound variables.
`typedef `[`VoidPtr`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a7a7a51a321cb6c140f34431e1f2371a9) | Type-erased configuration pointer.
`typedef `[`TypeId`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1aa6b9c062753af58a8d594990aef93a56) | Type index class.
`typedef `[`BoolPtr`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1aedde069c5d62d2e2d5c32208f8782627) | 
`typedef `[`Sections`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1ae10ebe2dca9e7e51aed342e178f48835) | List of available sections.
`private `[`Sections`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1ae10ebe2dca9e7e51aed342e178f48835)` `[`config_sections_`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a1277e12e4bc8bd24f61373101ebbd1da) | All available sections within the [ConfigurationManager](#classmicrosoft_1_1quantum_1_1_configuration_manager) instance.
`private template<>`  <br/>`inline T & `[`getInternal`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a01b68d0766c26df13ff50f94e20fa609)`() const` | Helper function to get a reference to the configuration of type T.

### Members

#### `public  `[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a3a000c5eef536e365983e27e78bb9925)`() = default` {#classmicrosoft_1_1quantum_1_1_configuration_manager_1a3a000c5eef536e365983e27e78bb9925}

Configuration manager is default constructible, non-copyable and non-movable.

#### `public  `[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1ae1baf10338105bd77858f23a6b36496b)`(`[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_configuration_manager_1ae1baf10338105bd77858f23a6b36496b}

#### `public  `[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a84f40eee5235c96e4a6720956863a436)`(`[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` &&) = delete` {#classmicrosoft_1_1quantum_1_1_configuration_manager_1a84f40eee5235c96e4a6720956863a436}

#### `public `[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a7a63e5acf3323db8b8cb692f24e423a8)`(`[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_configuration_manager_1a7a63e5acf3323db8b8cb692f24e423a8}

#### `public `[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a04894caab8e065333c355fa91615e13b)`(`[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` &&) = delete` {#classmicrosoft_1_1quantum_1_1_configuration_manager_1a04894caab8e065333c355fa91615e13b}

#### `public void `[`setupArguments`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a7e86e3245a053f6ff51a0dbf0400cc63)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` & parser)` {#classmicrosoft_1_1quantum_1_1_configuration_manager_1a7e86e3245a053f6ff51a0dbf0400cc63}

Adds all bound variables as parser arguments.

#### `public void `[`configure`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1ac77595dff2caa3a03a10a2ce28a015cc)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` const & parser)` {#classmicrosoft_1_1quantum_1_1_configuration_manager_1ac77595dff2caa3a03a10a2ce28a015cc}

Configures the value of each bound variable given a parser instance.

#### `public template<>`  <br/>`inline void `[`setConfig`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a5c48db919bc0000008f4b5be4a392c75)`(T const & value)` {#classmicrosoft_1_1quantum_1_1_configuration_manager_1a5c48db919bc0000008f4b5be4a392c75}

Given an instance of the [ConfigurationManager](#classmicrosoft_1_1quantum_1_1_configuration_manager), this method override settings of class T.

#### `public template<>`  <br/>`inline T const  & `[`get`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1abfc9248a27430fbfc8fca5dff9396ea9)`() const` {#classmicrosoft_1_1quantum_1_1_configuration_manager_1abfc9248a27430fbfc8fca5dff9396ea9}

Gets the configuration instance of type T.

#### `public void `[`printHelp`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1aca98cb6740798749a66641756def243f)`() const` {#classmicrosoft_1_1quantum_1_1_configuration_manager_1aca98cb6740798749a66641756def243f}

Prints options for configurability to the terminal.

#### `public void `[`printConfiguration`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a7759fda07cacba7d9fa33a6b7e592649)`() const` {#classmicrosoft_1_1quantum_1_1_configuration_manager_1a7759fda07cacba7d9fa33a6b7e592649}

Prints the configuration to the terminal. The configuration print is LLVM IR compatible meaning that every line starts with a semicolon ; to ensure that it is interpreted as a comment.

#### `public template<>`  <br/>`inline void `[`addConfig`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a26df4c5ae50f18bac796518303f8aa92)`(String const & id,T const & default_value)` {#classmicrosoft_1_1quantum_1_1_configuration_manager_1a26df4c5ae50f18bac796518303f8aa92}

Adds a new configuration of type T.

#### `public template<>`  <br/>`inline bool `[`isActive`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a7b0d12b1e6b3aa4461c4a2fcde23e559)`()` {#classmicrosoft_1_1quantum_1_1_configuration_manager_1a7b0d12b1e6b3aa4461c4a2fcde23e559}

Whether or not the component associated with T is active.

#### `public void `[`setSectionName`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1aff1f83daecc597a806f001a738d16dd3)`(String const & name,String const & description)` {#classmicrosoft_1_1quantum_1_1_configuration_manager_1aff1f83daecc597a806f001a738d16dd3}

Sets the section name. This method is used by the configuration class to set a section name.

#### `public template<>`  <br/>`inline void `[`addParameter`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a4fc3568630101aa029ca87b48d2cd199)`(T & bind,T default_value,String const & name,String const & description)` {#classmicrosoft_1_1quantum_1_1_configuration_manager_1a4fc3568630101aa029ca87b48d2cd199}

Adds a new parameter with a default value to the configuration section. This function should be used by the configuration class.

#### `public template<>`  <br/>`inline void `[`addParameter`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1aa67d059880a727bfabc5b6467d13d301)`(T & bind,String const & name,String const & description)` {#classmicrosoft_1_1quantum_1_1_configuration_manager_1aa67d059880a727bfabc5b6467d13d301}

Adds a new parameter to the configuration section. This method uses the bound variable value as default value. This function should be used by the configuration class.

#### `typedef `[`IConfigBindPtr`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1af61fa67ec0014fbd15ba33935de6e216) {#classmicrosoft_1_1quantum_1_1_configuration_manager_1af61fa67ec0014fbd15ba33935de6e216}

Pointer class used to bind a parameter to a value.

#### `typedef `[`ConfigList`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a26f163aa8940c36278da8b280882583d) {#classmicrosoft_1_1quantum_1_1_configuration_manager_1a26f163aa8940c36278da8b280882583d}

List of bound variables.

#### `typedef `[`VoidPtr`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a7a7a51a321cb6c140f34431e1f2371a9) {#classmicrosoft_1_1quantum_1_1_configuration_manager_1a7a7a51a321cb6c140f34431e1f2371a9}

Type-erased configuration pointer.

#### `typedef `[`TypeId`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1aa6b9c062753af58a8d594990aef93a56) {#classmicrosoft_1_1quantum_1_1_configuration_manager_1aa6b9c062753af58a8d594990aef93a56}

Type index class.

#### `typedef `[`BoolPtr`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1aedde069c5d62d2e2d5c32208f8782627) {#classmicrosoft_1_1quantum_1_1_configuration_manager_1aedde069c5d62d2e2d5c32208f8782627}

#### `typedef `[`Sections`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1ae10ebe2dca9e7e51aed342e178f48835) {#classmicrosoft_1_1quantum_1_1_configuration_manager_1ae10ebe2dca9e7e51aed342e178f48835}

List of available sections.

#### `private `[`Sections`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1ae10ebe2dca9e7e51aed342e178f48835)` `[`config_sections_`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a1277e12e4bc8bd24f61373101ebbd1da) {#classmicrosoft_1_1quantum_1_1_configuration_manager_1a1277e12e4bc8bd24f61373101ebbd1da}

All available sections within the [ConfigurationManager](#classmicrosoft_1_1quantum_1_1_configuration_manager) instance.

#### `private template<>`  <br/>`inline T & `[`getInternal`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a01b68d0766c26df13ff50f94e20fa609)`() const` {#classmicrosoft_1_1quantum_1_1_configuration_manager_1a01b68d0766c26df13ff50f94e20fa609}

Helper function to get a reference to the configuration of type T.

## class `microsoft::quantum::IConfigBind` {#classmicrosoft_1_1quantum_1_1_i_config_bind}

Interface class to bind a variable to a configuration flag. This class provides the necessary interface to bind variables and populate their value based on given command-line arguments.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a8ad4e44ae06aacf028e7fc681307efa3)`(`[`IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind)` const &) = delete` | 
`public  `[`IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a3ba0b08a28da75373db5d0e5a599013a)`(`[`IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind)` &&) = delete` | 
`public `[`IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a756eeb8edd0c1676add6e03ea9e4fedd)`(`[`IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind)` const &) = delete` | 
`public `[`IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a40ced58da1e452732da73331c7ccc205)`(`[`IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind)` &&) = delete` | 
`public virtual  `[`~IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a2ef8237b235046d22204dd80fa64fae9)`()` | 
`public bool `[`setupArguments`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a60b9e73508ca17f3d7518fde2f580d46)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` & parser)` | Interface function to register configuration in the parser. This function register the configuration to the parameter parser. This makes the configuration available in the parameter parsers help function. This method should return true if arguments were successfully setup.
`public bool `[`configure`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a725ccd6465a61592f6cb4e1f87370738)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` const & parser)` | Interface function to extract configuration from the command line arguments. Given an instance of the command line parameter parser, this function is meant to read the command line arguments, interpret it and set the bound variable value (if present). This method should return true if configure operation was successful.
`public String `[`value`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a5357cc356c1c63c1a8cb2e9a3f43a1e3)`()` | Interface function to return a string representation of the current value of the bound variable.
`public String `[`name`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a096663f66f40163008233c33527d0c2e)`() const` | Returns the name of the bound configuration variable.
`public String `[`description`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a33614ced55a79616bc49cc0988dcb66c)`() const` | Returns the description of the configuration variable.
`public bool `[`isFlag`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a95f172bbce1351aa41abc299612e922d)`() const` | Indicates whether or not this.
`public String `[`defaultValue`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a1e2b1af76ff1512d8c21948578a23ae4)`() const` | Returns the default value for the flag.
`protected  `[`IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a80643a3184930cfd50916938d3366d56)`(String const & name,String const & description)` | 
`protected void `[`setName`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a499e109b9801672e834c0aa4e17d3e3b)`(String const & name)` | Sets the name of the configuration variable.
`protected void `[`markAsFlag`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a4e4047b01a89a7f4c259442c4a46386f)`()` | Marks the variable as a flag.
`protected void `[`setDefault`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1ac618493c6e80ac1393785b3b772b7cce)`(String const & v)` | Sets the default value as a string.
`private String `[`name_`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1ad97b29afc3c77ad11b400e138d2b87da) | Name that which sets the value.
`private String `[`description_`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a99429d9ff1c5d4601639e9a878aff41f) | Description of the option or flag.
`private bool `[`is_flag_`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a32666735548c2b47a41fcd69aa8766a7) | Whether or not the variable is a flag.
`private String `[`str_default_value_`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1aa38d24ea1236026ce9d0999cdf8028dc) | Default value represented as a string.

### Members

#### `public  `[`IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a8ad4e44ae06aacf028e7fc681307efa3)`(`[`IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_i_config_bind_1a8ad4e44ae06aacf028e7fc681307efa3}

#### `public  `[`IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a3ba0b08a28da75373db5d0e5a599013a)`(`[`IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind)` &&) = delete` {#classmicrosoft_1_1quantum_1_1_i_config_bind_1a3ba0b08a28da75373db5d0e5a599013a}

#### `public `[`IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a756eeb8edd0c1676add6e03ea9e4fedd)`(`[`IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_i_config_bind_1a756eeb8edd0c1676add6e03ea9e4fedd}

#### `public `[`IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a40ced58da1e452732da73331c7ccc205)`(`[`IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind)` &&) = delete` {#classmicrosoft_1_1quantum_1_1_i_config_bind_1a40ced58da1e452732da73331c7ccc205}

#### `public virtual  `[`~IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a2ef8237b235046d22204dd80fa64fae9)`()` {#classmicrosoft_1_1quantum_1_1_i_config_bind_1a2ef8237b235046d22204dd80fa64fae9}

#### `public bool `[`setupArguments`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a60b9e73508ca17f3d7518fde2f580d46)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` & parser)` {#classmicrosoft_1_1quantum_1_1_i_config_bind_1a60b9e73508ca17f3d7518fde2f580d46}

Interface function to register configuration in the parser. This function register the configuration to the parameter parser. This makes the configuration available in the parameter parsers help function. This method should return true if arguments were successfully setup.

#### `public bool `[`configure`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a725ccd6465a61592f6cb4e1f87370738)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` const & parser)` {#classmicrosoft_1_1quantum_1_1_i_config_bind_1a725ccd6465a61592f6cb4e1f87370738}

Interface function to extract configuration from the command line arguments. Given an instance of the command line parameter parser, this function is meant to read the command line arguments, interpret it and set the bound variable value (if present). This method should return true if configure operation was successful.

#### `public String `[`value`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a5357cc356c1c63c1a8cb2e9a3f43a1e3)`()` {#classmicrosoft_1_1quantum_1_1_i_config_bind_1a5357cc356c1c63c1a8cb2e9a3f43a1e3}

Interface function to return a string representation of the current value of the bound variable.

#### `public String `[`name`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a096663f66f40163008233c33527d0c2e)`() const` {#classmicrosoft_1_1quantum_1_1_i_config_bind_1a096663f66f40163008233c33527d0c2e}

Returns the name of the bound configuration variable.

#### `public String `[`description`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a33614ced55a79616bc49cc0988dcb66c)`() const` {#classmicrosoft_1_1quantum_1_1_i_config_bind_1a33614ced55a79616bc49cc0988dcb66c}

Returns the description of the configuration variable.

#### `public bool `[`isFlag`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a95f172bbce1351aa41abc299612e922d)`() const` {#classmicrosoft_1_1quantum_1_1_i_config_bind_1a95f172bbce1351aa41abc299612e922d}

Indicates whether or not this.

#### `public String `[`defaultValue`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a1e2b1af76ff1512d8c21948578a23ae4)`() const` {#classmicrosoft_1_1quantum_1_1_i_config_bind_1a1e2b1af76ff1512d8c21948578a23ae4}

Returns the default value for the flag.

#### `protected  `[`IConfigBind`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a80643a3184930cfd50916938d3366d56)`(String const & name,String const & description)` {#classmicrosoft_1_1quantum_1_1_i_config_bind_1a80643a3184930cfd50916938d3366d56}

#### `protected void `[`setName`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a499e109b9801672e834c0aa4e17d3e3b)`(String const & name)` {#classmicrosoft_1_1quantum_1_1_i_config_bind_1a499e109b9801672e834c0aa4e17d3e3b}

Sets the name of the configuration variable.

#### `protected void `[`markAsFlag`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a4e4047b01a89a7f4c259442c4a46386f)`()` {#classmicrosoft_1_1quantum_1_1_i_config_bind_1a4e4047b01a89a7f4c259442c4a46386f}

Marks the variable as a flag.

#### `protected void `[`setDefault`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1ac618493c6e80ac1393785b3b772b7cce)`(String const & v)` {#classmicrosoft_1_1quantum_1_1_i_config_bind_1ac618493c6e80ac1393785b3b772b7cce}

Sets the default value as a string.

#### `private String `[`name_`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1ad97b29afc3c77ad11b400e138d2b87da) {#classmicrosoft_1_1quantum_1_1_i_config_bind_1ad97b29afc3c77ad11b400e138d2b87da}

Name that which sets the value.

#### `private String `[`description_`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a99429d9ff1c5d4601639e9a878aff41f) {#classmicrosoft_1_1quantum_1_1_i_config_bind_1a99429d9ff1c5d4601639e9a878aff41f}

Description of the option or flag.

#### `private bool `[`is_flag_`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1a32666735548c2b47a41fcd69aa8766a7) {#classmicrosoft_1_1quantum_1_1_i_config_bind_1a32666735548c2b47a41fcd69aa8766a7}

Whether or not the variable is a flag.

#### `private String `[`str_default_value_`](#classmicrosoft_1_1quantum_1_1_i_config_bind_1aa38d24ea1236026ce9d0999cdf8028dc) {#classmicrosoft_1_1quantum_1_1_i_config_bind_1aa38d24ea1236026ce9d0999cdf8028dc}

Default value represented as a string.

## class `microsoft::quantum::ParameterParser` {#classmicrosoft_1_1quantum_1_1_parameter_parser}

Parameter parser class which allows the developer to specify a set of default settings and update those using the commandline argc and argv.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a4005df4ec69c557362470db040b0a27e)`() = default` | 
`public  `[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a5d9cc685032c90dfce8a61aad4cc816d)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` const & other) = delete` | 
`public  `[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a1e1ec6b6c3ceb9571d270a778730404a)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` && other) = default` | 
`public  `[`~ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1ac5a1269991272ddd0d6e79b481fe6a32)`() = default` | 
`public void `[`addFlag`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a448e50a91e29de07838a4afd0cae8b6d)`(String const & v)` | Marks a name as a flag (as opposed to an option). This ensures that no parameter is expected after the flag is specified. For instance `--debug` is a flag as opposed to `--log-level 3` which is an option.
`public void `[`parseArgs`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a7ffcc25257b4238a318e08d0a1cbb650)`(int argc,char ** argv)` | Parses the command line arguments given the argc and argv from the main function.
`public Arguments const  & `[`arguments`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a6984127bf1ab2999671d9079f796c966)`() const` | Returns list of arguments without flags and/or options included.
`public String const  & `[`getArg`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1abbb53cf9bd3bf7d9f238514531dc43da)`(Arguments::size_type const & n) const` | Returns the n'th commandline argument.
`public String const  & `[`get`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a2d4d430e04414d805deebb3e40c9576a)`(String const & name,String const & default_value) const noexcept` | Gets a named setting, falling back to a default if the key is not found.
`public String const  & `[`get`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a30c16fd01aa8a0d6cfc2dff4f67f6960)`(String const & name) const` | Gets a named setting. This method throws if the setting is not present.
`public bool `[`has`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1ab01ffb6089e66a6d435cd0d0f5329282)`(String const & name) const noexcept` | Checks whether or not a given parameter is present.
`public void `[`reset`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a537b7e34f7b781fcbd89c1197f8d9e56)`()` | Resets the state of the parser to its construction state.
`typedef `[`Arguments`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a32b7d3e30b5e4b84b8cff1773e61f022) | 
`typedef `[`Flags`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a78c62c5acdbd5dad00859180b7f8a1e1) | 
`typedef `[`SettingsMap`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a1fd64474896242bcd82e9eb04af4b890) | 
`private Flags `[`flags_`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1aae6abbe2d881de7f5809d9e2ec591408) | Set of flags.
`private Arguments `[`arguments_`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a52410c65c0f7ea56c9dbce2d72cffba2) | List of remaining arguments.
`private SettingsMap `[`settings_`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1ada84d1c5887f8c664a6e77dd92e220b5) | Settings map that keeps all specified settings.
`private ParsedValue `[`parseSingleArg`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a5ebe33583694921da26143a2b86b6c57)`(String key)` | 
`private bool `[`isOption`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a76f6121fe3a10a2ab83709d5360373ba)`(String const & key)` | Checks whether a key is an option (or a flag). Returns true if it is and option and false if it is a flags.

### Members

#### `public  `[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a4005df4ec69c557362470db040b0a27e)`() = default` {#classmicrosoft_1_1quantum_1_1_parameter_parser_1a4005df4ec69c557362470db040b0a27e}

#### `public  `[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a5d9cc685032c90dfce8a61aad4cc816d)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` const & other) = delete` {#classmicrosoft_1_1quantum_1_1_parameter_parser_1a5d9cc685032c90dfce8a61aad4cc816d}

#### `public  `[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a1e1ec6b6c3ceb9571d270a778730404a)`(`[`ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser)` && other) = default` {#classmicrosoft_1_1quantum_1_1_parameter_parser_1a1e1ec6b6c3ceb9571d270a778730404a}

#### `public  `[`~ParameterParser`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1ac5a1269991272ddd0d6e79b481fe6a32)`() = default` {#classmicrosoft_1_1quantum_1_1_parameter_parser_1ac5a1269991272ddd0d6e79b481fe6a32}

#### `public void `[`addFlag`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a448e50a91e29de07838a4afd0cae8b6d)`(String const & v)` {#classmicrosoft_1_1quantum_1_1_parameter_parser_1a448e50a91e29de07838a4afd0cae8b6d}

Marks a name as a flag (as opposed to an option). This ensures that no parameter is expected after the flag is specified. For instance `--debug` is a flag as opposed to `--log-level 3` which is an option.

#### `public void `[`parseArgs`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a7ffcc25257b4238a318e08d0a1cbb650)`(int argc,char ** argv)` {#classmicrosoft_1_1quantum_1_1_parameter_parser_1a7ffcc25257b4238a318e08d0a1cbb650}

Parses the command line arguments given the argc and argv from the main function.

#### `public Arguments const  & `[`arguments`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a6984127bf1ab2999671d9079f796c966)`() const` {#classmicrosoft_1_1quantum_1_1_parameter_parser_1a6984127bf1ab2999671d9079f796c966}

Returns list of arguments without flags and/or options included.

#### `public String const  & `[`getArg`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1abbb53cf9bd3bf7d9f238514531dc43da)`(Arguments::size_type const & n) const` {#classmicrosoft_1_1quantum_1_1_parameter_parser_1abbb53cf9bd3bf7d9f238514531dc43da}

Returns the n'th commandline argument.

#### `public String const  & `[`get`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a2d4d430e04414d805deebb3e40c9576a)`(String const & name,String const & default_value) const noexcept` {#classmicrosoft_1_1quantum_1_1_parameter_parser_1a2d4d430e04414d805deebb3e40c9576a}

Gets a named setting, falling back to a default if the key is not found.

#### `public String const  & `[`get`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a30c16fd01aa8a0d6cfc2dff4f67f6960)`(String const & name) const` {#classmicrosoft_1_1quantum_1_1_parameter_parser_1a30c16fd01aa8a0d6cfc2dff4f67f6960}

Gets a named setting. This method throws if the setting is not present.

#### `public bool `[`has`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1ab01ffb6089e66a6d435cd0d0f5329282)`(String const & name) const noexcept` {#classmicrosoft_1_1quantum_1_1_parameter_parser_1ab01ffb6089e66a6d435cd0d0f5329282}

Checks whether or not a given parameter is present.

#### `public void `[`reset`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a537b7e34f7b781fcbd89c1197f8d9e56)`()` {#classmicrosoft_1_1quantum_1_1_parameter_parser_1a537b7e34f7b781fcbd89c1197f8d9e56}

Resets the state of the parser to its construction state.

#### `typedef `[`Arguments`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a32b7d3e30b5e4b84b8cff1773e61f022) {#classmicrosoft_1_1quantum_1_1_parameter_parser_1a32b7d3e30b5e4b84b8cff1773e61f022}

#### `typedef `[`Flags`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a78c62c5acdbd5dad00859180b7f8a1e1) {#classmicrosoft_1_1quantum_1_1_parameter_parser_1a78c62c5acdbd5dad00859180b7f8a1e1}

#### `typedef `[`SettingsMap`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a1fd64474896242bcd82e9eb04af4b890) {#classmicrosoft_1_1quantum_1_1_parameter_parser_1a1fd64474896242bcd82e9eb04af4b890}

#### `private Flags `[`flags_`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1aae6abbe2d881de7f5809d9e2ec591408) {#classmicrosoft_1_1quantum_1_1_parameter_parser_1aae6abbe2d881de7f5809d9e2ec591408}

Set of flags.

#### `private Arguments `[`arguments_`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a52410c65c0f7ea56c9dbce2d72cffba2) {#classmicrosoft_1_1quantum_1_1_parameter_parser_1a52410c65c0f7ea56c9dbce2d72cffba2}

List of remaining arguments.

#### `private SettingsMap `[`settings_`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1ada84d1c5887f8c664a6e77dd92e220b5) {#classmicrosoft_1_1quantum_1_1_parameter_parser_1ada84d1c5887f8c664a6e77dd92e220b5}

Settings map that keeps all specified settings.

#### `private ParsedValue `[`parseSingleArg`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a5ebe33583694921da26143a2b86b6c57)`(String key)` {#classmicrosoft_1_1quantum_1_1_parameter_parser_1a5ebe33583694921da26143a2b86b6c57}

#### `private bool `[`isOption`](#classmicrosoft_1_1quantum_1_1_parameter_parser_1a76f6121fe3a10a2ab83709d5360373ba)`(String const & key)` {#classmicrosoft_1_1quantum_1_1_parameter_parser_1a76f6121fe3a10a2ab83709d5360373ba}

Checks whether a key is an option (or a flag). Returns true if it is and option and false if it is a flags.

## class `microsoft::quantum::DefaultProfileGenerator` {#classmicrosoft_1_1quantum_1_1_default_profile_generator}

```
class microsoft::quantum::DefaultProfileGenerator
  : public microsoft::quantum::ProfileGenerator
```

[DefaultProfileGenerator](#classmicrosoft_1_1quantum_1_1_default_profile_generator) defines a profile that configures the rule set used by the [Profile](#classmicrosoft_1_1quantum_1_1_profile) pass. This profile is useful for generating dynamic profiles and is well suited for testing purposes or YAML configured transformation of the IR.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`DefaultProfileGenerator`](#classmicrosoft_1_1quantum_1_1_default_profile_generator_1a858468c67dab40c190f769acfc31124f)`()` | Default constructor. This constructor adds components for rule transformation and LLVM passes. These are configurable through the corresponding configuration classes which can be access through the configuration manager.
`public  explicit `[`DefaultProfileGenerator`](#classmicrosoft_1_1quantum_1_1_default_profile_generator_1a5ebae1a00834f9f572af68d9ef2f0d8f)`(`[`ConfigureFunction`](#classmicrosoft_1_1quantum_1_1_default_profile_generator_1a22f659469ab3e13156e2620d786bd808)` const & configure,`[`TransformationRulesPassConfiguration`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration)` const & profile_pass_config,`[`LlvmPassesConfiguration`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration)` const & llvm_config)` | The constructor takes a lambda function which configures the rule set. This function is invoked during the creation of the generation module. This constructor further overrides the default configuration
`public `[`TransformationRulesPassConfiguration`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration)` const  & `[`ruleTransformationConfig`](#classmicrosoft_1_1quantum_1_1_default_profile_generator_1a995ddd27c16ae4353c6a22be811f1a8d)`() const` | Returns a constant reference to the rule transformation configuration.
`public `[`LlvmPassesConfiguration`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration)` const  & `[`llvmPassesConfig`](#classmicrosoft_1_1quantum_1_1_default_profile_generator_1a61b348299ef721fa1adfc8cec28c8792)`() const` | Returns a constant reference to the LLVM passes configuration.
`typedef `[`ConfigureFunction`](#classmicrosoft_1_1quantum_1_1_default_profile_generator_1a22f659469ab3e13156e2620d786bd808) | Function type that configures a rule set.

### Members

#### `public  `[`DefaultProfileGenerator`](#classmicrosoft_1_1quantum_1_1_default_profile_generator_1a858468c67dab40c190f769acfc31124f)`()` {#classmicrosoft_1_1quantum_1_1_default_profile_generator_1a858468c67dab40c190f769acfc31124f}

Default constructor. This constructor adds components for rule transformation and LLVM passes. These are configurable through the corresponding configuration classes which can be access through the configuration manager.

#### `public  explicit `[`DefaultProfileGenerator`](#classmicrosoft_1_1quantum_1_1_default_profile_generator_1a5ebae1a00834f9f572af68d9ef2f0d8f)`(`[`ConfigureFunction`](#classmicrosoft_1_1quantum_1_1_default_profile_generator_1a22f659469ab3e13156e2620d786bd808)` const & configure,`[`TransformationRulesPassConfiguration`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration)` const & profile_pass_config,`[`LlvmPassesConfiguration`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration)` const & llvm_config)` {#classmicrosoft_1_1quantum_1_1_default_profile_generator_1a5ebae1a00834f9f572af68d9ef2f0d8f}

The constructor takes a lambda function which configures the rule set. This function is invoked during the creation of the generation module. This constructor further overrides the default configuration

#### `public `[`TransformationRulesPassConfiguration`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration)` const  & `[`ruleTransformationConfig`](#classmicrosoft_1_1quantum_1_1_default_profile_generator_1a995ddd27c16ae4353c6a22be811f1a8d)`() const` {#classmicrosoft_1_1quantum_1_1_default_profile_generator_1a995ddd27c16ae4353c6a22be811f1a8d}

Returns a constant reference to the rule transformation configuration.

#### `public `[`LlvmPassesConfiguration`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration)` const  & `[`llvmPassesConfig`](#classmicrosoft_1_1quantum_1_1_default_profile_generator_1a61b348299ef721fa1adfc8cec28c8792)`() const` {#classmicrosoft_1_1quantum_1_1_default_profile_generator_1a61b348299ef721fa1adfc8cec28c8792}

Returns a constant reference to the LLVM passes configuration.

#### `typedef `[`ConfigureFunction`](#classmicrosoft_1_1quantum_1_1_default_profile_generator_1a22f659469ab3e13156e2620d786bd808) {#classmicrosoft_1_1quantum_1_1_default_profile_generator_1a22f659469ab3e13156e2620d786bd808}

Function type that configures a rule set.

## class `microsoft::quantum::LlvmPassesConfiguration` {#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration}

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`LlvmPassesConfiguration`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1aaa6c3f76591c6531e2504b607d72badc)`()` | 
`public void `[`setup`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a645eb2cccc3f75eca6fccf7420beea9a)`(`[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` & config)` | Setup function that registers the different LLVM passes available via LLVM component.
`public bool `[`isDisabled`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1affc954f9eda3eb1dc90ffd02bb281806)`() const` | Returns true if the configuration disables all effects of this component. The effect of this function being true is that registered component should have no effect on transformation and/or validation of the QIR.
`public bool `[`operator==`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a0bd9dc0d97efd91781d812fdeda14a75)`(`[`LlvmPassesConfiguration`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration)` const & ref) const` | Compares equality of two configurations.
`public bool `[`alwaysInline`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a88b8eb6fdc55092fa82a9c156a4a94d4)`() const` | Whether or not the LLVM AlwaysInline pass should be added to the profile.
`public bool `[`disableDefaultPipeline`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1aa1e9204a5eb31e36887e648d8b455613)`() const` | Whether or not the default LLVM pipeline is disabled.
`public std::string `[`passPipeline`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a889babb3348b6c8f5b61b373db5c51d2)`() const` | 
`public int32_t `[`inlineParameter`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a715ea1809e88e7f4f1cb3e7f8acd7967)`() const` | Parameter that defines the maximum number of lines of code allowed for inlining.
`private bool `[`always_inline_`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1afad29ad385ae9f80196aa359ae759a88) | Whether or not LLVM component should inline.
`private bool `[`default_pipeline_is_disabled_`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a7777ee46f66598717785d0a56182b1c1) | Whether or not the default pipeline is disabled.
`private std::string `[`pass_pipeline_`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1ac9c696e060592665ebaa695d2ca5dd19) | Opt compatible LLVM passes pipeline.
`private int32_t `[`inline_parameter_`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a0251081b77df0d38b0194cd58d16e44d) | 
`public static `[`LlvmPassesConfiguration`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration)` `[`createDisabled`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a175c3567995b098ef9d3330aca82bd1d)`()` | Static function creates a new configuration where all transformations/validation requirements are disabled.

### Members

#### `public  `[`LlvmPassesConfiguration`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1aaa6c3f76591c6531e2504b607d72badc)`()` {#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1aaa6c3f76591c6531e2504b607d72badc}

#### `public void `[`setup`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a645eb2cccc3f75eca6fccf7420beea9a)`(`[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` & config)` {#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a645eb2cccc3f75eca6fccf7420beea9a}

Setup function that registers the different LLVM passes available via LLVM component.

#### `public bool `[`isDisabled`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1affc954f9eda3eb1dc90ffd02bb281806)`() const` {#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1affc954f9eda3eb1dc90ffd02bb281806}

Returns true if the configuration disables all effects of this component. The effect of this function being true is that registered component should have no effect on transformation and/or validation of the QIR.

#### `public bool `[`operator==`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a0bd9dc0d97efd91781d812fdeda14a75)`(`[`LlvmPassesConfiguration`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration)` const & ref) const` {#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a0bd9dc0d97efd91781d812fdeda14a75}

Compares equality of two configurations.

#### `public bool `[`alwaysInline`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a88b8eb6fdc55092fa82a9c156a4a94d4)`() const` {#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a88b8eb6fdc55092fa82a9c156a4a94d4}

Whether or not the LLVM AlwaysInline pass should be added to the profile.

#### `public bool `[`disableDefaultPipeline`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1aa1e9204a5eb31e36887e648d8b455613)`() const` {#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1aa1e9204a5eb31e36887e648d8b455613}

Whether or not the default LLVM pipeline is disabled.

#### `public std::string `[`passPipeline`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a889babb3348b6c8f5b61b373db5c51d2)`() const` {#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a889babb3348b6c8f5b61b373db5c51d2}

#### `public int32_t `[`inlineParameter`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a715ea1809e88e7f4f1cb3e7f8acd7967)`() const` {#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a715ea1809e88e7f4f1cb3e7f8acd7967}

Parameter that defines the maximum number of lines of code allowed for inlining.

#### `private bool `[`always_inline_`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1afad29ad385ae9f80196aa359ae759a88) {#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1afad29ad385ae9f80196aa359ae759a88}

Whether or not LLVM component should inline.

#### `private bool `[`default_pipeline_is_disabled_`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a7777ee46f66598717785d0a56182b1c1) {#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a7777ee46f66598717785d0a56182b1c1}

Whether or not the default pipeline is disabled.

#### `private std::string `[`pass_pipeline_`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1ac9c696e060592665ebaa695d2ca5dd19) {#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1ac9c696e060592665ebaa695d2ca5dd19}

Opt compatible LLVM passes pipeline.

#### `private int32_t `[`inline_parameter_`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a0251081b77df0d38b0194cd58d16e44d) {#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a0251081b77df0d38b0194cd58d16e44d}

#### `public static `[`LlvmPassesConfiguration`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration)` `[`createDisabled`](#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a175c3567995b098ef9d3330aca82bd1d)`()` {#classmicrosoft_1_1quantum_1_1_llvm_passes_configuration_1a175c3567995b098ef9d3330aca82bd1d}

Static function creates a new configuration where all transformations/validation requirements are disabled.

## class `microsoft::quantum::ProfileGenerator` {#classmicrosoft_1_1quantum_1_1_profile_generator}

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a92bb0d73be14b88f8327a396f7da037d)`() = default` | 
`public  `[`~ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator_1ac5b102f7f11218a4d0aa437097490be6)`() = default` | 
`public  `[`ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a23e7a76237a9aeb634a68ce8a788af73)`(`[`ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator)` const &) = delete` | 
`public  `[`ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator_1aed9fead48ad2642c407be15b6e3e22d3)`(`[`ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator)` &&) = delete` | 
`public `[`ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a295809dfe8e10b8145afac42c2ff08f2)`(`[`ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator)` const &) = delete` | 
`public `[`ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a1d7df7c22d05325a1c3a64a0487e6dae)`(`[`ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator)` &&) = delete` | 
`public `[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` & `[`configurationManager`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a14bbc624cc852be140ed032bd3c7752a)`()` | Reference to configuration manager. This property allows to access and modify configurations of the generator. This property is intended for managing the configuration.
`public `[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` const  & `[`configurationManager`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a7b606f3166713252d2e78837edd8e667)`() const` | Constant reference to the configuration manager. This property allows read access to the configuration manager and is intended for profile generation.
`public `[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` `[`newProfile`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a168e08f8ff33740f114301f710ce20aa)`(String const & name,OptimizationLevel const & optimisation_level,bool debug)` | Creates a new profile based on the registered components, optimisation level and debug requirements. The returned profile can be applied to an IR to transform it in accordance with the configurations given.
`public template<>`  <br/>`void `[`registerProfileComponent`](#classmicrosoft_1_1quantum_1_1_profile_generator_1aa2da3c24cf79bd0507c8e1140c387054)`(String const & id,`[`SetupFunction`](#classmicrosoft_1_1quantum_1_1_profile_generator_1afd30796c3a7c3a9775641b3ae5e2e7b7)`< R > setup)` | Registers a new profile component with a given configuration R. The profile component is given a name and a setup function which is responsible for configuring the profile in accordance with the configuration.
`public llvm::ModulePassManager & `[`modulePassManager`](#classmicrosoft_1_1quantum_1_1_profile_generator_1ae289e9c38bf45007458de7ab0c79ff51)`()` | Returns the module pass manager.
`public llvm::PassBuilder & `[`passBuilder`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a43a7f4e1d1b05178481d90ee1b81834c)`()` | Returns the pass builder.
`public OptimizationLevel `[`optimisationLevel`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a8bc3a5764dab551423dd241839d6bbbe)`() const` | Returns the optimisation level.
`public bool `[`isDebugMode`](#classmicrosoft_1_1quantum_1_1_profile_generator_1ac255ea9cc3c7c5f88f5903473fee7da1)`() const` | Flag indicating whether we are operating in debug mode or not.
`protected llvm::ModulePassManager `[`createGenerationModulePassManager`](#classmicrosoft_1_1quantum_1_1_profile_generator_1ace821e01e45a2d3dd2792d1e475c8da7)`(`[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` & profile,OptimizationLevel const & optimisation_level,bool debug)` | Internal function that creates a module pass for QIR transformation. The module pass is defined through the profile, the optimisation level and whether or not we are in debug mode.
`protected llvm::ModulePassManager `[`createValidationModulePass`](#classmicrosoft_1_1quantum_1_1_profile_generator_1aa4e73ca81ae2a0900e8b0b0aeb945792)`(PassBuilder & pass_builder,OptimizationLevel const & optimisation_level,bool debug)` | Internal function that creates a module pass for QIR validation. At the moment, this function is a placeholder for future functionality.
`typedef `[`PassBuilder`](#classmicrosoft_1_1quantum_1_1_profile_generator_1ae359b7cc2141a5a59eba89ffaf9af2d8) | 
`typedef `[`OptimizationLevel`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a3bf46b184cf740e682777bdbd026cda6) | 
`typedef `[`FunctionAnalysisManager`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a0625ff7f8618719933bdd0514598343e) | 
`typedef `[`SetupFunction`](#classmicrosoft_1_1quantum_1_1_profile_generator_1afd30796c3a7c3a9775641b3ae5e2e7b7) | Setup function that uses a configuration type R to configure the profile and/or generator.
`typedef `[`SetupFunctionWrapper`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a739d6ddc015e59e3ea80ec39056d3a54) | Wrapper function type for invoking the profile setup function.
`typedef `[`Components`](#classmicrosoft_1_1quantum_1_1_profile_generator_1ae761d436e0b66b332d4e277897ce1a26) | List of components to be configured.
`private `[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` `[`configuration_manager_`](#classmicrosoft_1_1quantum_1_1_profile_generator_1ad6bb9ccbcf1542f84fbb770b0f799399) | Holds the configuration that defines the profile.
`private `[`Components`](#classmicrosoft_1_1quantum_1_1_profile_generator_1ae761d436e0b66b332d4e277897ce1a26)` `[`components_`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a795d312927c19dcbf51d97fa3853a2d0) | List of registered components that configures the profile.
`private llvm::ModulePassManager * `[`module_pass_manager_`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a87248ea9e2bec651d317ab03c34ac7fe) | Pointer to the module pass manager the profile will use.
`private llvm::PassBuilder * `[`pass_builder_`](#classmicrosoft_1_1quantum_1_1_profile_generator_1af9aab3713ff9c8924c6c0ea6191886a3) | Pointer to the pass builder the profile is based on.
`private OptimizationLevel `[`optimisation_level_`](#classmicrosoft_1_1quantum_1_1_profile_generator_1aabad7e3178a7e304b7be589c7f655fda) | Optimisation level used by LLVM.
`private bool `[`debug_`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a6a8ac9b3d264de827ac778d979e692e4) | Whether or not we are in debug mode.

### Members

#### `public  `[`ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a92bb0d73be14b88f8327a396f7da037d)`() = default` {#classmicrosoft_1_1quantum_1_1_profile_generator_1a92bb0d73be14b88f8327a396f7da037d}

#### `public  `[`~ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator_1ac5b102f7f11218a4d0aa437097490be6)`() = default` {#classmicrosoft_1_1quantum_1_1_profile_generator_1ac5b102f7f11218a4d0aa437097490be6}

#### `public  `[`ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a23e7a76237a9aeb634a68ce8a788af73)`(`[`ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_profile_generator_1a23e7a76237a9aeb634a68ce8a788af73}

#### `public  `[`ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator_1aed9fead48ad2642c407be15b6e3e22d3)`(`[`ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator)` &&) = delete` {#classmicrosoft_1_1quantum_1_1_profile_generator_1aed9fead48ad2642c407be15b6e3e22d3}

#### `public `[`ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a295809dfe8e10b8145afac42c2ff08f2)`(`[`ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_profile_generator_1a295809dfe8e10b8145afac42c2ff08f2}

#### `public `[`ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a1d7df7c22d05325a1c3a64a0487e6dae)`(`[`ProfileGenerator`](#classmicrosoft_1_1quantum_1_1_profile_generator)` &&) = delete` {#classmicrosoft_1_1quantum_1_1_profile_generator_1a1d7df7c22d05325a1c3a64a0487e6dae}

#### `public `[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` & `[`configurationManager`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a14bbc624cc852be140ed032bd3c7752a)`()` {#classmicrosoft_1_1quantum_1_1_profile_generator_1a14bbc624cc852be140ed032bd3c7752a}

Reference to configuration manager. This property allows to access and modify configurations of the generator. This property is intended for managing the configuration.

#### `public `[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` const  & `[`configurationManager`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a7b606f3166713252d2e78837edd8e667)`() const` {#classmicrosoft_1_1quantum_1_1_profile_generator_1a7b606f3166713252d2e78837edd8e667}

Constant reference to the configuration manager. This property allows read access to the configuration manager and is intended for profile generation.

#### `public `[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` `[`newProfile`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a168e08f8ff33740f114301f710ce20aa)`(String const & name,OptimizationLevel const & optimisation_level,bool debug)` {#classmicrosoft_1_1quantum_1_1_profile_generator_1a168e08f8ff33740f114301f710ce20aa}

Creates a new profile based on the registered components, optimisation level and debug requirements. The returned profile can be applied to an IR to transform it in accordance with the configurations given.

#### `public template<>`  <br/>`void `[`registerProfileComponent`](#classmicrosoft_1_1quantum_1_1_profile_generator_1aa2da3c24cf79bd0507c8e1140c387054)`(String const & id,`[`SetupFunction`](#classmicrosoft_1_1quantum_1_1_profile_generator_1afd30796c3a7c3a9775641b3ae5e2e7b7)`< R > setup)` {#classmicrosoft_1_1quantum_1_1_profile_generator_1aa2da3c24cf79bd0507c8e1140c387054}

Registers a new profile component with a given configuration R. The profile component is given a name and a setup function which is responsible for configuring the profile in accordance with the configuration.

#### `public llvm::ModulePassManager & `[`modulePassManager`](#classmicrosoft_1_1quantum_1_1_profile_generator_1ae289e9c38bf45007458de7ab0c79ff51)`()` {#classmicrosoft_1_1quantum_1_1_profile_generator_1ae289e9c38bf45007458de7ab0c79ff51}

Returns the module pass manager.

#### `public llvm::PassBuilder & `[`passBuilder`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a43a7f4e1d1b05178481d90ee1b81834c)`()` {#classmicrosoft_1_1quantum_1_1_profile_generator_1a43a7f4e1d1b05178481d90ee1b81834c}

Returns the pass builder.

#### `public OptimizationLevel `[`optimisationLevel`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a8bc3a5764dab551423dd241839d6bbbe)`() const` {#classmicrosoft_1_1quantum_1_1_profile_generator_1a8bc3a5764dab551423dd241839d6bbbe}

Returns the optimisation level.

#### `public bool `[`isDebugMode`](#classmicrosoft_1_1quantum_1_1_profile_generator_1ac255ea9cc3c7c5f88f5903473fee7da1)`() const` {#classmicrosoft_1_1quantum_1_1_profile_generator_1ac255ea9cc3c7c5f88f5903473fee7da1}

Flag indicating whether we are operating in debug mode or not.

#### `protected llvm::ModulePassManager `[`createGenerationModulePassManager`](#classmicrosoft_1_1quantum_1_1_profile_generator_1ace821e01e45a2d3dd2792d1e475c8da7)`(`[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` & profile,OptimizationLevel const & optimisation_level,bool debug)` {#classmicrosoft_1_1quantum_1_1_profile_generator_1ace821e01e45a2d3dd2792d1e475c8da7}

Internal function that creates a module pass for QIR transformation. The module pass is defined through the profile, the optimisation level and whether or not we are in debug mode.

#### `protected llvm::ModulePassManager `[`createValidationModulePass`](#classmicrosoft_1_1quantum_1_1_profile_generator_1aa4e73ca81ae2a0900e8b0b0aeb945792)`(PassBuilder & pass_builder,OptimizationLevel const & optimisation_level,bool debug)` {#classmicrosoft_1_1quantum_1_1_profile_generator_1aa4e73ca81ae2a0900e8b0b0aeb945792}

Internal function that creates a module pass for QIR validation. At the moment, this function is a placeholder for future functionality.

#### `typedef `[`PassBuilder`](#classmicrosoft_1_1quantum_1_1_profile_generator_1ae359b7cc2141a5a59eba89ffaf9af2d8) {#classmicrosoft_1_1quantum_1_1_profile_generator_1ae359b7cc2141a5a59eba89ffaf9af2d8}

#### `typedef `[`OptimizationLevel`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a3bf46b184cf740e682777bdbd026cda6) {#classmicrosoft_1_1quantum_1_1_profile_generator_1a3bf46b184cf740e682777bdbd026cda6}

#### `typedef `[`FunctionAnalysisManager`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a0625ff7f8618719933bdd0514598343e) {#classmicrosoft_1_1quantum_1_1_profile_generator_1a0625ff7f8618719933bdd0514598343e}

#### `typedef `[`SetupFunction`](#classmicrosoft_1_1quantum_1_1_profile_generator_1afd30796c3a7c3a9775641b3ae5e2e7b7) {#classmicrosoft_1_1quantum_1_1_profile_generator_1afd30796c3a7c3a9775641b3ae5e2e7b7}

Setup function that uses a configuration type R to configure the profile and/or generator.

#### `typedef `[`SetupFunctionWrapper`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a739d6ddc015e59e3ea80ec39056d3a54) {#classmicrosoft_1_1quantum_1_1_profile_generator_1a739d6ddc015e59e3ea80ec39056d3a54}

Wrapper function type for invoking the profile setup function.

#### `typedef `[`Components`](#classmicrosoft_1_1quantum_1_1_profile_generator_1ae761d436e0b66b332d4e277897ce1a26) {#classmicrosoft_1_1quantum_1_1_profile_generator_1ae761d436e0b66b332d4e277897ce1a26}

List of components to be configured.

#### `private `[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` `[`configuration_manager_`](#classmicrosoft_1_1quantum_1_1_profile_generator_1ad6bb9ccbcf1542f84fbb770b0f799399) {#classmicrosoft_1_1quantum_1_1_profile_generator_1ad6bb9ccbcf1542f84fbb770b0f799399}

Holds the configuration that defines the profile.

#### `private `[`Components`](#classmicrosoft_1_1quantum_1_1_profile_generator_1ae761d436e0b66b332d4e277897ce1a26)` `[`components_`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a795d312927c19dcbf51d97fa3853a2d0) {#classmicrosoft_1_1quantum_1_1_profile_generator_1a795d312927c19dcbf51d97fa3853a2d0}

List of registered components that configures the profile.

#### `private llvm::ModulePassManager * `[`module_pass_manager_`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a87248ea9e2bec651d317ab03c34ac7fe) {#classmicrosoft_1_1quantum_1_1_profile_generator_1a87248ea9e2bec651d317ab03c34ac7fe}

Pointer to the module pass manager the profile will use.

#### `private llvm::PassBuilder * `[`pass_builder_`](#classmicrosoft_1_1quantum_1_1_profile_generator_1af9aab3713ff9c8924c6c0ea6191886a3) {#classmicrosoft_1_1quantum_1_1_profile_generator_1af9aab3713ff9c8924c6c0ea6191886a3}

Pointer to the pass builder the profile is based on.

#### `private OptimizationLevel `[`optimisation_level_`](#classmicrosoft_1_1quantum_1_1_profile_generator_1aabad7e3178a7e304b7be589c7f655fda) {#classmicrosoft_1_1quantum_1_1_profile_generator_1aabad7e3178a7e304b7be589c7f655fda}

Optimisation level used by LLVM.

#### `private bool `[`debug_`](#classmicrosoft_1_1quantum_1_1_profile_generator_1a6a8ac9b3d264de827ac778d979e692e4) {#classmicrosoft_1_1quantum_1_1_profile_generator_1a6a8ac9b3d264de827ac778d979e692e4}

Whether or not we are in debug mode.

## class `microsoft::quantum::CommentLogger` {#classmicrosoft_1_1quantum_1_1_comment_logger}

```
class microsoft::quantum::CommentLogger
  : public microsoft::quantum::ILogger
```

Concrete [ILogger](#classmicrosoft_1_1quantum_1_1_i_logger) implementation that prints all messages as IR comments to llvm::errs().

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public virtual void `[`debug`](#classmicrosoft_1_1quantum_1_1_comment_logger_1a14d9062cc652849a0fa88fbc256067cd)`(String const & message)` | Adds a debug message to the list.
`public virtual void `[`info`](#classmicrosoft_1_1quantum_1_1_comment_logger_1a1aba56032627b859cde4a5f0c7c5c359)`(String const & message)` | Adds an info message to the list.
`public virtual void `[`warning`](#classmicrosoft_1_1quantum_1_1_comment_logger_1aa86a0a2240efc90df6e16b7454505f8e)`(String const & message)` | Adds a warning message to the list.
`public virtual void `[`error`](#classmicrosoft_1_1quantum_1_1_comment_logger_1a581501a0a86a5f56474b94e43710599e)`(String const & message)` | Adds an error message to the list.
`public virtual void `[`internalError`](#classmicrosoft_1_1quantum_1_1_comment_logger_1ad57d890561e4b79395f5f8ce100f01c9)`(String const & message)` | Adds an internal error message to the list.
`public virtual void `[`setLocation`](#classmicrosoft_1_1quantum_1_1_comment_logger_1a33f3ab1fa8133b84474ac50def208baa)`(String const & name,uint64_t row,uint64_t col)` | Function that allows to set the current location.
`private String `[`location_name_`](#classmicrosoft_1_1quantum_1_1_comment_logger_1ab8a5ca77482c538b9611daf478f1fc80) | 
`private uint64_t `[`location_row_`](#classmicrosoft_1_1quantum_1_1_comment_logger_1af5f5319c88f800998ab2ed78ad7a7cb7) | 
`private uint64_t `[`location_col_`](#classmicrosoft_1_1quantum_1_1_comment_logger_1a59781e14045bed794cb4f5f930e397af) | 

### Members

#### `public virtual void `[`debug`](#classmicrosoft_1_1quantum_1_1_comment_logger_1a14d9062cc652849a0fa88fbc256067cd)`(String const & message)` {#classmicrosoft_1_1quantum_1_1_comment_logger_1a14d9062cc652849a0fa88fbc256067cd}

Adds a debug message to the list.

#### `public virtual void `[`info`](#classmicrosoft_1_1quantum_1_1_comment_logger_1a1aba56032627b859cde4a5f0c7c5c359)`(String const & message)` {#classmicrosoft_1_1quantum_1_1_comment_logger_1a1aba56032627b859cde4a5f0c7c5c359}

Adds an info message to the list.

#### `public virtual void `[`warning`](#classmicrosoft_1_1quantum_1_1_comment_logger_1aa86a0a2240efc90df6e16b7454505f8e)`(String const & message)` {#classmicrosoft_1_1quantum_1_1_comment_logger_1aa86a0a2240efc90df6e16b7454505f8e}

Adds a warning message to the list.

#### `public virtual void `[`error`](#classmicrosoft_1_1quantum_1_1_comment_logger_1a581501a0a86a5f56474b94e43710599e)`(String const & message)` {#classmicrosoft_1_1quantum_1_1_comment_logger_1a581501a0a86a5f56474b94e43710599e}

Adds an error message to the list.

#### `public virtual void `[`internalError`](#classmicrosoft_1_1quantum_1_1_comment_logger_1ad57d890561e4b79395f5f8ce100f01c9)`(String const & message)` {#classmicrosoft_1_1quantum_1_1_comment_logger_1ad57d890561e4b79395f5f8ce100f01c9}

Adds an internal error message to the list.

#### `public virtual void `[`setLocation`](#classmicrosoft_1_1quantum_1_1_comment_logger_1a33f3ab1fa8133b84474ac50def208baa)`(String const & name,uint64_t row,uint64_t col)` {#classmicrosoft_1_1quantum_1_1_comment_logger_1a33f3ab1fa8133b84474ac50def208baa}

Function that allows to set the current location.

#### `private String `[`location_name_`](#classmicrosoft_1_1quantum_1_1_comment_logger_1ab8a5ca77482c538b9611daf478f1fc80) {#classmicrosoft_1_1quantum_1_1_comment_logger_1ab8a5ca77482c538b9611daf478f1fc80}

#### `private uint64_t `[`location_row_`](#classmicrosoft_1_1quantum_1_1_comment_logger_1af5f5319c88f800998ab2ed78ad7a7cb7) {#classmicrosoft_1_1quantum_1_1_comment_logger_1af5f5319c88f800998ab2ed78ad7a7cb7}

#### `private uint64_t `[`location_col_`](#classmicrosoft_1_1quantum_1_1_comment_logger_1a59781e14045bed794cb4f5f930e397af) {#classmicrosoft_1_1quantum_1_1_comment_logger_1a59781e14045bed794cb4f5f930e397af}

## class `microsoft::quantum::ILogger` {#classmicrosoft_1_1quantum_1_1_i_logger}

Logger interface to allow the collection of different types of messages during QIR transformation and/or validation.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger_1a55e7a7d863df6b0fff0ddaed3c391b1c)`() = default` | 
`public  `[`ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger_1a2a5e5904c7923ba45fbf16fb63458d00)`(`[`ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger)` const &) = default` | 
`public  `[`ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger_1afca368c3ab3390324cd44cf80381f045)`(`[`ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger)` &&) = default` | 
`public `[`ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_i_logger_1a10dc85acccfb41d71f1fd447a840ad9a)`(`[`ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger)` const &) = default` | 
`public `[`ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_i_logger_1ac08799390f3411fe416364cebf663cac)`(`[`ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger)` &&) = default` | 
`public virtual  `[`~ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger_1a2a0c328088870ccf8f658a66b3642d38)`()` | 
`public void `[`debug`](#classmicrosoft_1_1quantum_1_1_i_logger_1ad4b3d523d70a898a41ac232a798c283b)`(String const & message)` | Reports a debug message.
`public void `[`info`](#classmicrosoft_1_1quantum_1_1_i_logger_1adc71a69251d09da76acca8e7be6c60b5)`(String const & message)` | Reports an info message.
`public void `[`warning`](#classmicrosoft_1_1quantum_1_1_i_logger_1a2bf3c83b9cab41858359ef3e68d5e602)`(String const & message)` | Reports a warning message.
`public void `[`error`](#classmicrosoft_1_1quantum_1_1_i_logger_1a2554154ca0367271c8e0d8cb5e33a92e)`(String const & message)` | Reports an error message.
`public void `[`internalError`](#classmicrosoft_1_1quantum_1_1_i_logger_1ae35be2c1c382efd0ba64115bad725415)`(String const & message)` | Reports an internal error message.
`public void `[`setLocation`](#classmicrosoft_1_1quantum_1_1_i_logger_1a93a18ddd4a47de3ea1aa007dc5064a7b)`(String const & name,uint64_t row,uint64_t col)` | Sets the current location. Importantly, the location can be set independently of the reported messages. This allows one to update the location upon updating the cursor position without having to worry about keeping a copy of the location to pass when reporting messages. The most obvious case of this is file path (name) with a line and character (row, col).

### Members

#### `public  `[`ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger_1a55e7a7d863df6b0fff0ddaed3c391b1c)`() = default` {#classmicrosoft_1_1quantum_1_1_i_logger_1a55e7a7d863df6b0fff0ddaed3c391b1c}

#### `public  `[`ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger_1a2a5e5904c7923ba45fbf16fb63458d00)`(`[`ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger)` const &) = default` {#classmicrosoft_1_1quantum_1_1_i_logger_1a2a5e5904c7923ba45fbf16fb63458d00}

#### `public  `[`ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger_1afca368c3ab3390324cd44cf80381f045)`(`[`ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger)` &&) = default` {#classmicrosoft_1_1quantum_1_1_i_logger_1afca368c3ab3390324cd44cf80381f045}

#### `public `[`ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_i_logger_1a10dc85acccfb41d71f1fd447a840ad9a)`(`[`ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger)` const &) = default` {#classmicrosoft_1_1quantum_1_1_i_logger_1a10dc85acccfb41d71f1fd447a840ad9a}

#### `public `[`ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_i_logger_1ac08799390f3411fe416364cebf663cac)`(`[`ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger)` &&) = default` {#classmicrosoft_1_1quantum_1_1_i_logger_1ac08799390f3411fe416364cebf663cac}

#### `public virtual  `[`~ILogger`](#classmicrosoft_1_1quantum_1_1_i_logger_1a2a0c328088870ccf8f658a66b3642d38)`()` {#classmicrosoft_1_1quantum_1_1_i_logger_1a2a0c328088870ccf8f658a66b3642d38}

#### `public void `[`debug`](#classmicrosoft_1_1quantum_1_1_i_logger_1ad4b3d523d70a898a41ac232a798c283b)`(String const & message)` {#classmicrosoft_1_1quantum_1_1_i_logger_1ad4b3d523d70a898a41ac232a798c283b}

Reports a debug message.

#### `public void `[`info`](#classmicrosoft_1_1quantum_1_1_i_logger_1adc71a69251d09da76acca8e7be6c60b5)`(String const & message)` {#classmicrosoft_1_1quantum_1_1_i_logger_1adc71a69251d09da76acca8e7be6c60b5}

Reports an info message.

#### `public void `[`warning`](#classmicrosoft_1_1quantum_1_1_i_logger_1a2bf3c83b9cab41858359ef3e68d5e602)`(String const & message)` {#classmicrosoft_1_1quantum_1_1_i_logger_1a2bf3c83b9cab41858359ef3e68d5e602}

Reports a warning message.

#### `public void `[`error`](#classmicrosoft_1_1quantum_1_1_i_logger_1a2554154ca0367271c8e0d8cb5e33a92e)`(String const & message)` {#classmicrosoft_1_1quantum_1_1_i_logger_1a2554154ca0367271c8e0d8cb5e33a92e}

Reports an error message.

#### `public void `[`internalError`](#classmicrosoft_1_1quantum_1_1_i_logger_1ae35be2c1c382efd0ba64115bad725415)`(String const & message)` {#classmicrosoft_1_1quantum_1_1_i_logger_1ae35be2c1c382efd0ba64115bad725415}

Reports an internal error message.

#### `public void `[`setLocation`](#classmicrosoft_1_1quantum_1_1_i_logger_1a93a18ddd4a47de3ea1aa007dc5064a7b)`(String const & name,uint64_t row,uint64_t col)` {#classmicrosoft_1_1quantum_1_1_i_logger_1a93a18ddd4a47de3ea1aa007dc5064a7b}

Sets the current location. Importantly, the location can be set independently of the reported messages. This allows one to update the location upon updating the cursor position without having to worry about keeping a copy of the location to pass when reporting messages. The most obvious case of this is file path (name) with a line and character (row, col).

## class `microsoft::quantum::LogCollection` {#classmicrosoft_1_1quantum_1_1_log_collection}

```
class microsoft::quantum::LogCollection
  : public microsoft::quantum::ILogger
```

Concrete [ILogger](#classmicrosoft_1_1quantum_1_1_i_logger) implementation that collects all messages and their corresponding location in a list that can be traversed later on.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public virtual void `[`debug`](#classmicrosoft_1_1quantum_1_1_log_collection_1ae1611b74f5f89836a32f45becd19ae65)`(String const & message)` | Adds a debug message to the list.
`public virtual void `[`info`](#classmicrosoft_1_1quantum_1_1_log_collection_1a3d59bd8a9acf1cd0a647cc2428bb53fa)`(String const & message)` | Adds an info message to the list.
`public virtual void `[`warning`](#classmicrosoft_1_1quantum_1_1_log_collection_1ad12313dc42bbefef79db2efdd2a13b1f)`(String const & message)` | Adds a warning message to the list.
`public virtual void `[`error`](#classmicrosoft_1_1quantum_1_1_log_collection_1a3ccc0b418d809e8bc86c66bbbff8faf0)`(String const & message)` | Adds an error message to the list.
`public virtual void `[`internalError`](#classmicrosoft_1_1quantum_1_1_log_collection_1a94e877100b2d7d4cb1d6e22075238e0a)`(String const & message)` | Adds an internal error message to the list.
`public virtual void `[`setLocation`](#classmicrosoft_1_1quantum_1_1_log_collection_1a88bb68267f9b07f7798fbb080838f0e4)`(String const & name,uint64_t row,uint64_t col)` | Function that allows to set the current location.
`public `[`Messages`](#classmicrosoft_1_1quantum_1_1_log_collection_1a768acf247c9c42e50789812548740b7b)` const  & `[`messages`](#classmicrosoft_1_1quantum_1_1_log_collection_1ab15808df328ec4527b2cbbdc8c9269e1)`() const` | Accessor to the messages.
`enum `[`Type`](#classmicrosoft_1_1quantum_1_1_log_collection_1a8b5d562fd58a95348898743509c8678f) | Enum description what type of information we are conveying.
`typedef `[`Messages`](#classmicrosoft_1_1quantum_1_1_log_collection_1a768acf247c9c42e50789812548740b7b) | List of messages defined as alias.
`private `[`Location`](#structmicrosoft_1_1quantum_1_1_log_collection_1_1_location)` `[`current_location_`](#classmicrosoft_1_1quantum_1_1_log_collection_1a3e927e09a746f599551f9cbb0d0e982a) | Holds current location.
`private `[`Messages`](#classmicrosoft_1_1quantum_1_1_log_collection_1a768acf247c9c42e50789812548740b7b)` `[`messages_`](#classmicrosoft_1_1quantum_1_1_log_collection_1aa8782a1279b6cab470bf7fa69c775c0b) | All messages emitted.

### Members

#### `public virtual void `[`debug`](#classmicrosoft_1_1quantum_1_1_log_collection_1ae1611b74f5f89836a32f45becd19ae65)`(String const & message)` {#classmicrosoft_1_1quantum_1_1_log_collection_1ae1611b74f5f89836a32f45becd19ae65}

Adds a debug message to the list.

#### `public virtual void `[`info`](#classmicrosoft_1_1quantum_1_1_log_collection_1a3d59bd8a9acf1cd0a647cc2428bb53fa)`(String const & message)` {#classmicrosoft_1_1quantum_1_1_log_collection_1a3d59bd8a9acf1cd0a647cc2428bb53fa}

Adds an info message to the list.

#### `public virtual void `[`warning`](#classmicrosoft_1_1quantum_1_1_log_collection_1ad12313dc42bbefef79db2efdd2a13b1f)`(String const & message)` {#classmicrosoft_1_1quantum_1_1_log_collection_1ad12313dc42bbefef79db2efdd2a13b1f}

Adds a warning message to the list.

#### `public virtual void `[`error`](#classmicrosoft_1_1quantum_1_1_log_collection_1a3ccc0b418d809e8bc86c66bbbff8faf0)`(String const & message)` {#classmicrosoft_1_1quantum_1_1_log_collection_1a3ccc0b418d809e8bc86c66bbbff8faf0}

Adds an error message to the list.

#### `public virtual void `[`internalError`](#classmicrosoft_1_1quantum_1_1_log_collection_1a94e877100b2d7d4cb1d6e22075238e0a)`(String const & message)` {#classmicrosoft_1_1quantum_1_1_log_collection_1a94e877100b2d7d4cb1d6e22075238e0a}

Adds an internal error message to the list.

#### `public virtual void `[`setLocation`](#classmicrosoft_1_1quantum_1_1_log_collection_1a88bb68267f9b07f7798fbb080838f0e4)`(String const & name,uint64_t row,uint64_t col)` {#classmicrosoft_1_1quantum_1_1_log_collection_1a88bb68267f9b07f7798fbb080838f0e4}

Function that allows to set the current location.

#### `public `[`Messages`](#classmicrosoft_1_1quantum_1_1_log_collection_1a768acf247c9c42e50789812548740b7b)` const  & `[`messages`](#classmicrosoft_1_1quantum_1_1_log_collection_1ab15808df328ec4527b2cbbdc8c9269e1)`() const` {#classmicrosoft_1_1quantum_1_1_log_collection_1ab15808df328ec4527b2cbbdc8c9269e1}

Accessor to the messages.

#### `enum `[`Type`](#classmicrosoft_1_1quantum_1_1_log_collection_1a8b5d562fd58a95348898743509c8678f) {#classmicrosoft_1_1quantum_1_1_log_collection_1a8b5d562fd58a95348898743509c8678f}

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Debug            | 
Info            | 
Warning            | 
Error            | 
InternalError            | 

Enum description what type of information we are conveying.

#### `typedef `[`Messages`](#classmicrosoft_1_1quantum_1_1_log_collection_1a768acf247c9c42e50789812548740b7b) {#classmicrosoft_1_1quantum_1_1_log_collection_1a768acf247c9c42e50789812548740b7b}

List of messages defined as alias.

#### `private `[`Location`](#structmicrosoft_1_1quantum_1_1_log_collection_1_1_location)` `[`current_location_`](#classmicrosoft_1_1quantum_1_1_log_collection_1a3e927e09a746f599551f9cbb0d0e982a) {#classmicrosoft_1_1quantum_1_1_log_collection_1a3e927e09a746f599551f9cbb0d0e982a}

Holds current location.

#### `private `[`Messages`](#classmicrosoft_1_1quantum_1_1_log_collection_1a768acf247c9c42e50789812548740b7b)` `[`messages_`](#classmicrosoft_1_1quantum_1_1_log_collection_1aa8782a1279b6cab470bf7fa69c775c0b) {#classmicrosoft_1_1quantum_1_1_log_collection_1aa8782a1279b6cab470bf7fa69c775c0b}

All messages emitted.

## class `microsoft::quantum::ModuleLoader` {#classmicrosoft_1_1quantum_1_1_module_loader}

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public inline  explicit `[`ModuleLoader`](#classmicrosoft_1_1quantum_1_1_module_loader_1a800df541b482f66141f9c7b8a4ae7c16)`(Module * final_module)` | 
`public inline bool `[`addModule`](#classmicrosoft_1_1quantum_1_1_module_loader_1aa9b7ea0111e059283da76a8505900785)`(std::unique_ptr< Module > && module,String const & filename)` | 
`public inline bool `[`addIrFile`](#classmicrosoft_1_1quantum_1_1_module_loader_1a9337b976a75e32f0bdb8aa4c16927c68)`(String const & filename)` | 
`typedef `[`Module`](#classmicrosoft_1_1quantum_1_1_module_loader_1a742c8b5ec327f6a1b2a81335b02aa019) | 
`typedef `[`Linker`](#classmicrosoft_1_1quantum_1_1_module_loader_1a870fc6112d429a13ca0d5ed2588988c6) | 
`typedef `[`SMDiagnostic`](#classmicrosoft_1_1quantum_1_1_module_loader_1ad54ed1e8834040fb08735c3aae738eee) | 
`private Module * `[`final_module_`](#classmicrosoft_1_1quantum_1_1_module_loader_1af267f511a67f5f141e651e1ef5afcffd) | 
`private Linker `[`linker_`](#classmicrosoft_1_1quantum_1_1_module_loader_1a2ffc9f495d8176b1e69926dff11405ba) | 

### Members

#### `public inline  explicit `[`ModuleLoader`](#classmicrosoft_1_1quantum_1_1_module_loader_1a800df541b482f66141f9c7b8a4ae7c16)`(Module * final_module)` {#classmicrosoft_1_1quantum_1_1_module_loader_1a800df541b482f66141f9c7b8a4ae7c16}

#### `public inline bool `[`addModule`](#classmicrosoft_1_1quantum_1_1_module_loader_1aa9b7ea0111e059283da76a8505900785)`(std::unique_ptr< Module > && module,String const & filename)` {#classmicrosoft_1_1quantum_1_1_module_loader_1aa9b7ea0111e059283da76a8505900785}

#### `public inline bool `[`addIrFile`](#classmicrosoft_1_1quantum_1_1_module_loader_1a9337b976a75e32f0bdb8aa4c16927c68)`(String const & filename)` {#classmicrosoft_1_1quantum_1_1_module_loader_1a9337b976a75e32f0bdb8aa4c16927c68}

#### `typedef `[`Module`](#classmicrosoft_1_1quantum_1_1_module_loader_1a742c8b5ec327f6a1b2a81335b02aa019) {#classmicrosoft_1_1quantum_1_1_module_loader_1a742c8b5ec327f6a1b2a81335b02aa019}

#### `typedef `[`Linker`](#classmicrosoft_1_1quantum_1_1_module_loader_1a870fc6112d429a13ca0d5ed2588988c6) {#classmicrosoft_1_1quantum_1_1_module_loader_1a870fc6112d429a13ca0d5ed2588988c6}

#### `typedef `[`SMDiagnostic`](#classmicrosoft_1_1quantum_1_1_module_loader_1ad54ed1e8834040fb08735c3aae738eee) {#classmicrosoft_1_1quantum_1_1_module_loader_1ad54ed1e8834040fb08735c3aae738eee}

#### `private Module * `[`final_module_`](#classmicrosoft_1_1quantum_1_1_module_loader_1af267f511a67f5f141e651e1ef5afcffd) {#classmicrosoft_1_1quantum_1_1_module_loader_1af267f511a67f5f141e651e1ef5afcffd}

#### `private Linker `[`linker_`](#classmicrosoft_1_1quantum_1_1_module_loader_1a2ffc9f495d8176b1e69926dff11405ba) {#classmicrosoft_1_1quantum_1_1_module_loader_1a2ffc9f495d8176b1e69926dff11405ba}

## class `microsoft::quantum::Profile` {#classmicrosoft_1_1quantum_1_1_profile}

[Profile](#classmicrosoft_1_1quantum_1_1_profile) class that defines a set of rules which constitutes the profile definition. Each of the rules can be used to transform a generic QIR and/or validate that the QIR is compliant with said rule.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  explicit `[`Profile`](#classmicrosoft_1_1quantum_1_1_profile_1acb31c2ea1c22ca72f66bb7330ce47219)`(String const & name,bool debug,llvm::TargetMachine * target_machine,`[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_profile_1afbb7b83f602e4746a4912a5e47658304)` qubit_allocation_manager,`[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_profile_1afbb7b83f602e4746a4912a5e47658304)` result_allocation_manager)` | 
`public  `[`Profile`](#classmicrosoft_1_1quantum_1_1_profile_1a522c423454556e7715608dd953b56d74)`() = delete` | 
`public  `[`Profile`](#classmicrosoft_1_1quantum_1_1_profile_1a0efc48be86de9271b6d4d2f89f35a346)`(`[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` const &) = delete` | 
`public  `[`Profile`](#classmicrosoft_1_1quantum_1_1_profile_1aedeebca308bc1e8cf7576c74ec3ab569)`(`[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` &&) = default` | 
`public `[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_profile_1ae85a88f88a5d04c7ca6e55953ed9c2a2)`(`[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` const &) = delete` | 
`public `[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_profile_1a9c519bde17a927216de63cedc07a3099)`(`[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` &&) = default` | 
`public  `[`~Profile`](#classmicrosoft_1_1quantum_1_1_profile_1a3071a7b8da17a5ce9c578e85b41b53a1)`() = default` | 
`public void `[`apply`](#classmicrosoft_1_1quantum_1_1_profile_1a4e15a93d7b5f5d7174e8c63947787ffb)`(llvm::Module & module)` | Applies the profile to a module.
`public bool `[`verify`](#classmicrosoft_1_1quantum_1_1_profile_1a2df872e9e0d0cfa7c1261e25a32fb501)`(llvm::Module & module)` | Verifies that a module is a valid LLVM IR.
`public bool `[`validate`](#classmicrosoft_1_1quantum_1_1_profile_1ae4264aceff4ee846d62a500329b4d0e2)`(llvm::Module & module)` | Validates that a module complies with the specified QIR profile.
`public `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_profile_1afbb7b83f602e4746a4912a5e47658304)` `[`getQubitAllocationManager`](#classmicrosoft_1_1quantum_1_1_profile_1a0ca2882f9d1c98a5bee120ae96048e87)`()` | 
`public `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_profile_1afbb7b83f602e4746a4912a5e47658304)` `[`getResultAllocationManager`](#classmicrosoft_1_1quantum_1_1_profile_1a299ab1ffa4fea7cf6ad45ee4a690bf2f)`()` | 
`public String const  & `[`name`](#classmicrosoft_1_1quantum_1_1_profile_1a036cd42956f72e095b1c5c09ad21ea88)`() const` | 
`protected void `[`setModulePassManager`](#classmicrosoft_1_1quantum_1_1_profile_1a789d98dc3ff0c7900a5e752aac80a4dd)`(llvm::ModulePassManager && manager)` | Sets the module pass manager used for the transformation of the IR.
`protected void `[`setValidator`](#classmicrosoft_1_1quantum_1_1_profile_1a7064cdc9c5b0673d27b01d12f23c3528)`(`[`ValidatorPtr`](#classmicrosoft_1_1quantum_1_1_profile_1aecedd32ceddf4b4058c6a0c7f74aa386)` && validator)` | Sets the validator.
`protected llvm::PassBuilder & `[`passBuilder`](#classmicrosoft_1_1quantum_1_1_profile_1ab3226330daa11ac92dc8ec243d8a14b7)`()` | Returns a reference to the pass builder.
`protected llvm::LoopAnalysisManager & `[`loopAnalysisManager`](#classmicrosoft_1_1quantum_1_1_profile_1a7e72137e5679ffc344504a8259a2480a)`()` | Returns a reference to the loop analysis manager.
`protected llvm::FunctionAnalysisManager & `[`functionAnalysisManager`](#classmicrosoft_1_1quantum_1_1_profile_1afde169bb2afbf338563bcd6f7afaf06a)`()` | Returns a reference to the function analysis manager.
`protected llvm::CGSCCAnalysisManager & `[`gsccAnalysisManager`](#classmicrosoft_1_1quantum_1_1_profile_1aacd449e39f53fc37829826a9c71b78ae)`()` | Returns a reference to the GSCC analysis manager.
`protected llvm::ModuleAnalysisManager & `[`moduleAnalysisManager`](#classmicrosoft_1_1quantum_1_1_profile_1a9be63ecec09cad26dfc1c99e54845bee)`()` | Returns a reference to the module analysis manager.
`typedef `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_profile_1afbb7b83f602e4746a4912a5e47658304) | Allocation manager pointer type. Used to reference to concrete allocation manager implementations which defines the allocation logic of the profile.
`typedef `[`ValidatorPtr`](#classmicrosoft_1_1quantum_1_1_profile_1aecedd32ceddf4b4058c6a0c7f74aa386) | [Validator](#classmicrosoft_1_1quantum_1_1_validator) class used to check that an IR fulfils a given specification.
`private String `[`name_`](#classmicrosoft_1_1quantum_1_1_profile_1a046f7549d816bec4c2f1d4398b7cf54e) | Name of the selected profile.
`private llvm::LoopAnalysisManager `[`loop_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_profile_1ae0b3d690ca7eaefe6acdccc7b6e6f55e) | 
`private llvm::FunctionAnalysisManager `[`function_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_profile_1a2506a7af76adfc5f4e6b65f2e1d9fb01) | 
`private llvm::CGSCCAnalysisManager `[`gscc_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_profile_1a8aeadc987d5e8803e34ed76b65795e6f) | 
`private llvm::ModuleAnalysisManager `[`module_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_profile_1a82c358017bc12cd2e64b2130ada91efd) | 
`private llvm::Optional< llvm::PGOOptions > `[`pgo_options_`](#classmicrosoft_1_1quantum_1_1_profile_1a65de6ba97fefc071b4932cea8d278193) | 
`private PassInstrumentationCallbacksPtr `[`pass_instrumentation_callbacks_`](#classmicrosoft_1_1quantum_1_1_profile_1a1a8f73cf8b3f0dc7ce0b8531ae0c8cc3) | 
`private StandardInstrumentationsPtr `[`standard_instrumentations_`](#classmicrosoft_1_1quantum_1_1_profile_1addf422a94ee1999710cc1a5c846f9131) | 
`private llvm::PipelineTuningOptions `[`pipeline_tuning_options_`](#classmicrosoft_1_1quantum_1_1_profile_1ac367294fcb04a5c034424a3be0ad13db) | 
`private PassBuilderPtr `[`pass_builder_`](#classmicrosoft_1_1quantum_1_1_profile_1a54b6d8bb40deb82d5b6e4eb196a74af6) | 
`private llvm::ModulePassManager `[`module_pass_manager_`](#classmicrosoft_1_1quantum_1_1_profile_1a242e97e7813386438df13c3c336af9b6) | 
`private `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_profile_1afbb7b83f602e4746a4912a5e47658304)` `[`qubit_allocation_manager_`](#classmicrosoft_1_1quantum_1_1_profile_1a7b69a4e439b1d11cb5d76e6ef8944ba6) | Interface pointer to the qubit allocation manager. Mode of operation depends on the concrete implementation of the manager which is swappable through the interface.
`private `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_profile_1afbb7b83f602e4746a4912a5e47658304)` `[`result_allocation_manager_`](#classmicrosoft_1_1quantum_1_1_profile_1a12722216b4851b6050e8ba096641efcd) | Interface pointer to the results allocation manager. Again here the manager behaviour is determined by its implementation details.
`private `[`ValidatorPtr`](#classmicrosoft_1_1quantum_1_1_profile_1aecedd32ceddf4b4058c6a0c7f74aa386)` `[`validator_`](#classmicrosoft_1_1quantum_1_1_profile_1a6e62cb294523d19f0ccefb829e5502a3) | 
`private std::string `[`peephole_ep_pipeline_`](#classmicrosoft_1_1quantum_1_1_profile_1a95979cdc42e787aa7b7154d8f4700672) | 
`private std::string `[`late_loop_optimizations_ep_pipeline_`](#classmicrosoft_1_1quantum_1_1_profile_1a4b3400f3d8033510b18811c0e0f78e26) | 
`private std::string `[`loop_optimizer_end_ep_pipeline_`](#classmicrosoft_1_1quantum_1_1_profile_1a77d8e46a836e06d704718ecb1e6ecbd2) | 
`private std::string `[`scalar_optimizer_late_ep_pipeline_`](#classmicrosoft_1_1quantum_1_1_profile_1a60487e2a6ee5269b9110945cac5de2c7) | 
`private std::string `[`cgscc_optimizer_late_ep_pipeline_`](#classmicrosoft_1_1quantum_1_1_profile_1a9bfeba36b354d8e21e98c500aeb45ca1) | 
`private std::string `[`vectorizer_start_ep_pipeline_`](#classmicrosoft_1_1quantum_1_1_profile_1a5c39c134ef9b82dcaeb7ec76ebe48080) | 
`private std::string `[`pipeline_start_ep_pipeline_`](#classmicrosoft_1_1quantum_1_1_profile_1a272ddc0ca5d22e11fa642d792407525f) | 
`private std::string `[`optimizer_last_ep_pipeline_`](#classmicrosoft_1_1quantum_1_1_profile_1a23499fdbae5b24d3da97d6f27a60b8bd) | 
`private void `[`registerEPCallbacks`](#classmicrosoft_1_1quantum_1_1_profile_1a2bddd50225c9b1e57d05ab6f8c1683f3)`(bool verify_each_pass,bool debug)` | 
`private template<>`  <br/>`inline bool `[`tryParsePipelineText`](#classmicrosoft_1_1quantum_1_1_profile_1a3b75a516d8c488c76ac9bf8ff0f990d3)`(llvm::PassBuilder & pass_builder,std::string const & pipeline_options)` | 

### Members

#### `public  explicit `[`Profile`](#classmicrosoft_1_1quantum_1_1_profile_1acb31c2ea1c22ca72f66bb7330ce47219)`(String const & name,bool debug,llvm::TargetMachine * target_machine,`[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_profile_1afbb7b83f602e4746a4912a5e47658304)` qubit_allocation_manager,`[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_profile_1afbb7b83f602e4746a4912a5e47658304)` result_allocation_manager)` {#classmicrosoft_1_1quantum_1_1_profile_1acb31c2ea1c22ca72f66bb7330ce47219}

#### `public  `[`Profile`](#classmicrosoft_1_1quantum_1_1_profile_1a522c423454556e7715608dd953b56d74)`() = delete` {#classmicrosoft_1_1quantum_1_1_profile_1a522c423454556e7715608dd953b56d74}

#### `public  `[`Profile`](#classmicrosoft_1_1quantum_1_1_profile_1a0efc48be86de9271b6d4d2f89f35a346)`(`[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_profile_1a0efc48be86de9271b6d4d2f89f35a346}

#### `public  `[`Profile`](#classmicrosoft_1_1quantum_1_1_profile_1aedeebca308bc1e8cf7576c74ec3ab569)`(`[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` &&) = default` {#classmicrosoft_1_1quantum_1_1_profile_1aedeebca308bc1e8cf7576c74ec3ab569}

#### `public `[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_profile_1ae85a88f88a5d04c7ca6e55953ed9c2a2)`(`[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_profile_1ae85a88f88a5d04c7ca6e55953ed9c2a2}

#### `public `[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_profile_1a9c519bde17a927216de63cedc07a3099)`(`[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` &&) = default` {#classmicrosoft_1_1quantum_1_1_profile_1a9c519bde17a927216de63cedc07a3099}

#### `public  `[`~Profile`](#classmicrosoft_1_1quantum_1_1_profile_1a3071a7b8da17a5ce9c578e85b41b53a1)`() = default` {#classmicrosoft_1_1quantum_1_1_profile_1a3071a7b8da17a5ce9c578e85b41b53a1}

#### `public void `[`apply`](#classmicrosoft_1_1quantum_1_1_profile_1a4e15a93d7b5f5d7174e8c63947787ffb)`(llvm::Module & module)` {#classmicrosoft_1_1quantum_1_1_profile_1a4e15a93d7b5f5d7174e8c63947787ffb}

Applies the profile to a module.

#### `public bool `[`verify`](#classmicrosoft_1_1quantum_1_1_profile_1a2df872e9e0d0cfa7c1261e25a32fb501)`(llvm::Module & module)` {#classmicrosoft_1_1quantum_1_1_profile_1a2df872e9e0d0cfa7c1261e25a32fb501}

Verifies that a module is a valid LLVM IR.

#### `public bool `[`validate`](#classmicrosoft_1_1quantum_1_1_profile_1ae4264aceff4ee846d62a500329b4d0e2)`(llvm::Module & module)` {#classmicrosoft_1_1quantum_1_1_profile_1ae4264aceff4ee846d62a500329b4d0e2}

Validates that a module complies with the specified QIR profile.

#### `public `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_profile_1afbb7b83f602e4746a4912a5e47658304)` `[`getQubitAllocationManager`](#classmicrosoft_1_1quantum_1_1_profile_1a0ca2882f9d1c98a5bee120ae96048e87)`()` {#classmicrosoft_1_1quantum_1_1_profile_1a0ca2882f9d1c98a5bee120ae96048e87}

#### `public `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_profile_1afbb7b83f602e4746a4912a5e47658304)` `[`getResultAllocationManager`](#classmicrosoft_1_1quantum_1_1_profile_1a299ab1ffa4fea7cf6ad45ee4a690bf2f)`()` {#classmicrosoft_1_1quantum_1_1_profile_1a299ab1ffa4fea7cf6ad45ee4a690bf2f}

#### `public String const  & `[`name`](#classmicrosoft_1_1quantum_1_1_profile_1a036cd42956f72e095b1c5c09ad21ea88)`() const` {#classmicrosoft_1_1quantum_1_1_profile_1a036cd42956f72e095b1c5c09ad21ea88}

#### `protected void `[`setModulePassManager`](#classmicrosoft_1_1quantum_1_1_profile_1a789d98dc3ff0c7900a5e752aac80a4dd)`(llvm::ModulePassManager && manager)` {#classmicrosoft_1_1quantum_1_1_profile_1a789d98dc3ff0c7900a5e752aac80a4dd}

Sets the module pass manager used for the transformation of the IR.

#### `protected void `[`setValidator`](#classmicrosoft_1_1quantum_1_1_profile_1a7064cdc9c5b0673d27b01d12f23c3528)`(`[`ValidatorPtr`](#classmicrosoft_1_1quantum_1_1_profile_1aecedd32ceddf4b4058c6a0c7f74aa386)` && validator)` {#classmicrosoft_1_1quantum_1_1_profile_1a7064cdc9c5b0673d27b01d12f23c3528}

Sets the validator.

#### `protected llvm::PassBuilder & `[`passBuilder`](#classmicrosoft_1_1quantum_1_1_profile_1ab3226330daa11ac92dc8ec243d8a14b7)`()` {#classmicrosoft_1_1quantum_1_1_profile_1ab3226330daa11ac92dc8ec243d8a14b7}

Returns a reference to the pass builder.

#### `protected llvm::LoopAnalysisManager & `[`loopAnalysisManager`](#classmicrosoft_1_1quantum_1_1_profile_1a7e72137e5679ffc344504a8259a2480a)`()` {#classmicrosoft_1_1quantum_1_1_profile_1a7e72137e5679ffc344504a8259a2480a}

Returns a reference to the loop analysis manager.

#### `protected llvm::FunctionAnalysisManager & `[`functionAnalysisManager`](#classmicrosoft_1_1quantum_1_1_profile_1afde169bb2afbf338563bcd6f7afaf06a)`()` {#classmicrosoft_1_1quantum_1_1_profile_1afde169bb2afbf338563bcd6f7afaf06a}

Returns a reference to the function analysis manager.

#### `protected llvm::CGSCCAnalysisManager & `[`gsccAnalysisManager`](#classmicrosoft_1_1quantum_1_1_profile_1aacd449e39f53fc37829826a9c71b78ae)`()` {#classmicrosoft_1_1quantum_1_1_profile_1aacd449e39f53fc37829826a9c71b78ae}

Returns a reference to the GSCC analysis manager.

#### `protected llvm::ModuleAnalysisManager & `[`moduleAnalysisManager`](#classmicrosoft_1_1quantum_1_1_profile_1a9be63ecec09cad26dfc1c99e54845bee)`()` {#classmicrosoft_1_1quantum_1_1_profile_1a9be63ecec09cad26dfc1c99e54845bee}

Returns a reference to the module analysis manager.

#### `typedef `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_profile_1afbb7b83f602e4746a4912a5e47658304) {#classmicrosoft_1_1quantum_1_1_profile_1afbb7b83f602e4746a4912a5e47658304}

Allocation manager pointer type. Used to reference to concrete allocation manager implementations which defines the allocation logic of the profile.

#### `typedef `[`ValidatorPtr`](#classmicrosoft_1_1quantum_1_1_profile_1aecedd32ceddf4b4058c6a0c7f74aa386) {#classmicrosoft_1_1quantum_1_1_profile_1aecedd32ceddf4b4058c6a0c7f74aa386}

[Validator](#classmicrosoft_1_1quantum_1_1_validator) class used to check that an IR fulfils a given specification.

#### `private String `[`name_`](#classmicrosoft_1_1quantum_1_1_profile_1a046f7549d816bec4c2f1d4398b7cf54e) {#classmicrosoft_1_1quantum_1_1_profile_1a046f7549d816bec4c2f1d4398b7cf54e}

Name of the selected profile.

#### `private llvm::LoopAnalysisManager `[`loop_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_profile_1ae0b3d690ca7eaefe6acdccc7b6e6f55e) {#classmicrosoft_1_1quantum_1_1_profile_1ae0b3d690ca7eaefe6acdccc7b6e6f55e}

#### `private llvm::FunctionAnalysisManager `[`function_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_profile_1a2506a7af76adfc5f4e6b65f2e1d9fb01) {#classmicrosoft_1_1quantum_1_1_profile_1a2506a7af76adfc5f4e6b65f2e1d9fb01}

#### `private llvm::CGSCCAnalysisManager `[`gscc_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_profile_1a8aeadc987d5e8803e34ed76b65795e6f) {#classmicrosoft_1_1quantum_1_1_profile_1a8aeadc987d5e8803e34ed76b65795e6f}

#### `private llvm::ModuleAnalysisManager `[`module_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_profile_1a82c358017bc12cd2e64b2130ada91efd) {#classmicrosoft_1_1quantum_1_1_profile_1a82c358017bc12cd2e64b2130ada91efd}

#### `private llvm::Optional< llvm::PGOOptions > `[`pgo_options_`](#classmicrosoft_1_1quantum_1_1_profile_1a65de6ba97fefc071b4932cea8d278193) {#classmicrosoft_1_1quantum_1_1_profile_1a65de6ba97fefc071b4932cea8d278193}

#### `private PassInstrumentationCallbacksPtr `[`pass_instrumentation_callbacks_`](#classmicrosoft_1_1quantum_1_1_profile_1a1a8f73cf8b3f0dc7ce0b8531ae0c8cc3) {#classmicrosoft_1_1quantum_1_1_profile_1a1a8f73cf8b3f0dc7ce0b8531ae0c8cc3}

#### `private StandardInstrumentationsPtr `[`standard_instrumentations_`](#classmicrosoft_1_1quantum_1_1_profile_1addf422a94ee1999710cc1a5c846f9131) {#classmicrosoft_1_1quantum_1_1_profile_1addf422a94ee1999710cc1a5c846f9131}

#### `private llvm::PipelineTuningOptions `[`pipeline_tuning_options_`](#classmicrosoft_1_1quantum_1_1_profile_1ac367294fcb04a5c034424a3be0ad13db) {#classmicrosoft_1_1quantum_1_1_profile_1ac367294fcb04a5c034424a3be0ad13db}

#### `private PassBuilderPtr `[`pass_builder_`](#classmicrosoft_1_1quantum_1_1_profile_1a54b6d8bb40deb82d5b6e4eb196a74af6) {#classmicrosoft_1_1quantum_1_1_profile_1a54b6d8bb40deb82d5b6e4eb196a74af6}

#### `private llvm::ModulePassManager `[`module_pass_manager_`](#classmicrosoft_1_1quantum_1_1_profile_1a242e97e7813386438df13c3c336af9b6) {#classmicrosoft_1_1quantum_1_1_profile_1a242e97e7813386438df13c3c336af9b6}

#### `private `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_profile_1afbb7b83f602e4746a4912a5e47658304)` `[`qubit_allocation_manager_`](#classmicrosoft_1_1quantum_1_1_profile_1a7b69a4e439b1d11cb5d76e6ef8944ba6) {#classmicrosoft_1_1quantum_1_1_profile_1a7b69a4e439b1d11cb5d76e6ef8944ba6}

Interface pointer to the qubit allocation manager. Mode of operation depends on the concrete implementation of the manager which is swappable through the interface.

#### `private `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_profile_1afbb7b83f602e4746a4912a5e47658304)` `[`result_allocation_manager_`](#classmicrosoft_1_1quantum_1_1_profile_1a12722216b4851b6050e8ba096641efcd) {#classmicrosoft_1_1quantum_1_1_profile_1a12722216b4851b6050e8ba096641efcd}

Interface pointer to the results allocation manager. Again here the manager behaviour is determined by its implementation details.

#### `private `[`ValidatorPtr`](#classmicrosoft_1_1quantum_1_1_profile_1aecedd32ceddf4b4058c6a0c7f74aa386)` `[`validator_`](#classmicrosoft_1_1quantum_1_1_profile_1a6e62cb294523d19f0ccefb829e5502a3) {#classmicrosoft_1_1quantum_1_1_profile_1a6e62cb294523d19f0ccefb829e5502a3}

#### `private std::string `[`peephole_ep_pipeline_`](#classmicrosoft_1_1quantum_1_1_profile_1a95979cdc42e787aa7b7154d8f4700672) {#classmicrosoft_1_1quantum_1_1_profile_1a95979cdc42e787aa7b7154d8f4700672}

#### `private std::string `[`late_loop_optimizations_ep_pipeline_`](#classmicrosoft_1_1quantum_1_1_profile_1a4b3400f3d8033510b18811c0e0f78e26) {#classmicrosoft_1_1quantum_1_1_profile_1a4b3400f3d8033510b18811c0e0f78e26}

#### `private std::string `[`loop_optimizer_end_ep_pipeline_`](#classmicrosoft_1_1quantum_1_1_profile_1a77d8e46a836e06d704718ecb1e6ecbd2) {#classmicrosoft_1_1quantum_1_1_profile_1a77d8e46a836e06d704718ecb1e6ecbd2}

#### `private std::string `[`scalar_optimizer_late_ep_pipeline_`](#classmicrosoft_1_1quantum_1_1_profile_1a60487e2a6ee5269b9110945cac5de2c7) {#classmicrosoft_1_1quantum_1_1_profile_1a60487e2a6ee5269b9110945cac5de2c7}

#### `private std::string `[`cgscc_optimizer_late_ep_pipeline_`](#classmicrosoft_1_1quantum_1_1_profile_1a9bfeba36b354d8e21e98c500aeb45ca1) {#classmicrosoft_1_1quantum_1_1_profile_1a9bfeba36b354d8e21e98c500aeb45ca1}

#### `private std::string `[`vectorizer_start_ep_pipeline_`](#classmicrosoft_1_1quantum_1_1_profile_1a5c39c134ef9b82dcaeb7ec76ebe48080) {#classmicrosoft_1_1quantum_1_1_profile_1a5c39c134ef9b82dcaeb7ec76ebe48080}

#### `private std::string `[`pipeline_start_ep_pipeline_`](#classmicrosoft_1_1quantum_1_1_profile_1a272ddc0ca5d22e11fa642d792407525f) {#classmicrosoft_1_1quantum_1_1_profile_1a272ddc0ca5d22e11fa642d792407525f}

#### `private std::string `[`optimizer_last_ep_pipeline_`](#classmicrosoft_1_1quantum_1_1_profile_1a23499fdbae5b24d3da97d6f27a60b8bd) {#classmicrosoft_1_1quantum_1_1_profile_1a23499fdbae5b24d3da97d6f27a60b8bd}

#### `private void `[`registerEPCallbacks`](#classmicrosoft_1_1quantum_1_1_profile_1a2bddd50225c9b1e57d05ab6f8c1683f3)`(bool verify_each_pass,bool debug)` {#classmicrosoft_1_1quantum_1_1_profile_1a2bddd50225c9b1e57d05ab6f8c1683f3}

#### `private template<>`  <br/>`inline bool `[`tryParsePipelineText`](#classmicrosoft_1_1quantum_1_1_profile_1a3b75a516d8c488c76ac9bf8ff0f990d3)`(llvm::PassBuilder & pass_builder,std::string const & pipeline_options)` {#classmicrosoft_1_1quantum_1_1_profile_1a3b75a516d8c488c76ac9bf8ff0f990d3}

## class `microsoft::quantum::RemoveDisallowedAttributesPass` {#classmicrosoft_1_1quantum_1_1_remove_disallowed_attributes_pass}

```
class microsoft::quantum::RemoveDisallowedAttributesPass
  : public llvm::PassInfoMixin< RemoveDisallowedAttributesPass >
```

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public inline  `[`RemoveDisallowedAttributesPass`](#classmicrosoft_1_1quantum_1_1_remove_disallowed_attributes_pass_1ad5f3d7f52625feb5e20acc8e6322073f)`()` | 
`public inline llvm::PreservedAnalyses `[`run`](#classmicrosoft_1_1quantum_1_1_remove_disallowed_attributes_pass_1a9e9c343ef56c3725bacd7f670b6d773b)`(llvm::Module & module,llvm::ModuleAnalysisManager &)` | 
`private std::unordered_set< String > `[`allowed_attrs_`](#classmicrosoft_1_1quantum_1_1_remove_disallowed_attributes_pass_1a2f6423b12da2839bb9e6ac724a7a3419) | 

### Members

#### `public inline  `[`RemoveDisallowedAttributesPass`](#classmicrosoft_1_1quantum_1_1_remove_disallowed_attributes_pass_1ad5f3d7f52625feb5e20acc8e6322073f)`()` {#classmicrosoft_1_1quantum_1_1_remove_disallowed_attributes_pass_1ad5f3d7f52625feb5e20acc8e6322073f}

#### `public inline llvm::PreservedAnalyses `[`run`](#classmicrosoft_1_1quantum_1_1_remove_disallowed_attributes_pass_1a9e9c343ef56c3725bacd7f670b6d773b)`(llvm::Module & module,llvm::ModuleAnalysisManager &)` {#classmicrosoft_1_1quantum_1_1_remove_disallowed_attributes_pass_1a9e9c343ef56c3725bacd7f670b6d773b}

#### `private std::unordered_set< String > `[`allowed_attrs_`](#classmicrosoft_1_1quantum_1_1_remove_disallowed_attributes_pass_1a2f6423b12da2839bb9e6ac724a7a3419) {#classmicrosoft_1_1quantum_1_1_remove_disallowed_attributes_pass_1a2f6423b12da2839bb9e6ac724a7a3419}

## class `microsoft::quantum::RuleFactory` {#classmicrosoft_1_1quantum_1_1_rule_factory}

Rule factory provides a high-level methods to build a rule set that enforces certain aspects of QIR transformation.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`RuleFactory`](#classmicrosoft_1_1quantum_1_1_rule_factory_1adda40e9c4d6efd68793c81c13381296e)`(`[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` & rule_set,`[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a65db113bde77cbc5cb163bb7f53263a1)` qubit_alloc_manager,`[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a65db113bde77cbc5cb163bb7f53263a1)` result_alloc_manager)` | 
`public  `[`RuleFactory`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a37d0ae9c05e1e0c3e430c16f4559f549)`() = delete` | 
`public  `[`RuleFactory`](#classmicrosoft_1_1quantum_1_1_rule_factory_1acd0c174d59ce9be84969b73381b59c64)`(`[`RuleFactory`](#classmicrosoft_1_1quantum_1_1_rule_factory)` const &) = delete` | 
`public  `[`RuleFactory`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a6de741f9ddda4c082f701c42cc8913a6)`(`[`RuleFactory`](#classmicrosoft_1_1quantum_1_1_rule_factory)` &&) = default` | 
`public  `[`~RuleFactory`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a4bd75ddd6e9fbf275bb0f1b43d16194b)`() = default` | 
`public void `[`usingConfiguration`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a64de24c930b2959d93e93d2055b7473e)`(`[`FactoryConfiguration`](#classmicrosoft_1_1quantum_1_1_factory_configuration)` const & config)` | This takes a [FactoryConfiguration](#classmicrosoft_1_1quantum_1_1_factory_configuration) as argument and enable rules accordingly.
`public void `[`removeFunctionCall`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a562f68309c4687105898a2085838fd0f)`(String const & name)` | Removes all calls to functions with a specified name. This function matches on name alone and ignores function arguments.
`public void `[`useStaticQubitArrayAllocation`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a1df0940ef8c5733f06ce28299708f587)`()` | Static qubit array allocation identifies allocations, array access and releases. Each of these are replaced with static values. Patterns recognised include
`public void `[`useStaticQubitAllocation`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a8c32ae37eba8ae340e1817b27efcf66a)`()` | Static qubit allocation identifies allocation and release of single qubits. It uses the qubit allocation manager to track allocation and releases of qubits. It translates
`public void `[`useStaticResultAllocation`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a4e0f22992717e3fd8303e5035e4e6d9f)`()` | Static allocation of results. This feature is similar to `useStaticQubitAllocation` but uses the result allocation manager.
`public void `[`resolveConstantArraySizes`](#classmicrosoft_1_1quantum_1_1_rule_factory_1afa8a50b1614a3de7d396e5f5c94764ee)`()` | 
`public void `[`inlineCallables`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a3bbef0bbe40c078c2087506e5a246a2f)`()` | 
`public void `[`optimiseResultOne`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a3f73c72f050c1206d22cfa001401e029)`()` | Replaces branching of quantum results compared to one. This is a relatively advanced pattern, intended for base profile-like constructs where
`public void `[`optimiseResultZero`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a6f0f64631dbcdf7b4e65debe57c8edaa)`()` | Replaces branching of quantum results compared to zero. This method is not implemented yet.
`public void `[`disableReferenceCounting`](#classmicrosoft_1_1quantum_1_1_rule_factory_1ad235feb32d4c66d5ca304399e3fb35fb)`()` | This method disables reference counting for arrays, strings and results. It does so by simply removing the instructions and the resulting code is expected to be executed either on a stack VM or with shared pointer logic.
`public void `[`disableAliasCounting`](#classmicrosoft_1_1quantum_1_1_rule_factory_1af9f7a6296e7912c8a6ab5fc7ad3890c8)`()` | This method disables alias counting for arrays, strings and results.
`public void `[`disableStringSupport`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a7f80b73c026d75b58349dd9aef93ef71)`()` | Removes string support by removing string related instructions. At the moment these include `__quantum__rt__string_create`, `__quantum__rt__string_update_reference_count`, `__quantum__rt__string_update_alias_count` and `__quantum__rt__message`.
`public void `[`setDefaultIntegerWidth`](#classmicrosoft_1_1quantum_1_1_rule_factory_1ada0ef5df9369d8622758648742a137f5)`(uint32_t v)` | Sets the integer width used when it cannot be deducted from the context of the transformation.
`typedef `[`ReplacementRulePtr`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a327402fcfe90837fb0efb5fc14153986) | [ReplacementRule](#classmicrosoft_1_1quantum_1_1_replacement_rule) pointer type used for the construction of replacement rules.
`typedef `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a65db113bde77cbc5cb163bb7f53263a1) | Allocation manager pointer used to hold allocation managers.
`private `[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` & `[`rule_set_`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a1359a09d4c22413fd6d6b1b8f6f04630) | The rule set we are building.
`private `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a65db113bde77cbc5cb163bb7f53263a1)` `[`qubit_alloc_manager_`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a687bce86ccb7d7152742e913317fd953) | Qubit allocation manager which is used in the case of static qubit allocation.
`private `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a65db113bde77cbc5cb163bb7f53263a1)` `[`result_alloc_manager_`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a7904c8dd039dec01a2c32f08722835a2) | Result allocation manager which is used in the case of static results allocation.
`private uint32_t `[`default_integer_width_`](#classmicrosoft_1_1quantum_1_1_rule_factory_1ae95869683adb8c77f88118bd483be2c6) | Configuration.
`private `[`ReplacementRulePtr`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a327402fcfe90837fb0efb5fc14153986)` `[`addRule`](#classmicrosoft_1_1quantum_1_1_rule_factory_1af8b176b89e15be0b14053d056ff735b2)`(`[`ReplacementRule`](#classmicrosoft_1_1quantum_1_1_replacement_rule)` && rule)` | Helper function that moves a replacement rule into a shared pointer, adds it to the rule set and returns a copy of it.

### Members

#### `public  `[`RuleFactory`](#classmicrosoft_1_1quantum_1_1_rule_factory_1adda40e9c4d6efd68793c81c13381296e)`(`[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` & rule_set,`[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a65db113bde77cbc5cb163bb7f53263a1)` qubit_alloc_manager,`[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a65db113bde77cbc5cb163bb7f53263a1)` result_alloc_manager)` {#classmicrosoft_1_1quantum_1_1_rule_factory_1adda40e9c4d6efd68793c81c13381296e}

#### `public  `[`RuleFactory`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a37d0ae9c05e1e0c3e430c16f4559f549)`() = delete` {#classmicrosoft_1_1quantum_1_1_rule_factory_1a37d0ae9c05e1e0c3e430c16f4559f549}

#### `public  `[`RuleFactory`](#classmicrosoft_1_1quantum_1_1_rule_factory_1acd0c174d59ce9be84969b73381b59c64)`(`[`RuleFactory`](#classmicrosoft_1_1quantum_1_1_rule_factory)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_rule_factory_1acd0c174d59ce9be84969b73381b59c64}

#### `public  `[`RuleFactory`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a6de741f9ddda4c082f701c42cc8913a6)`(`[`RuleFactory`](#classmicrosoft_1_1quantum_1_1_rule_factory)` &&) = default` {#classmicrosoft_1_1quantum_1_1_rule_factory_1a6de741f9ddda4c082f701c42cc8913a6}

#### `public  `[`~RuleFactory`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a4bd75ddd6e9fbf275bb0f1b43d16194b)`() = default` {#classmicrosoft_1_1quantum_1_1_rule_factory_1a4bd75ddd6e9fbf275bb0f1b43d16194b}

#### `public void `[`usingConfiguration`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a64de24c930b2959d93e93d2055b7473e)`(`[`FactoryConfiguration`](#classmicrosoft_1_1quantum_1_1_factory_configuration)` const & config)` {#classmicrosoft_1_1quantum_1_1_rule_factory_1a64de24c930b2959d93e93d2055b7473e}

This takes a [FactoryConfiguration](#classmicrosoft_1_1quantum_1_1_factory_configuration) as argument and enable rules accordingly.

#### `public void `[`removeFunctionCall`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a562f68309c4687105898a2085838fd0f)`(String const & name)` {#classmicrosoft_1_1quantum_1_1_rule_factory_1a562f68309c4687105898a2085838fd0f}

Removes all calls to functions with a specified name. This function matches on name alone and ignores function arguments.

#### `public void `[`useStaticQubitArrayAllocation`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a1df0940ef8c5733f06ce28299708f587)`()` {#classmicrosoft_1_1quantum_1_1_rule_factory_1a1df0940ef8c5733f06ce28299708f587}

Static qubit array allocation identifies allocations, array access and releases. Each of these are replaced with static values. Patterns recognised include

```cpp
%array = call %Array* @__quantum__rt__qubit_allocate_array(i64 10)
```

which is replaced by a constant pointer

```cpp
%array = inttoptr i64 0 to %Array*
```

The array allocation is managed through the qubit allocation manager. Access to qubit arrays

```cpp
%0 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %array, i64 7)
%1 = bitcast i8* %0 to %Qubit**
%qubit = load %Qubit*, %Qubit** %1, align 8
```

is replaced by off-setting the array value by 7 to get

```cpp
%qubit = inttoptr i64 7 to %Qubit*
```

Finally, release is recognised and the allocation manager is invoked accordingly.

#### `public void `[`useStaticQubitAllocation`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a8c32ae37eba8ae340e1817b27efcf66a)`()` {#classmicrosoft_1_1quantum_1_1_rule_factory_1a8c32ae37eba8ae340e1817b27efcf66a}

Static qubit allocation identifies allocation and release of single qubits. It uses the qubit allocation manager to track allocation and releases of qubits. It translates

```cpp
%qubit1 = call %Qubit* @__quantum__rt__qubit_allocate()
%qubit2 = call %Qubit* @__quantum__rt__qubit_allocate()
%qubit3 = call %Qubit* @__quantum__rt__qubit_allocate()
%qubit4 = call %Qubit* @__quantum__rt__qubit_allocate()
%qubit5 = call %Qubit* @__quantum__rt__qubit_allocate()
```

to

```cpp
%qubit1 = inttoptr i64 0 to %Qubit*
%qubit2 = inttoptr i64 1 to %Qubit*
%qubit3 = inttoptr i64 2 to %Qubit*
%qubit4 = inttoptr i64 3 to %Qubit*
%qubit5 = inttoptr i64 4 to %Qubit*
```
 if the [BasicAllocationManager](#classmicrosoft_1_1quantum_1_1_basic_allocation_manager) is used.

#### `public void `[`useStaticResultAllocation`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a4e0f22992717e3fd8303e5035e4e6d9f)`()` {#classmicrosoft_1_1quantum_1_1_rule_factory_1a4e0f22992717e3fd8303e5035e4e6d9f}

Static allocation of results. This feature is similar to `useStaticQubitAllocation` but uses the result allocation manager.

#### `public void `[`resolveConstantArraySizes`](#classmicrosoft_1_1quantum_1_1_rule_factory_1afa8a50b1614a3de7d396e5f5c94764ee)`()` {#classmicrosoft_1_1quantum_1_1_rule_factory_1afa8a50b1614a3de7d396e5f5c94764ee}

#### `public void `[`inlineCallables`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a3bbef0bbe40c078c2087506e5a246a2f)`()` {#classmicrosoft_1_1quantum_1_1_rule_factory_1a3bbef0bbe40c078c2087506e5a246a2f}

#### `public void `[`optimiseResultOne`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a3f73c72f050c1206d22cfa001401e029)`()` {#classmicrosoft_1_1quantum_1_1_rule_factory_1a3f73c72f050c1206d22cfa001401e029}

Replaces branching of quantum results compared to one. This is a relatively advanced pattern, intended for base profile-like constructs where

```cpp
%1 = tail call %Result* @__quantum__rt__result_get_one()
%2 = tail call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)
br i1 %2, label %then0__1, label %continue__1
```

is mapped into

```cpp
%1 = call i1 @__quantum__qis__read_result__body(%Result* %0)
br i1 %1, label %then0__1, label %continue__1
```

which removes the need for constant one.

#### `public void `[`optimiseResultZero`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a6f0f64631dbcdf7b4e65debe57c8edaa)`()` {#classmicrosoft_1_1quantum_1_1_rule_factory_1a6f0f64631dbcdf7b4e65debe57c8edaa}

Replaces branching of quantum results compared to zero. This method is not implemented yet.

#### `public void `[`disableReferenceCounting`](#classmicrosoft_1_1quantum_1_1_rule_factory_1ad235feb32d4c66d5ca304399e3fb35fb)`()` {#classmicrosoft_1_1quantum_1_1_rule_factory_1ad235feb32d4c66d5ca304399e3fb35fb}

This method disables reference counting for arrays, strings and results. It does so by simply removing the instructions and the resulting code is expected to be executed either on a stack VM or with shared pointer logic.

#### `public void `[`disableAliasCounting`](#classmicrosoft_1_1quantum_1_1_rule_factory_1af9f7a6296e7912c8a6ab5fc7ad3890c8)`()` {#classmicrosoft_1_1quantum_1_1_rule_factory_1af9f7a6296e7912c8a6ab5fc7ad3890c8}

This method disables alias counting for arrays, strings and results.

#### `public void `[`disableStringSupport`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a7f80b73c026d75b58349dd9aef93ef71)`()` {#classmicrosoft_1_1quantum_1_1_rule_factory_1a7f80b73c026d75b58349dd9aef93ef71}

Removes string support by removing string related instructions. At the moment these include `__quantum__rt__string_create`, `__quantum__rt__string_update_reference_count`, `__quantum__rt__string_update_alias_count` and `__quantum__rt__message`.

#### `public void `[`setDefaultIntegerWidth`](#classmicrosoft_1_1quantum_1_1_rule_factory_1ada0ef5df9369d8622758648742a137f5)`(uint32_t v)` {#classmicrosoft_1_1quantum_1_1_rule_factory_1ada0ef5df9369d8622758648742a137f5}

Sets the integer width used when it cannot be deducted from the context of the transformation.

#### `typedef `[`ReplacementRulePtr`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a327402fcfe90837fb0efb5fc14153986) {#classmicrosoft_1_1quantum_1_1_rule_factory_1a327402fcfe90837fb0efb5fc14153986}

[ReplacementRule](#classmicrosoft_1_1quantum_1_1_replacement_rule) pointer type used for the construction of replacement rules.

#### `typedef `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a65db113bde77cbc5cb163bb7f53263a1) {#classmicrosoft_1_1quantum_1_1_rule_factory_1a65db113bde77cbc5cb163bb7f53263a1}

Allocation manager pointer used to hold allocation managers.

#### `private `[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` & `[`rule_set_`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a1359a09d4c22413fd6d6b1b8f6f04630) {#classmicrosoft_1_1quantum_1_1_rule_factory_1a1359a09d4c22413fd6d6b1b8f6f04630}

The rule set we are building.

#### `private `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a65db113bde77cbc5cb163bb7f53263a1)` `[`qubit_alloc_manager_`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a687bce86ccb7d7152742e913317fd953) {#classmicrosoft_1_1quantum_1_1_rule_factory_1a687bce86ccb7d7152742e913317fd953}

Qubit allocation manager which is used in the case of static qubit allocation.

#### `private `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a65db113bde77cbc5cb163bb7f53263a1)` `[`result_alloc_manager_`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a7904c8dd039dec01a2c32f08722835a2) {#classmicrosoft_1_1quantum_1_1_rule_factory_1a7904c8dd039dec01a2c32f08722835a2}

Result allocation manager which is used in the case of static results allocation.

#### `private uint32_t `[`default_integer_width_`](#classmicrosoft_1_1quantum_1_1_rule_factory_1ae95869683adb8c77f88118bd483be2c6) {#classmicrosoft_1_1quantum_1_1_rule_factory_1ae95869683adb8c77f88118bd483be2c6}

Configuration.

The default integer width. This value is used whenever the width within the context cannot be inferred.

#### `private `[`ReplacementRulePtr`](#classmicrosoft_1_1quantum_1_1_rule_factory_1a327402fcfe90837fb0efb5fc14153986)` `[`addRule`](#classmicrosoft_1_1quantum_1_1_rule_factory_1af8b176b89e15be0b14053d056ff735b2)`(`[`ReplacementRule`](#classmicrosoft_1_1quantum_1_1_replacement_rule)` && rule)` {#classmicrosoft_1_1quantum_1_1_rule_factory_1af8b176b89e15be0b14053d056ff735b2}

Helper function that moves a replacement rule into a shared pointer, adds it to the rule set and returns a copy of it.

## class `microsoft::quantum::FactoryConfiguration` {#classmicrosoft_1_1quantum_1_1_factory_configuration}

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public inline void `[`setup`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1aa9c0d494221d2010cebcdc25fa626382)`(`[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` & config)` | 
`public inline bool `[`disableReferenceCounting`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a5af06cd14354127b8e313c4b27ba4f48)`() const` | 
`public inline bool `[`disableAliasCounting`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1ae5968650d3fc87a65b07c877ea041cb5)`() const` | 
`public inline bool `[`disableStringSupport`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a33cb7a079ee033327ea6d278efd7bff2)`() const` | 
`public inline bool `[`optimiseResultOne`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a35133252393ac455dd705735ff6d352b)`() const` | 
`public inline bool `[`optimiseResultZero`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1aeb99c7d43abd2cdcbbd02c2d6601cd78)`() const` | 
`public inline bool `[`useStaticQubitArrayAllocation`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1aa139251da7877b66f62538196dd33fe4)`() const` | 
`public inline bool `[`useStaticQubitAllocation`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1abe94b94c4be4dafaf208dd055f7e03a8)`() const` | 
`public inline bool `[`useStaticResultAllocation`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a6e201cc4e9ef8de340540e2b943cb8ef)`() const` | 
`public inline uint32_t `[`defaultIntegerWidth`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a2a1854abdcb4cf4c8200f53e3cbe7864)`() const` | 
`public inline bool `[`isDisabled`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a30b261e93d6ffe5d6620277a4d2d5911)`() const` | 
`public inline bool `[`isDefault`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a8aae2abc97beddb5049bde0b978bdec8)`() const` | 
`private bool `[`use_static_qubit_array_allocation_`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a3f6b88834708e5b180a0ba9b35bcb28b) | 
`private bool `[`use_static_qubit_allocation_`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1aaa1c8f70ca92b964f5941ed0fef640be) | 
`private bool `[`use_static_result_allocation_`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a15cdd50369b5198456f3f80d162274a4) | 
`private uint32_t `[`default_integer_width_`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a3f4bb300a59c3fc97cd9d2fce78aa651) | 
`public inline static `[`FactoryConfiguration`](#classmicrosoft_1_1quantum_1_1_factory_configuration)` `[`createDisabled`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1accfe872d1dce5c683ab92ebd281f89a9)`()` | 

### Members

#### `public inline void `[`setup`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1aa9c0d494221d2010cebcdc25fa626382)`(`[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` & config)` {#classmicrosoft_1_1quantum_1_1_factory_configuration_1aa9c0d494221d2010cebcdc25fa626382}

#### `public inline bool `[`disableReferenceCounting`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a5af06cd14354127b8e313c4b27ba4f48)`() const` {#classmicrosoft_1_1quantum_1_1_factory_configuration_1a5af06cd14354127b8e313c4b27ba4f48}

#### `public inline bool `[`disableAliasCounting`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1ae5968650d3fc87a65b07c877ea041cb5)`() const` {#classmicrosoft_1_1quantum_1_1_factory_configuration_1ae5968650d3fc87a65b07c877ea041cb5}

#### `public inline bool `[`disableStringSupport`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a33cb7a079ee033327ea6d278efd7bff2)`() const` {#classmicrosoft_1_1quantum_1_1_factory_configuration_1a33cb7a079ee033327ea6d278efd7bff2}

#### `public inline bool `[`optimiseResultOne`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a35133252393ac455dd705735ff6d352b)`() const` {#classmicrosoft_1_1quantum_1_1_factory_configuration_1a35133252393ac455dd705735ff6d352b}

#### `public inline bool `[`optimiseResultZero`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1aeb99c7d43abd2cdcbbd02c2d6601cd78)`() const` {#classmicrosoft_1_1quantum_1_1_factory_configuration_1aeb99c7d43abd2cdcbbd02c2d6601cd78}

#### `public inline bool `[`useStaticQubitArrayAllocation`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1aa139251da7877b66f62538196dd33fe4)`() const` {#classmicrosoft_1_1quantum_1_1_factory_configuration_1aa139251da7877b66f62538196dd33fe4}

#### `public inline bool `[`useStaticQubitAllocation`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1abe94b94c4be4dafaf208dd055f7e03a8)`() const` {#classmicrosoft_1_1quantum_1_1_factory_configuration_1abe94b94c4be4dafaf208dd055f7e03a8}

#### `public inline bool `[`useStaticResultAllocation`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a6e201cc4e9ef8de340540e2b943cb8ef)`() const` {#classmicrosoft_1_1quantum_1_1_factory_configuration_1a6e201cc4e9ef8de340540e2b943cb8ef}

#### `public inline uint32_t `[`defaultIntegerWidth`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a2a1854abdcb4cf4c8200f53e3cbe7864)`() const` {#classmicrosoft_1_1quantum_1_1_factory_configuration_1a2a1854abdcb4cf4c8200f53e3cbe7864}

#### `public inline bool `[`isDisabled`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a30b261e93d6ffe5d6620277a4d2d5911)`() const` {#classmicrosoft_1_1quantum_1_1_factory_configuration_1a30b261e93d6ffe5d6620277a4d2d5911}

#### `public inline bool `[`isDefault`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a8aae2abc97beddb5049bde0b978bdec8)`() const` {#classmicrosoft_1_1quantum_1_1_factory_configuration_1a8aae2abc97beddb5049bde0b978bdec8}

#### `private bool `[`use_static_qubit_array_allocation_`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a3f6b88834708e5b180a0ba9b35bcb28b) {#classmicrosoft_1_1quantum_1_1_factory_configuration_1a3f6b88834708e5b180a0ba9b35bcb28b}

#### `private bool `[`use_static_qubit_allocation_`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1aaa1c8f70ca92b964f5941ed0fef640be) {#classmicrosoft_1_1quantum_1_1_factory_configuration_1aaa1c8f70ca92b964f5941ed0fef640be}

#### `private bool `[`use_static_result_allocation_`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a15cdd50369b5198456f3f80d162274a4) {#classmicrosoft_1_1quantum_1_1_factory_configuration_1a15cdd50369b5198456f3f80d162274a4}

#### `private uint32_t `[`default_integer_width_`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1a3f4bb300a59c3fc97cd9d2fce78aa651) {#classmicrosoft_1_1quantum_1_1_factory_configuration_1a3f4bb300a59c3fc97cd9d2fce78aa651}

#### `public inline static `[`FactoryConfiguration`](#classmicrosoft_1_1quantum_1_1_factory_configuration)` `[`createDisabled`](#classmicrosoft_1_1quantum_1_1_factory_configuration_1accfe872d1dce5c683ab92ebd281f89a9)`()` {#classmicrosoft_1_1quantum_1_1_factory_configuration_1accfe872d1dce5c683ab92ebd281f89a9}

## class `microsoft::quantum::IOperandPrototype` {#classmicrosoft_1_1quantum_1_1_i_operand_prototype}

[IOperandPrototype](#classmicrosoft_1_1quantum_1_1_i_operand_prototype) describes an IR pattern and allows matching against LLVMs llvm::Value type. Each value may or may not be captured during the matching process which means that they are stored in a map under a given name. Capturing is enabled using `captureAs(name)` which sets the name the value should be stored under.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`IOperandPrototype`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a3c05f7599d41ac5179ff5ceceb97734c)`() = default` | 
`public virtual  `[`~IOperandPrototype`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1ac6fc06942a148f05ffea8d53e62f8506)`()` | 
`public bool `[`match`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a9a4157b4f5b74dff9e5b413a64240236)`(Value * value,Captures & captures) const` | Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.
`public Child `[`copy`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a82a0fd5f7297e519eaf8eddac0f38ed3)`() const` | Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.
`public void `[`addChild`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af998b63b21e8a0500a952248c140d0d0)`(Child const & child)` | Adds a child to be matched against the matches children. Children are matched in order and by size.
`public void `[`captureAs`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a166b955925cb5f1464e20c2b94f91a78)`(std::string capture_name)` | Flags that this operand should be captured. This function ensures that the captured operand is given a name. The subsequent logic in this class is responsible for capturing (upon match) and uncapturing (upon backtrack) with specified name
`protected bool `[`fail`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`(Value * value,Captures & captures) const` | Function which should be called whenever a match fails.
`protected bool `[`success`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)`(Value * value,Captures & captures) const` | Function which should be called whenever a match is successful.
`protected bool `[`matchChildren`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a98d4e08ac8b7098713c3adc0e3ce1e95)`(Value * value,Captures & captures) const` | Subroutine to match all children.
`protected inline void `[`copyPropertiesFrom`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a88789e3c997ddbad72a2ad2221652bcc)`(`[`IOperandPrototype`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype)` const & other)` | Shallow copy of the operand to allow name change of the capture
`typedef `[`Instruction`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1ad0ac73c9329bbc7917b6f0e5ccb76ac3) | 
`typedef `[`String`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1ac2402fc46807d48aebed3384a9cec8ed) | 
`typedef `[`Value`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a823a98568040aa7bf8e2b7da13c19990) | 
`typedef `[`Child`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a909d5269c5569a5948bce3395cb59cb7) | 
`typedef `[`Children`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a99846defccd39bf81668c12dac580510) | 
`typedef `[`Captures`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a31fcffca4d5e1447f17c7ce64a490a6a) | 
`private std::string `[`capture_name_`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a999f7562d379e2022be98734e563ae76) | Name to captured value. Empty means no capture.
`private Children `[`children_`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a1290d9a7bf778b01284d66f4f9563eaa) | Children to match against the values children.
`private void `[`capture`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1aee02b9141fc1ffa0c9318297a2009c17)`(Value * value,Captures & captures) const` | Captures the value into the captures table if needed.
`private void `[`uncapture`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a9cc3002e80a014cd52a52c0d33c4e53d)`(Value * value,Captures & captures) const` | Removes any captures from the captures table upon backtracking.

### Members

#### `public  `[`IOperandPrototype`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a3c05f7599d41ac5179ff5ceceb97734c)`() = default` {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a3c05f7599d41ac5179ff5ceceb97734c}

#### `public virtual  `[`~IOperandPrototype`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1ac6fc06942a148f05ffea8d53e62f8506)`()` {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1ac6fc06942a148f05ffea8d53e62f8506}

#### `public bool `[`match`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a9a4157b4f5b74dff9e5b413a64240236)`(Value * value,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a9a4157b4f5b74dff9e5b413a64240236}

Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.

#### `public Child `[`copy`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a82a0fd5f7297e519eaf8eddac0f38ed3)`() const` {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a82a0fd5f7297e519eaf8eddac0f38ed3}

Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

#### `public void `[`addChild`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af998b63b21e8a0500a952248c140d0d0)`(Child const & child)` {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af998b63b21e8a0500a952248c140d0d0}

Adds a child to be matched against the matches children. Children are matched in order and by size.

#### `public void `[`captureAs`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a166b955925cb5f1464e20c2b94f91a78)`(std::string capture_name)` {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a166b955925cb5f1464e20c2b94f91a78}

Flags that this operand should be captured. This function ensures that the captured operand is given a name. The subsequent logic in this class is responsible for capturing (upon match) and uncapturing (upon backtrack) with specified name

#### `protected bool `[`fail`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`(Value * value,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2}

Function which should be called whenever a match fails.

#### `protected bool `[`success`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)`(Value * value,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133}

Function which should be called whenever a match is successful.

#### `protected bool `[`matchChildren`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a98d4e08ac8b7098713c3adc0e3ce1e95)`(Value * value,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a98d4e08ac8b7098713c3adc0e3ce1e95}

Subroutine to match all children.

#### `protected inline void `[`copyPropertiesFrom`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a88789e3c997ddbad72a2ad2221652bcc)`(`[`IOperandPrototype`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype)` const & other)` {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a88789e3c997ddbad72a2ad2221652bcc}

Shallow copy of the operand to allow name change of the capture

#### `typedef `[`Instruction`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1ad0ac73c9329bbc7917b6f0e5ccb76ac3) {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1ad0ac73c9329bbc7917b6f0e5ccb76ac3}

#### `typedef `[`String`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1ac2402fc46807d48aebed3384a9cec8ed) {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1ac2402fc46807d48aebed3384a9cec8ed}

#### `typedef `[`Value`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a823a98568040aa7bf8e2b7da13c19990) {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a823a98568040aa7bf8e2b7da13c19990}

#### `typedef `[`Child`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a909d5269c5569a5948bce3395cb59cb7) {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a909d5269c5569a5948bce3395cb59cb7}

#### `typedef `[`Children`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a99846defccd39bf81668c12dac580510) {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a99846defccd39bf81668c12dac580510}

#### `typedef `[`Captures`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a31fcffca4d5e1447f17c7ce64a490a6a) {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a31fcffca4d5e1447f17c7ce64a490a6a}

#### `private std::string `[`capture_name_`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a999f7562d379e2022be98734e563ae76) {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a999f7562d379e2022be98734e563ae76}

Name to captured value. Empty means no capture.

#### `private Children `[`children_`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a1290d9a7bf778b01284d66f4f9563eaa) {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a1290d9a7bf778b01284d66f4f9563eaa}

Children to match against the values children.

#### `private void `[`capture`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1aee02b9141fc1ffa0c9318297a2009c17)`(Value * value,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1aee02b9141fc1ffa0c9318297a2009c17}

Captures the value into the captures table if needed.

#### `private void `[`uncapture`](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a9cc3002e80a014cd52a52c0d33c4e53d)`(Value * value,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a9cc3002e80a014cd52a52c0d33c4e53d}

Removes any captures from the captures table upon backtracking.

## class `microsoft::quantum::AnyPattern` {#classmicrosoft_1_1quantum_1_1_any_pattern}

```
class microsoft::quantum::AnyPattern
  : public microsoft::quantum::IOperandPrototype
```

Pattern that matches any operand.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`AnyPattern`](#classmicrosoft_1_1quantum_1_1_any_pattern_1a90a58ce4d1df1b0e4b5db196252ca3b9)`()` | 
`public  `[`~AnyPattern`](#classmicrosoft_1_1quantum_1_1_any_pattern_1a987642ef6a9088bde75122b81ced329c)`()` | 
`public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_any_pattern_1ade07c6212d676205ed8ff8f76d01eac3)`(Value * instr,Captures & captures) const` | Match of any operand always returns true and ignores children.
`public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_any_pattern_1a275a1e5e946aabd7ccba2b6ef8494d76)`() const` | Creates a copy of the [AnyPattern](#classmicrosoft_1_1quantum_1_1_any_pattern) instance.

### Members

#### `public  `[`AnyPattern`](#classmicrosoft_1_1quantum_1_1_any_pattern_1a90a58ce4d1df1b0e4b5db196252ca3b9)`()` {#classmicrosoft_1_1quantum_1_1_any_pattern_1a90a58ce4d1df1b0e4b5db196252ca3b9}

#### `public  `[`~AnyPattern`](#classmicrosoft_1_1quantum_1_1_any_pattern_1a987642ef6a9088bde75122b81ced329c)`()` {#classmicrosoft_1_1quantum_1_1_any_pattern_1a987642ef6a9088bde75122b81ced329c}

#### `public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_any_pattern_1ade07c6212d676205ed8ff8f76d01eac3)`(Value * instr,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_any_pattern_1ade07c6212d676205ed8ff8f76d01eac3}

Match of any operand always returns true and ignores children.

#### `public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_any_pattern_1a275a1e5e946aabd7ccba2b6ef8494d76)`() const` {#classmicrosoft_1_1quantum_1_1_any_pattern_1a275a1e5e946aabd7ccba2b6ef8494d76}

Creates a copy of the [AnyPattern](#classmicrosoft_1_1quantum_1_1_any_pattern) instance.

## class `microsoft::quantum::CallPattern` {#classmicrosoft_1_1quantum_1_1_call_pattern}

```
class microsoft::quantum::CallPattern
  : public microsoft::quantum::IOperandPrototype
```

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  explicit `[`CallPattern`](#classmicrosoft_1_1quantum_1_1_call_pattern_1a4328b1cef879715abf74a1a046ce826a)`(String const & name)` | Construction by name.
`public  `[`CallPattern`](#classmicrosoft_1_1quantum_1_1_call_pattern_1aefa987bfd9fc0febd955b6c93763c6fc)`(`[`CallPattern`](#classmicrosoft_1_1quantum_1_1_call_pattern)` const & other) = delete` | Copy construction prohibited.
`public  `[`CallPattern`](#classmicrosoft_1_1quantum_1_1_call_pattern_1a603094e2e6db4a79b81e77d2f35f3eaa)`(`[`CallPattern`](#classmicrosoft_1_1quantum_1_1_call_pattern)` && other) = default` | Move construction allowed.
`public  `[`~CallPattern`](#classmicrosoft_1_1quantum_1_1_call_pattern_1ae8f43eb5818bda787ff3bb0819d19302)`()` | Destructor implementation.
`public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_call_pattern_1a8084bd76394d0273ed73251cda2869d9)`(Value * instr,Captures & captures) const` | Matches the callee by name.
`public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_call_pattern_1a0181e57334a8fec2219474f6661768e4)`() const` | Creates a copy of itself.
`typedef `[`String`](#classmicrosoft_1_1quantum_1_1_call_pattern_1a8723c35b5849f7476b396592cb6951f7) | 
`private String `[`name_`](#classmicrosoft_1_1quantum_1_1_call_pattern_1ab77926784d61ea20519aa0e48d431f12) | Name of the callee to match against.

### Members

#### `public  explicit `[`CallPattern`](#classmicrosoft_1_1quantum_1_1_call_pattern_1a4328b1cef879715abf74a1a046ce826a)`(String const & name)` {#classmicrosoft_1_1quantum_1_1_call_pattern_1a4328b1cef879715abf74a1a046ce826a}

Construction by name.

#### `public  `[`CallPattern`](#classmicrosoft_1_1quantum_1_1_call_pattern_1aefa987bfd9fc0febd955b6c93763c6fc)`(`[`CallPattern`](#classmicrosoft_1_1quantum_1_1_call_pattern)` const & other) = delete` {#classmicrosoft_1_1quantum_1_1_call_pattern_1aefa987bfd9fc0febd955b6c93763c6fc}

Copy construction prohibited.

#### `public  `[`CallPattern`](#classmicrosoft_1_1quantum_1_1_call_pattern_1a603094e2e6db4a79b81e77d2f35f3eaa)`(`[`CallPattern`](#classmicrosoft_1_1quantum_1_1_call_pattern)` && other) = default` {#classmicrosoft_1_1quantum_1_1_call_pattern_1a603094e2e6db4a79b81e77d2f35f3eaa}

Move construction allowed.

#### `public  `[`~CallPattern`](#classmicrosoft_1_1quantum_1_1_call_pattern_1ae8f43eb5818bda787ff3bb0819d19302)`()` {#classmicrosoft_1_1quantum_1_1_call_pattern_1ae8f43eb5818bda787ff3bb0819d19302}

Destructor implementation.

#### `public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_call_pattern_1a8084bd76394d0273ed73251cda2869d9)`(Value * instr,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_call_pattern_1a8084bd76394d0273ed73251cda2869d9}

Matches the callee by name.

#### `public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_call_pattern_1a0181e57334a8fec2219474f6661768e4)`() const` {#classmicrosoft_1_1quantum_1_1_call_pattern_1a0181e57334a8fec2219474f6661768e4}

Creates a copy of itself.

#### `typedef `[`String`](#classmicrosoft_1_1quantum_1_1_call_pattern_1a8723c35b5849f7476b396592cb6951f7) {#classmicrosoft_1_1quantum_1_1_call_pattern_1a8723c35b5849f7476b396592cb6951f7}

#### `private String `[`name_`](#classmicrosoft_1_1quantum_1_1_call_pattern_1ab77926784d61ea20519aa0e48d431f12) {#classmicrosoft_1_1quantum_1_1_call_pattern_1ab77926784d61ea20519aa0e48d431f12}

Name of the callee to match against.

## class `microsoft::quantum::StorePattern` {#classmicrosoft_1_1quantum_1_1_store_pattern}

```
class microsoft::quantum::StorePattern
  : public microsoft::quantum::IOperandPrototype
```

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_store_pattern_1a1a6f7b94623d2d9706784e5c2e6632c7)`(Value * value,Captures & captures) const` | Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.
`public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_store_pattern_1a7bfd5b1923bb1e4cea37d5825ad663ac)`() const` | Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

### Members

#### `public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_store_pattern_1a1a6f7b94623d2d9706784e5c2e6632c7)`(Value * value,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_store_pattern_1a1a6f7b94623d2d9706784e5c2e6632c7}

Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.

#### `public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_store_pattern_1a7bfd5b1923bb1e4cea37d5825ad663ac)`() const` {#classmicrosoft_1_1quantum_1_1_store_pattern_1a7bfd5b1923bb1e4cea37d5825ad663ac}

Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

## class `microsoft::quantum::LoadPattern` {#classmicrosoft_1_1quantum_1_1_load_pattern}

```
class microsoft::quantum::LoadPattern
  : public microsoft::quantum::IOperandPrototype
```

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_load_pattern_1a6dacbaef74232223d5b26aac1517602e)`(Value * value,Captures & captures) const` | Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.
`public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_load_pattern_1ae684a0104ea08efe685518c2d42324bf)`() const` | Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

### Members

#### `public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_load_pattern_1a6dacbaef74232223d5b26aac1517602e)`(Value * value,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_load_pattern_1a6dacbaef74232223d5b26aac1517602e}

Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.

#### `public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_load_pattern_1ae684a0104ea08efe685518c2d42324bf)`() const` {#classmicrosoft_1_1quantum_1_1_load_pattern_1ae684a0104ea08efe685518c2d42324bf}

Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

## class `microsoft::quantum::BitCastPattern` {#classmicrosoft_1_1quantum_1_1_bit_cast_pattern}

```
class microsoft::quantum::BitCastPattern
  : public microsoft::quantum::IOperandPrototype
```

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_bit_cast_pattern_1ad928c51af6c5e8662eb6fe0f8f37e6ca)`(Value * value,Captures & captures) const` | Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.
`public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_bit_cast_pattern_1ae759a4a83c3d3a4fdeface11f767d40f)`() const` | Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

### Members

#### `public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_bit_cast_pattern_1ad928c51af6c5e8662eb6fe0f8f37e6ca)`(Value * value,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_bit_cast_pattern_1ad928c51af6c5e8662eb6fe0f8f37e6ca}

Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.

#### `public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_bit_cast_pattern_1ae759a4a83c3d3a4fdeface11f767d40f)`() const` {#classmicrosoft_1_1quantum_1_1_bit_cast_pattern_1ae759a4a83c3d3a4fdeface11f767d40f}

Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

## class `microsoft::quantum::IntToPtrPattern` {#classmicrosoft_1_1quantum_1_1_int_to_ptr_pattern}

```
class microsoft::quantum::IntToPtrPattern
  : public microsoft::quantum::IOperandPrototype
```

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_int_to_ptr_pattern_1ab25edadcb4b25f3af498ada16d43fbe8)`(Value * value,Captures & captures) const` | Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.
`public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_int_to_ptr_pattern_1a349b928e39fe516c8b121c26539ef784)`() const` | Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

### Members

#### `public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_int_to_ptr_pattern_1ab25edadcb4b25f3af498ada16d43fbe8)`(Value * value,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_int_to_ptr_pattern_1ab25edadcb4b25f3af498ada16d43fbe8}

Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.

#### `public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_int_to_ptr_pattern_1a349b928e39fe516c8b121c26539ef784)`() const` {#classmicrosoft_1_1quantum_1_1_int_to_ptr_pattern_1a349b928e39fe516c8b121c26539ef784}

Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

## class `microsoft::quantum::ConstIntPattern` {#classmicrosoft_1_1quantum_1_1_const_int_pattern}

```
class microsoft::quantum::ConstIntPattern
  : public microsoft::quantum::IOperandPrototype
```

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_const_int_pattern_1ae02f573f32c166d13c561830dfdb8e2e)`(Value * value,Captures & captures) const` | Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.
`public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_const_int_pattern_1ad6caaf1d53b74bf3cc1768f9146a0a55)`() const` | Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

### Members

#### `public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_const_int_pattern_1ae02f573f32c166d13c561830dfdb8e2e)`(Value * value,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_const_int_pattern_1ae02f573f32c166d13c561830dfdb8e2e}

Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.

#### `public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_const_int_pattern_1ad6caaf1d53b74bf3cc1768f9146a0a55)`() const` {#classmicrosoft_1_1quantum_1_1_const_int_pattern_1ad6caaf1d53b74bf3cc1768f9146a0a55}

Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

## class `microsoft::quantum::BranchPattern` {#classmicrosoft_1_1quantum_1_1_branch_pattern}

```
class microsoft::quantum::BranchPattern
  : public microsoft::quantum::IOperandPrototype
```

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_branch_pattern_1a66c84e12d5838e2dbd4be1c90a674cfc)`(Value * value,Captures & captures) const` | Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.
`public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_branch_pattern_1a1e01906663829810bd1dbd5154ae8276)`() const` | Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

### Members

#### `public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_branch_pattern_1a66c84e12d5838e2dbd4be1c90a674cfc)`(Value * value,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_branch_pattern_1a66c84e12d5838e2dbd4be1c90a674cfc}

Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.

#### `public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_branch_pattern_1a1e01906663829810bd1dbd5154ae8276)`() const` {#classmicrosoft_1_1quantum_1_1_branch_pattern_1a1e01906663829810bd1dbd5154ae8276}

Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

## class `microsoft::quantum::SelectPattern` {#classmicrosoft_1_1quantum_1_1_select_pattern}

```
class microsoft::quantum::SelectPattern
  : public microsoft::quantum::IOperandPrototype
```

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_select_pattern_1aace2c5289656f1c86e03f5a0a9a0a65c)`(Value * value,Captures & captures) const` | Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.
`public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_select_pattern_1a6592d610b3d46c307a885432a1ef4f46)`() const` | Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

### Members

#### `public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_select_pattern_1aace2c5289656f1c86e03f5a0a9a0a65c)`(Value * value,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_select_pattern_1aace2c5289656f1c86e03f5a0a9a0a65c}

Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.

#### `public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_select_pattern_1a6592d610b3d46c307a885432a1ef4f46)`() const` {#classmicrosoft_1_1quantum_1_1_select_pattern_1a6592d610b3d46c307a885432a1ef4f46}

Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

## class `microsoft::quantum::BasicBlockPattern` {#classmicrosoft_1_1quantum_1_1_basic_block_pattern}

```
class microsoft::quantum::BasicBlockPattern
  : public microsoft::quantum::IOperandPrototype
```

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_basic_block_pattern_1a19329f853e85f43be513dd96b980580a)`(Value * value,Captures & captures) const` | Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.
`public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_basic_block_pattern_1a0b6bcfffcc0e2af94b132e41a526a3d7)`() const` | Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

### Members

#### `public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_basic_block_pattern_1a19329f853e85f43be513dd96b980580a)`(Value * value,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_basic_block_pattern_1a19329f853e85f43be513dd96b980580a}

Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.

#### `public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_basic_block_pattern_1a0b6bcfffcc0e2af94b132e41a526a3d7)`() const` {#classmicrosoft_1_1quantum_1_1_basic_block_pattern_1a0b6bcfffcc0e2af94b132e41a526a3d7}

Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

## class `microsoft::quantum::SwitchPattern` {#classmicrosoft_1_1quantum_1_1_switch_pattern}

```
class microsoft::quantum::SwitchPattern
  : public microsoft::quantum::IOperandPrototype
```

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_switch_pattern_1a736b3d9b93de5e9c91fd5e894ba2d7bc)`(Value * value,Captures & captures) const` | Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.
`public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_switch_pattern_1a0ce0c7c2a53fc3251d9ee575364d0956)`() const` | Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

### Members

#### `public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_switch_pattern_1a736b3d9b93de5e9c91fd5e894ba2d7bc)`(Value * value,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_switch_pattern_1a736b3d9b93de5e9c91fd5e894ba2d7bc}

Interface function which determines if a given Value matches the implemented pattern. It is expected that any implementation of `match` will return a call to either `[success()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1af9cf2561fc7d6bb39ec9f9486156d133)` or `[fail()](#classmicrosoft_1_1quantum_1_1_i_operand_prototype_1a25043289d7efcbe79db466f49dd51cd2)`. These functions will, in turn, ensure that the node is captured in the capture table (and erased upon backtracking) as well as matching children.

#### `public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_switch_pattern_1a0ce0c7c2a53fc3251d9ee575364d0956)`() const` {#classmicrosoft_1_1quantum_1_1_switch_pattern_1a0ce0c7c2a53fc3251d9ee575364d0956}

Interface function which defines a copy operation of the underlying implementation. Note that unlike normal copy operators this operation returns a shared pointer to the new copy.

## class `microsoft::quantum::PhiPattern` {#classmicrosoft_1_1quantum_1_1_phi_pattern}

```
class microsoft::quantum::PhiPattern
  : public microsoft::quantum::IOperandPrototype
```

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`PhiPattern`](#classmicrosoft_1_1quantum_1_1_phi_pattern_1aa5e10d4a47ea0a496adc95f4ccb0be98)`() = default` | Construction by name.
`public  `[`PhiPattern`](#classmicrosoft_1_1quantum_1_1_phi_pattern_1af731888aa0ace507e45f2053af0305d5)`(`[`PhiPattern`](#classmicrosoft_1_1quantum_1_1_phi_pattern)` const & other) = delete` | Copy construction prohibited.
`public  `[`PhiPattern`](#classmicrosoft_1_1quantum_1_1_phi_pattern_1aa8c62a2c6e98ff151418f3890940947b)`(`[`PhiPattern`](#classmicrosoft_1_1quantum_1_1_phi_pattern)` && other) = default` | Move construction allowed.
`public  `[`~PhiPattern`](#classmicrosoft_1_1quantum_1_1_phi_pattern_1acec3e7884aa54322abb1e62c225aedf2)`()` | Destructor implementation.
`public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_phi_pattern_1a2b9583d067a78efe68155abd8bc9edc6)`(Value * instr,Captures & captures) const` | Matches the phi node.
`public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_phi_pattern_1a5ae073047f9b0dd18f8333b6423307ff)`() const` | Creates a copy of itself.
`typedef `[`String`](#classmicrosoft_1_1quantum_1_1_phi_pattern_1a4d1aff56a9ca37902ef1fbabfbe0fdd2) | 

### Members

#### `public  `[`PhiPattern`](#classmicrosoft_1_1quantum_1_1_phi_pattern_1aa5e10d4a47ea0a496adc95f4ccb0be98)`() = default` {#classmicrosoft_1_1quantum_1_1_phi_pattern_1aa5e10d4a47ea0a496adc95f4ccb0be98}

Construction by name.

#### `public  `[`PhiPattern`](#classmicrosoft_1_1quantum_1_1_phi_pattern_1af731888aa0ace507e45f2053af0305d5)`(`[`PhiPattern`](#classmicrosoft_1_1quantum_1_1_phi_pattern)` const & other) = delete` {#classmicrosoft_1_1quantum_1_1_phi_pattern_1af731888aa0ace507e45f2053af0305d5}

Copy construction prohibited.

#### `public  `[`PhiPattern`](#classmicrosoft_1_1quantum_1_1_phi_pattern_1aa8c62a2c6e98ff151418f3890940947b)`(`[`PhiPattern`](#classmicrosoft_1_1quantum_1_1_phi_pattern)` && other) = default` {#classmicrosoft_1_1quantum_1_1_phi_pattern_1aa8c62a2c6e98ff151418f3890940947b}

Move construction allowed.

#### `public  `[`~PhiPattern`](#classmicrosoft_1_1quantum_1_1_phi_pattern_1acec3e7884aa54322abb1e62c225aedf2)`()` {#classmicrosoft_1_1quantum_1_1_phi_pattern_1acec3e7884aa54322abb1e62c225aedf2}

Destructor implementation.

#### `public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_phi_pattern_1a2b9583d067a78efe68155abd8bc9edc6)`(Value * instr,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_phi_pattern_1a2b9583d067a78efe68155abd8bc9edc6}

Matches the phi node.

#### `public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_phi_pattern_1a5ae073047f9b0dd18f8333b6423307ff)`() const` {#classmicrosoft_1_1quantum_1_1_phi_pattern_1a5ae073047f9b0dd18f8333b6423307ff}

Creates a copy of itself.

#### `typedef `[`String`](#classmicrosoft_1_1quantum_1_1_phi_pattern_1a4d1aff56a9ca37902ef1fbabfbe0fdd2) {#classmicrosoft_1_1quantum_1_1_phi_pattern_1a4d1aff56a9ca37902ef1fbabfbe0fdd2}

## class `microsoft::quantum::UnnamedInvokePattern` {#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern}

```
class microsoft::quantum::UnnamedInvokePattern
  : public microsoft::quantum::IOperandPrototype
```

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`UnnamedInvokePattern`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1a775f77f370fe7739f9ffd445a8614c28)`() = default` | 
`public  `[`UnnamedInvokePattern`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1a82c6e63ecc81b7aeb73571c95e86e65a)`(`[`UnnamedInvokePattern`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern)` const & other) = delete` | Copy construction prohibited.
`public  `[`UnnamedInvokePattern`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1a488d7e263ab34ae1bbc97dd12bed30e4)`(`[`UnnamedInvokePattern`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern)` && other) = default` | Move construction allowed.
`public  `[`~UnnamedInvokePattern`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1acf1db905f087aca73b16d9fbc73b1a94)`()` | Destructor implementation.
`public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1a7a64146e6ba54c237e73328b127cbfe6)`(Value * instr,Captures & captures) const` | Matches the callee by name.
`public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1af9c838c21dcab2a56e1b4f5f6ddcdcda)`() const` | Creates a copy of itself.
`typedef `[`String`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1aa89b547d893455bf4cae84eae7cb8ad1) | 

### Members

#### `public  `[`UnnamedInvokePattern`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1a775f77f370fe7739f9ffd445a8614c28)`() = default` {#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1a775f77f370fe7739f9ffd445a8614c28}

#### `public  `[`UnnamedInvokePattern`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1a82c6e63ecc81b7aeb73571c95e86e65a)`(`[`UnnamedInvokePattern`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern)` const & other) = delete` {#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1a82c6e63ecc81b7aeb73571c95e86e65a}

Copy construction prohibited.

#### `public  `[`UnnamedInvokePattern`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1a488d7e263ab34ae1bbc97dd12bed30e4)`(`[`UnnamedInvokePattern`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern)` && other) = default` {#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1a488d7e263ab34ae1bbc97dd12bed30e4}

Move construction allowed.

#### `public  `[`~UnnamedInvokePattern`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1acf1db905f087aca73b16d9fbc73b1a94)`()` {#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1acf1db905f087aca73b16d9fbc73b1a94}

Destructor implementation.

#### `public virtual bool `[`match`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1a7a64146e6ba54c237e73328b127cbfe6)`(Value * instr,Captures & captures) const` {#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1a7a64146e6ba54c237e73328b127cbfe6}

Matches the callee by name.

#### `public virtual Child `[`copy`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1af9c838c21dcab2a56e1b4f5f6ddcdcda)`() const` {#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1af9c838c21dcab2a56e1b4f5f6ddcdcda}

Creates a copy of itself.

#### `typedef `[`String`](#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1aa89b547d893455bf4cae84eae7cb8ad1) {#classmicrosoft_1_1quantum_1_1_unnamed_invoke_pattern_1aa89b547d893455bf4cae84eae7cb8ad1}

## class `microsoft::quantum::ReplacementRule` {#classmicrosoft_1_1quantum_1_1_replacement_rule}

Rule that describes a pattern and how to make a replacement of the matched values. The class contains a OperandPrototype which is used to test whether an LLVM IR value follows a specific pattern. The class also holds a function pointer to logic that allows replacement of the specified value.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`ReplacementRule`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1ae6c109db87ff696539623251ccdc71fa)`() = default` | 
`public  `[`ReplacementRule`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a330c8c2fabc0c59f2c62a79c1266c7b5)`(`[`IOperandPrototypePtr`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a61bfa72f03fbfa6c53b8002a969a595a)` && pattern,`[`ReplaceFunction`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a029532362e33598a7ecc745bc279001d)` && replacer)` | 
`public void `[`setPattern`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a700843e032ddafe2b7ec6fe640cf4ad9)`(`[`IOperandPrototypePtr`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a61bfa72f03fbfa6c53b8002a969a595a)` && pattern)` | Sets the pattern describing logic to be replaced.
`public void `[`setReplacer`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1ab4ce49eba7841ca64eeba4bdd026abe2)`(`[`ReplaceFunction`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a029532362e33598a7ecc745bc279001d)` const & replacer)` | Sets the replacer logic which given a successful match will perform a replacement on the IR.
`public bool `[`match`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1ac7e58dc7feced5ca2b8924a38e88dea5)`(`[`Value`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1afd9ba523c6b96524a36d66f81a3dbd3d)` * value,`[`Captures`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a5d9d153c6aede2708519758e4386cfad)` & captures) const` | Tests whether a given value matches the rule pattern and store captures. The function returns true if the match was successful in which case captures are recorded.
`public bool `[`replace`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a00d6dda8b13a01e059889afbd8b619ca)`(`[`Builder`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1ab975e38f598fc4e3a84039f84ab404d1)` & builder,`[`Value`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1afd9ba523c6b96524a36d66f81a3dbd3d)` * value,`[`Captures`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a5d9d153c6aede2708519758e4386cfad)` & captures,`[`Replacements`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1aca9c759c6f4aace29dc3b0b3b05ce9e1)` & replacements) const` | Invokes the replacer given a matched value and its corresponding captures.
`typedef `[`Captures`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a5d9d153c6aede2708519758e4386cfad) | Table to store LLVM values using a name.
`typedef `[`Value`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1afd9ba523c6b96524a36d66f81a3dbd3d) | Value alias for shorthand usage.
`typedef `[`IOperandPrototypePtr`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a61bfa72f03fbfa6c53b8002a969a595a) | Pointer to the pattern type.
`typedef `[`Builder`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1ab975e38f598fc4e3a84039f84ab404d1) | Builder alias for shorthand notation.
`typedef `[`Replacements`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1aca9c759c6f4aace29dc3b0b3b05ce9e1) | List of replacements.
`typedef `[`ReplaceFunction`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a029532362e33598a7ecc745bc279001d) | Function to perform replacements.
`private `[`IOperandPrototypePtr`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a61bfa72f03fbfa6c53b8002a969a595a)` `[`pattern_`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a9888b53ae55a7817f663b5c76d3fc98f) | Pattern to be matched against.
`private `[`ReplaceFunction`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a029532362e33598a7ecc745bc279001d)` `[`replacer_`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a023c4a5bb746879b1a8dbb9ea51204e9) | Function to perform replacement upon match.

### Members

#### `public  `[`ReplacementRule`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1ae6c109db87ff696539623251ccdc71fa)`() = default` {#classmicrosoft_1_1quantum_1_1_replacement_rule_1ae6c109db87ff696539623251ccdc71fa}

#### `public  `[`ReplacementRule`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a330c8c2fabc0c59f2c62a79c1266c7b5)`(`[`IOperandPrototypePtr`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a61bfa72f03fbfa6c53b8002a969a595a)` && pattern,`[`ReplaceFunction`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a029532362e33598a7ecc745bc279001d)` && replacer)` {#classmicrosoft_1_1quantum_1_1_replacement_rule_1a330c8c2fabc0c59f2c62a79c1266c7b5}

#### `public void `[`setPattern`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a700843e032ddafe2b7ec6fe640cf4ad9)`(`[`IOperandPrototypePtr`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a61bfa72f03fbfa6c53b8002a969a595a)` && pattern)` {#classmicrosoft_1_1quantum_1_1_replacement_rule_1a700843e032ddafe2b7ec6fe640cf4ad9}

Sets the pattern describing logic to be replaced.

#### `public void `[`setReplacer`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1ab4ce49eba7841ca64eeba4bdd026abe2)`(`[`ReplaceFunction`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a029532362e33598a7ecc745bc279001d)` const & replacer)` {#classmicrosoft_1_1quantum_1_1_replacement_rule_1ab4ce49eba7841ca64eeba4bdd026abe2}

Sets the replacer logic which given a successful match will perform a replacement on the IR.

#### `public bool `[`match`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1ac7e58dc7feced5ca2b8924a38e88dea5)`(`[`Value`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1afd9ba523c6b96524a36d66f81a3dbd3d)` * value,`[`Captures`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a5d9d153c6aede2708519758e4386cfad)` & captures) const` {#classmicrosoft_1_1quantum_1_1_replacement_rule_1ac7e58dc7feced5ca2b8924a38e88dea5}

Tests whether a given value matches the rule pattern and store captures. The function returns true if the match was successful in which case captures are recorded.

#### `public bool `[`replace`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a00d6dda8b13a01e059889afbd8b619ca)`(`[`Builder`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1ab975e38f598fc4e3a84039f84ab404d1)` & builder,`[`Value`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1afd9ba523c6b96524a36d66f81a3dbd3d)` * value,`[`Captures`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a5d9d153c6aede2708519758e4386cfad)` & captures,`[`Replacements`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1aca9c759c6f4aace29dc3b0b3b05ce9e1)` & replacements) const` {#classmicrosoft_1_1quantum_1_1_replacement_rule_1a00d6dda8b13a01e059889afbd8b619ca}

Invokes the replacer given a matched value and its corresponding captures.

#### `typedef `[`Captures`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a5d9d153c6aede2708519758e4386cfad) {#classmicrosoft_1_1quantum_1_1_replacement_rule_1a5d9d153c6aede2708519758e4386cfad}

Table to store LLVM values using a name.

#### `typedef `[`Value`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1afd9ba523c6b96524a36d66f81a3dbd3d) {#classmicrosoft_1_1quantum_1_1_replacement_rule_1afd9ba523c6b96524a36d66f81a3dbd3d}

Value alias for shorthand usage.

#### `typedef `[`IOperandPrototypePtr`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a61bfa72f03fbfa6c53b8002a969a595a) {#classmicrosoft_1_1quantum_1_1_replacement_rule_1a61bfa72f03fbfa6c53b8002a969a595a}

Pointer to the pattern type.

#### `typedef `[`Builder`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1ab975e38f598fc4e3a84039f84ab404d1) {#classmicrosoft_1_1quantum_1_1_replacement_rule_1ab975e38f598fc4e3a84039f84ab404d1}

Builder alias for shorthand notation.

#### `typedef `[`Replacements`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1aca9c759c6f4aace29dc3b0b3b05ce9e1) {#classmicrosoft_1_1quantum_1_1_replacement_rule_1aca9c759c6f4aace29dc3b0b3b05ce9e1}

List of replacements.

#### `typedef `[`ReplaceFunction`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a029532362e33598a7ecc745bc279001d) {#classmicrosoft_1_1quantum_1_1_replacement_rule_1a029532362e33598a7ecc745bc279001d}

Function to perform replacements.

#### `private `[`IOperandPrototypePtr`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a61bfa72f03fbfa6c53b8002a969a595a)` `[`pattern_`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a9888b53ae55a7817f663b5c76d3fc98f) {#classmicrosoft_1_1quantum_1_1_replacement_rule_1a9888b53ae55a7817f663b5c76d3fc98f}

Pattern to be matched against.

#### `private `[`ReplaceFunction`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a029532362e33598a7ecc745bc279001d)` `[`replacer_`](#classmicrosoft_1_1quantum_1_1_replacement_rule_1a023c4a5bb746879b1a8dbb9ea51204e9) {#classmicrosoft_1_1quantum_1_1_replacement_rule_1a023c4a5bb746879b1a8dbb9ea51204e9}

Function to perform replacement upon match.

## class `microsoft::quantum::RuleSet` {#classmicrosoft_1_1quantum_1_1_rule_set}

[RuleSet](#classmicrosoft_1_1quantum_1_1_rule_set) contains a set of replacement rules and the corresponding logic to apply the rules. The class allows one to apply the rules by which each rule is tested one-by-one until a successful attempt at performing a replace has happened, or the list was exhausted.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set_1a5c4a1fc09d55364d5f27d7599e1a6bc9)`() = default` | 
`public  `[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set_1a4249380a6d81da327e1a82d246e35983)`(`[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` const &) = default` | 
`public  `[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set_1aac4db8d5c13eda207de4c939de116ca3)`(`[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` &&) = default` | 
`public  `[`~RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set_1ac501082fdec24d35dddae03b5dc51895)`() = default` | 
`public `[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_rule_set_1af21a93893d96649ffa413c3b378c354a)`(`[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` const &) = default` | 
`public `[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_rule_set_1a5dc8172a3eae38d8d6898e231564e60e)`(`[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` &&) = default` | 
`public bool `[`matchAndReplace`](#classmicrosoft_1_1quantum_1_1_rule_set_1a0d6c972010cf86830f113fdf6a3a877c)`(Instruction * value,Replacements & replacements)` | Matches patterns and runs the replacement routines if a match is found. The function returns true if a pattern is matched and and the replacement was a success. In all other cases, it returns false.
`public void `[`addRule`](#classmicrosoft_1_1quantum_1_1_rule_set_1ad26c91b5a8f3bd63abc39b13f1a23b85)`(ReplacementRulePtr const & rule)` | Adds a new replacement rule to the set.
`public void `[`addRule`](#classmicrosoft_1_1quantum_1_1_rule_set_1a48052fbd8d05796b80e499788e0167e4)`(`[`ReplacementRule`](#classmicrosoft_1_1quantum_1_1_replacement_rule)` && rule)` | 
`public void `[`clear`](#classmicrosoft_1_1quantum_1_1_rule_set_1aa5500ad922f898edcb15a14dd1439ccf)`()` | Clears the rule set for all rules.
`public uint64_t `[`size`](#classmicrosoft_1_1quantum_1_1_rule_set_1a64a15bf9496696db0613bab1c80487f2)`() const` | Returns the size of the rule set.
`typedef `[`ReplacementRulePtr`](#classmicrosoft_1_1quantum_1_1_rule_set_1a40ec2f95689cf5a781ba534950fd4d5c) | 
`typedef `[`Rules`](#classmicrosoft_1_1quantum_1_1_rule_set_1ac49bd61bd798f535d96fd54d4562b863) | 
`typedef `[`Replacements`](#classmicrosoft_1_1quantum_1_1_rule_set_1abe997774d4b73e2741fec5613855d514) | 
`typedef `[`Captures`](#classmicrosoft_1_1quantum_1_1_rule_set_1a12758e6398082ad8a4eaf8b08643e8fe) | 
`typedef `[`Instruction`](#classmicrosoft_1_1quantum_1_1_rule_set_1a2ee707e4d65377db742a2ceefdad537a) | 
`typedef `[`Value`](#classmicrosoft_1_1quantum_1_1_rule_set_1a3eff80c6252f2ad26e5af84828cb108d) | 
`typedef `[`Builder`](#classmicrosoft_1_1quantum_1_1_rule_set_1abb4fae44e416b048528bc0cd52f3b258) | 
`typedef `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_rule_set_1acf63ad10024173a3b1b9d5ce67c482fc) | 
`private Rules `[`rules_`](#classmicrosoft_1_1quantum_1_1_rule_set_1aa873fe4f9d974dbdff1cd1c608c98a9b) | Rules that describes QIR mappings.

### Members

#### `public  `[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set_1a5c4a1fc09d55364d5f27d7599e1a6bc9)`() = default` {#classmicrosoft_1_1quantum_1_1_rule_set_1a5c4a1fc09d55364d5f27d7599e1a6bc9}

#### `public  `[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set_1a4249380a6d81da327e1a82d246e35983)`(`[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` const &) = default` {#classmicrosoft_1_1quantum_1_1_rule_set_1a4249380a6d81da327e1a82d246e35983}

#### `public  `[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set_1aac4db8d5c13eda207de4c939de116ca3)`(`[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` &&) = default` {#classmicrosoft_1_1quantum_1_1_rule_set_1aac4db8d5c13eda207de4c939de116ca3}

#### `public  `[`~RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set_1ac501082fdec24d35dddae03b5dc51895)`() = default` {#classmicrosoft_1_1quantum_1_1_rule_set_1ac501082fdec24d35dddae03b5dc51895}

#### `public `[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_rule_set_1af21a93893d96649ffa413c3b378c354a)`(`[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` const &) = default` {#classmicrosoft_1_1quantum_1_1_rule_set_1af21a93893d96649ffa413c3b378c354a}

#### `public `[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_rule_set_1a5dc8172a3eae38d8d6898e231564e60e)`(`[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` &&) = default` {#classmicrosoft_1_1quantum_1_1_rule_set_1a5dc8172a3eae38d8d6898e231564e60e}

#### `public bool `[`matchAndReplace`](#classmicrosoft_1_1quantum_1_1_rule_set_1a0d6c972010cf86830f113fdf6a3a877c)`(Instruction * value,Replacements & replacements)` {#classmicrosoft_1_1quantum_1_1_rule_set_1a0d6c972010cf86830f113fdf6a3a877c}

Matches patterns and runs the replacement routines if a match is found. The function returns true if a pattern is matched and and the replacement was a success. In all other cases, it returns false.

#### `public void `[`addRule`](#classmicrosoft_1_1quantum_1_1_rule_set_1ad26c91b5a8f3bd63abc39b13f1a23b85)`(ReplacementRulePtr const & rule)` {#classmicrosoft_1_1quantum_1_1_rule_set_1ad26c91b5a8f3bd63abc39b13f1a23b85}

Adds a new replacement rule to the set.

#### `public void `[`addRule`](#classmicrosoft_1_1quantum_1_1_rule_set_1a48052fbd8d05796b80e499788e0167e4)`(`[`ReplacementRule`](#classmicrosoft_1_1quantum_1_1_replacement_rule)` && rule)` {#classmicrosoft_1_1quantum_1_1_rule_set_1a48052fbd8d05796b80e499788e0167e4}

#### `public void `[`clear`](#classmicrosoft_1_1quantum_1_1_rule_set_1aa5500ad922f898edcb15a14dd1439ccf)`()` {#classmicrosoft_1_1quantum_1_1_rule_set_1aa5500ad922f898edcb15a14dd1439ccf}

Clears the rule set for all rules.

#### `public uint64_t `[`size`](#classmicrosoft_1_1quantum_1_1_rule_set_1a64a15bf9496696db0613bab1c80487f2)`() const` {#classmicrosoft_1_1quantum_1_1_rule_set_1a64a15bf9496696db0613bab1c80487f2}

Returns the size of the rule set.

#### `typedef `[`ReplacementRulePtr`](#classmicrosoft_1_1quantum_1_1_rule_set_1a40ec2f95689cf5a781ba534950fd4d5c) {#classmicrosoft_1_1quantum_1_1_rule_set_1a40ec2f95689cf5a781ba534950fd4d5c}

#### `typedef `[`Rules`](#classmicrosoft_1_1quantum_1_1_rule_set_1ac49bd61bd798f535d96fd54d4562b863) {#classmicrosoft_1_1quantum_1_1_rule_set_1ac49bd61bd798f535d96fd54d4562b863}

#### `typedef `[`Replacements`](#classmicrosoft_1_1quantum_1_1_rule_set_1abe997774d4b73e2741fec5613855d514) {#classmicrosoft_1_1quantum_1_1_rule_set_1abe997774d4b73e2741fec5613855d514}

#### `typedef `[`Captures`](#classmicrosoft_1_1quantum_1_1_rule_set_1a12758e6398082ad8a4eaf8b08643e8fe) {#classmicrosoft_1_1quantum_1_1_rule_set_1a12758e6398082ad8a4eaf8b08643e8fe}

#### `typedef `[`Instruction`](#classmicrosoft_1_1quantum_1_1_rule_set_1a2ee707e4d65377db742a2ceefdad537a) {#classmicrosoft_1_1quantum_1_1_rule_set_1a2ee707e4d65377db742a2ceefdad537a}

#### `typedef `[`Value`](#classmicrosoft_1_1quantum_1_1_rule_set_1a3eff80c6252f2ad26e5af84828cb108d) {#classmicrosoft_1_1quantum_1_1_rule_set_1a3eff80c6252f2ad26e5af84828cb108d}

#### `typedef `[`Builder`](#classmicrosoft_1_1quantum_1_1_rule_set_1abb4fae44e416b048528bc0cd52f3b258) {#classmicrosoft_1_1quantum_1_1_rule_set_1abb4fae44e416b048528bc0cd52f3b258}

#### `typedef `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_rule_set_1acf63ad10024173a3b1b9d5ce67c482fc) {#classmicrosoft_1_1quantum_1_1_rule_set_1acf63ad10024173a3b1b9d5ce67c482fc}

#### `private Rules `[`rules_`](#classmicrosoft_1_1quantum_1_1_rule_set_1aa873fe4f9d974dbdff1cd1c608c98a9b) {#classmicrosoft_1_1quantum_1_1_rule_set_1aa873fe4f9d974dbdff1cd1c608c98a9b}

Rules that describes QIR mappings.

## class `microsoft::quantum::IrManipulationTestHelper` {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper}

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a002660c6f2da34f069d47f8c54b00944)`()` | 
`public  `[`IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ac3fa0b31a56b3fba128a0c12f80b0b66)`(`[`IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper)` const &) = delete` | 
`public `[`IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1acb503ab846564bbd45c60120bd7250b6)`(`[`IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper)` const &) = delete` | 
`public  `[`IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ad58c3fdabc2589426f8aa3a511039350)`(`[`IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper)` &&) = delete` | 
`public `[`IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a1cb50e61082d6852c9ab3cbabc0b0541)`(`[`IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper)` &&) = delete` | 
`public String `[`toString`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a512daff52a5607ad0cf21e072584295d)`() const` | Generates a string for the IR currently held in the module.
`public Strings `[`toBodyInstructions`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ab49ea98df2fc8452bc3a70a6def6e066)`()` | Generates a list of instructions for the main function in the module.
`public bool `[`hasInstructionSequence`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ae9ad9386966f23f52e9ebed211719a51)`(Strings const & instructions)` | Tests whether the main body contains a sequence of instructions. This function ignores instructions in-between the instruction set given.
`public void `[`applyProfile`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a819d74f6dbfbb8319612f4293c23a1b8)`(GeneratorPtr const & profile,OptimizationLevel const & optimisation_level,bool debug)` | Applies a profile to the module to allow which transforms the IR. This allow us to write small profiles to test a single piece of transformation.
`public void `[`declareOpaque`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a1a1ed5ffdaeac6763826ce7996dc7f7d)`(String const & name)` | Declares a opaque type. Only the name of the type should be supplied to this function. Example usage
`public void `[`declareFunction`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1aa510af2e3424a9ac7678de251d87be3c)`(String const & declaration)` | Declares a function. The full signature should be supplied to as the first argument. Example usage
`public bool `[`fromBodyString`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ac246a17feb952bafd30d44649879ef55)`(String const & body,String const & args)` | Creates an LLVM module given a function body. This function makes use of the inputs from [IrManipulationTestHelper::declareOpaque](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a1a1ed5ffdaeac6763826ce7996dc7f7d) and [IrManipulationTestHelper::declareFunction](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1aa510af2e3424a9ac7678de251d87be3c) to construct the full IR. Example usage:
`public String `[`generateScript`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1acfd7552b58366ca59cdaf211fb8aa144)`(String const & body,String const & args) const` | Generates a script given the body of the main function.
`public bool `[`fromString`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1abcf3ed59354363bdf31926cdde99d17a)`(String const & data)` | Creates an LLVM module given from a fully specified IR. This function ignores all inputs from [IrManipulationTestHelper::declareOpaque](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a1a1ed5ffdaeac6763826ce7996dc7f7d) and [IrManipulationTestHelper::declareFunction](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1aa510af2e3424a9ac7678de251d87be3c).
`public String `[`getErrorMessage`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ace87d6ad59287dbe58a8f33f62afbee8)`() const` | Gets an error message if the compilation failed.
`public bool `[`isModuleBroken`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a2a90342ccb92bd7fccb9adc0a5fe0c8d)`()` | Whether or not the module is broken.
`public ModulePtr & `[`module`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a0b856761e771e6cfe4210132bb048113)`()` | Returns a reference to the module.
`typedef `[`String`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a56024ef2e0ef9533e99244fc21bbadb4) | 
`typedef `[`LLVMContext`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a2d4d102afdb106e7c9e805dd7aada78b) | 
`typedef `[`SMDiagnostic`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1af39b11478913d614a64df980fd6b95de) | 
`typedef `[`Module`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a95c04fd344be1d2d8afa6ae09f05c41d) | 
`typedef `[`ModulePtr`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a70642b0bb74d2ce7357a63a144e0820b) | 
`typedef `[`Strings`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1aaddbaae145986f5960a67c2b30779d98) | 
`typedef `[`OptimizationLevel`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a189fd55760c36904970ffaded09f14ac) | 
`typedef `[`GeneratorPtr`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1acdd48df6b9d535a6a50ea1571ffd870c) | 
`private std::unordered_set< std::string > `[`opaque_declarations_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a828e75be0d72aa6d0afb03661b15b2a6) | Set of opaque type declarations.
`private std::unordered_set< std::string > `[`function_declarations_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1addb1799b7e2d7fbac12bae165d24a24f) | Set of function declarations.
`private bool `[`compilation_failed_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ae21570adabe83466b89afa831f61762c) | Whether the compilation failed.
`private SMDiagnostic `[`error_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ae15b6ef38fc3e5fca602d9096fa85aa8) | The LLVM error encountered.
`private LLVMContext `[`context_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a19901fd1188eb3deecb3416b8d37feef) | The LLVM context.
`private ModulePtr `[`module_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1afb8a5e01ee84916aaf5452aa9a83e06e) | Pointer to the module obtained from the compilation process.
`private llvm::PassBuilder `[`pass_builder_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ab9622ea38897cb662382424c89c621f3) | 
`private llvm::LoopAnalysisManager `[`loop_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ad38c75f2c8dc161363a61da190e4126d) | 
`private llvm::FunctionAnalysisManager `[`function_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ae22051c193e2b248b7a6a559bb78c8da) | 
`private llvm::CGSCCAnalysisManager `[`gscc_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ac91d13cb17d859a4f94f1aaab4ce42d4) | 
`private llvm::ModuleAnalysisManager `[`module_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ab290d3a5c8572d57eea0379e49541dca) | 

### Members

#### `public  `[`IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a002660c6f2da34f069d47f8c54b00944)`()` {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a002660c6f2da34f069d47f8c54b00944}

#### `public  `[`IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ac3fa0b31a56b3fba128a0c12f80b0b66)`(`[`IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ac3fa0b31a56b3fba128a0c12f80b0b66}

#### `public `[`IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1acb503ab846564bbd45c60120bd7250b6)`(`[`IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1acb503ab846564bbd45c60120bd7250b6}

#### `public  `[`IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ad58c3fdabc2589426f8aa3a511039350)`(`[`IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper)` &&) = delete` {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ad58c3fdabc2589426f8aa3a511039350}

#### `public `[`IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a1cb50e61082d6852c9ab3cbabc0b0541)`(`[`IrManipulationTestHelper`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper)` &&) = delete` {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a1cb50e61082d6852c9ab3cbabc0b0541}

#### `public String `[`toString`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a512daff52a5607ad0cf21e072584295d)`() const` {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a512daff52a5607ad0cf21e072584295d}

Generates a string for the IR currently held in the module.

#### `public Strings `[`toBodyInstructions`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ab49ea98df2fc8452bc3a70a6def6e066)`()` {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ab49ea98df2fc8452bc3a70a6def6e066}

Generates a list of instructions for the main function in the module.

#### `public bool `[`hasInstructionSequence`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ae9ad9386966f23f52e9ebed211719a51)`(Strings const & instructions)` {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ae9ad9386966f23f52e9ebed211719a51}

Tests whether the main body contains a sequence of instructions. This function ignores instructions in-between the instruction set given.

#### `public void `[`applyProfile`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a819d74f6dbfbb8319612f4293c23a1b8)`(GeneratorPtr const & profile,OptimizationLevel const & optimisation_level,bool debug)` {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a819d74f6dbfbb8319612f4293c23a1b8}

Applies a profile to the module to allow which transforms the IR. This allow us to write small profiles to test a single piece of transformation.

#### `public void `[`declareOpaque`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a1a1ed5ffdaeac6763826ce7996dc7f7d)`(String const & name)` {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a1a1ed5ffdaeac6763826ce7996dc7f7d}

Declares a opaque type. Only the name of the type should be supplied to this function. Example usage

```cpp
irmanip.declareOpaque("Qubit");
```

#### `public void `[`declareFunction`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1aa510af2e3424a9ac7678de251d87be3c)`(String const & declaration)` {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1aa510af2e3424a9ac7678de251d87be3c}

Declares a function. The full signature should be supplied to as the first argument. Example usage

```cpp
irmanip.declareOpaque("%Result* @__quantum__rt__result_get_zero()");
```

#### `public bool `[`fromBodyString`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ac246a17feb952bafd30d44649879ef55)`(String const & body,String const & args)` {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ac246a17feb952bafd30d44649879ef55}

Creates an LLVM module given a function body. This function makes use of the inputs from [IrManipulationTestHelper::declareOpaque](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a1a1ed5ffdaeac6763826ce7996dc7f7d) and [IrManipulationTestHelper::declareFunction](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1aa510af2e3424a9ac7678de251d87be3c) to construct the full IR. Example usage:

```cpp
irmanip.fromBodyString(R"script(
%leftMessage = call %Qubit* @__quantum__rt__qubit_allocate()
call void @__quantum__qis__h__body(%Qubit* %leftMessage)
)script");
```

Returns false if the IR is invalid.

#### `public String `[`generateScript`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1acfd7552b58366ca59cdaf211fb8aa144)`(String const & body,String const & args) const` {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1acfd7552b58366ca59cdaf211fb8aa144}

Generates a script given the body of the main function.

#### `public bool `[`fromString`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1abcf3ed59354363bdf31926cdde99d17a)`(String const & data)` {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1abcf3ed59354363bdf31926cdde99d17a}

Creates an LLVM module given from a fully specified IR. This function ignores all inputs from [IrManipulationTestHelper::declareOpaque](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a1a1ed5ffdaeac6763826ce7996dc7f7d) and [IrManipulationTestHelper::declareFunction](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1aa510af2e3424a9ac7678de251d87be3c).

Returns false if the IR is invalid.

#### `public String `[`getErrorMessage`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ace87d6ad59287dbe58a8f33f62afbee8)`() const` {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ace87d6ad59287dbe58a8f33f62afbee8}

Gets an error message if the compilation failed.

#### `public bool `[`isModuleBroken`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a2a90342ccb92bd7fccb9adc0a5fe0c8d)`()` {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a2a90342ccb92bd7fccb9adc0a5fe0c8d}

Whether or not the module is broken.

#### `public ModulePtr & `[`module`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a0b856761e771e6cfe4210132bb048113)`()` {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a0b856761e771e6cfe4210132bb048113}

Returns a reference to the module.

#### `typedef `[`String`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a56024ef2e0ef9533e99244fc21bbadb4) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a56024ef2e0ef9533e99244fc21bbadb4}

#### `typedef `[`LLVMContext`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a2d4d102afdb106e7c9e805dd7aada78b) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a2d4d102afdb106e7c9e805dd7aada78b}

#### `typedef `[`SMDiagnostic`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1af39b11478913d614a64df980fd6b95de) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1af39b11478913d614a64df980fd6b95de}

#### `typedef `[`Module`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a95c04fd344be1d2d8afa6ae09f05c41d) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a95c04fd344be1d2d8afa6ae09f05c41d}

#### `typedef `[`ModulePtr`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a70642b0bb74d2ce7357a63a144e0820b) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a70642b0bb74d2ce7357a63a144e0820b}

#### `typedef `[`Strings`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1aaddbaae145986f5960a67c2b30779d98) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1aaddbaae145986f5960a67c2b30779d98}

#### `typedef `[`OptimizationLevel`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a189fd55760c36904970ffaded09f14ac) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a189fd55760c36904970ffaded09f14ac}

#### `typedef `[`GeneratorPtr`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1acdd48df6b9d535a6a50ea1571ffd870c) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1acdd48df6b9d535a6a50ea1571ffd870c}

#### `private std::unordered_set< std::string > `[`opaque_declarations_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a828e75be0d72aa6d0afb03661b15b2a6) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a828e75be0d72aa6d0afb03661b15b2a6}

Set of opaque type declarations.

#### `private std::unordered_set< std::string > `[`function_declarations_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1addb1799b7e2d7fbac12bae165d24a24f) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1addb1799b7e2d7fbac12bae165d24a24f}

Set of function declarations.

#### `private bool `[`compilation_failed_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ae21570adabe83466b89afa831f61762c) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ae21570adabe83466b89afa831f61762c}

Whether the compilation failed.

#### `private SMDiagnostic `[`error_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ae15b6ef38fc3e5fca602d9096fa85aa8) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ae15b6ef38fc3e5fca602d9096fa85aa8}

The LLVM error encountered.

#### `private LLVMContext `[`context_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a19901fd1188eb3deecb3416b8d37feef) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1a19901fd1188eb3deecb3416b8d37feef}

The LLVM context.

#### `private ModulePtr `[`module_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1afb8a5e01ee84916aaf5452aa9a83e06e) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1afb8a5e01ee84916aaf5452aa9a83e06e}

Pointer to the module obtained from the compilation process.

#### `private llvm::PassBuilder `[`pass_builder_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ab9622ea38897cb662382424c89c621f3) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ab9622ea38897cb662382424c89c621f3}

#### `private llvm::LoopAnalysisManager `[`loop_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ad38c75f2c8dc161363a61da190e4126d) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ad38c75f2c8dc161363a61da190e4126d}

#### `private llvm::FunctionAnalysisManager `[`function_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ae22051c193e2b248b7a6a559bb78c8da) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ae22051c193e2b248b7a6a559bb78c8da}

#### `private llvm::CGSCCAnalysisManager `[`gscc_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ac91d13cb17d859a4f94f1aaab4ce42d4) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ac91d13cb17d859a4f94f1aaab4ce42d4}

#### `private llvm::ModuleAnalysisManager `[`module_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ab290d3a5c8572d57eea0379e49541dca) {#classmicrosoft_1_1quantum_1_1_ir_manipulation_test_helper_1ab290d3a5c8572d57eea0379e49541dca}

## class `microsoft::quantum::TransformationRulesPass` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass}

```
class microsoft::quantum::TransformationRulesPass
  : public llvm::PassInfoMixin< TransformationRulesPass >
```

This class applies a set of transformation rules to the IR to transform it into a new IR. The rules are added using the [RuleSet](#classmicrosoft_1_1quantum_1_1_rule_set) class which allows the developer to create one or more rules on how to transform the IR.

The module executes the following steps: ┌─────────────────┐ │ Apply profile │ └─────────────────┘ │ ┌───────────────────────────────┐ ├───────────────▶│ Copy and expand functions │──┐ │ clone └───────────────────────────────┘ │ │ functions? │ delete dead │ │ ▼ code? │ │ ┌───────────────────────────────┐ │ ├───────────────▶│ Determine active code │ │ │ delete dead └───────────────────────────────┘ │ │ code? │ │ leave dead │ ▼ │ code? │ ┌───────────────────────────────┐ │ │ │ Simplify phi nodes │ │ │ └───────────────────────────────┘ │ │ │ │ │ ▼ │ │ ┌───────────────────────────────┐ │ │ │ Delete dead code │ │ │ └───────────────────────────────┘ │ │ │ │ │ ▼ │ │ fallback ┌───────────────────────────────┐ │ └───────────────▶│ Apply rules │◀─┘ └───────────────────────────────┘

Copying and expanding functions identifies function calls and identifies compile time constants passed to the function. It then copies the full implementation of the function, replacing all compile-time constants (and hence changing the function signature). That is, if a function call `f(x, 9)` is identified, it is replaced with `f.1(x)` where `f.1` is a copy of `f` with second argument written into the function.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ad2be262fef91d79effa0b39af820967a)`(`[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` && rule_set,`[`TransformationRulesPassConfiguration`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration)` const & config,`[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` * profile)` | Custom default constructor.
`public  `[`TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a4021ba207d45c28c5f844a2ffab41d5f)`(`[`TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass)` const &) = delete` | Copy construction is banned.
`public  `[`TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a8180e267b570649b10ea8c900b578f30)`(`[`TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass)` &&) = default` | We allow move semantics.
`public  `[`~TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a08deb76861a6aa5d8fb3918d6e8b2739)`() = default` | Default destruction.
`public `[`TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1acf8a44eebe50e5141a1f9f088c1fa8ff)`(`[`TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass)` const &) = delete` | Copy assignment is banned.
`public `[`TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a058805fa119b33e409c40cdc8787a6f8)`(`[`TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass)` &&) = default` | Move assignment is permitted.
`public llvm::PreservedAnalyses `[`run`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a00addfd679de49affe569810b6cd79f3)`(llvm::Module & module,llvm::ModuleAnalysisManager & mam)` | Implements the transformation analysis which uses the supplied ruleset to make substitutions in each function.
`public bool `[`runOnFunction`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1acddcbb6d2c3664db23f00db0f5138ea3)`(llvm::Function & function,InstructionModifier const & modifier)` | Generic function to apply a instructionModifier (lambda function) to every instruction in the function `function`. This method follows the execution path to the extend possible and deals with branching if the branch statement can be evaluated at compile time.
`public void `[`processReplacements`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a11a631e532b56a74f4682d4de8a78cb2)`()` | Applies each of the replacements in the `replacements_` variable.
`public void `[`setupCopyAndExpand`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a0eb589b31225635c588c08456b593d72)`()` | Configuration function for copy and expand to setup the necessary rules.
`public void `[`runCopyAndExpand`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1adc26444e98922ba682254232d46be841)`(llvm::Module & module,llvm::ModuleAnalysisManager & mam)` | Main function for running the copy and expand functionality. This function first identifies the entry point and then follows every execution path to copy the callee function for every call instruction encountered. This makes that every call in the code has its own unique callee function which ensures that when allocating qubits or results, the assigned registers are not accidentally reused.
`public llvm::Value * `[`copyAndExpand`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a213929ddf4a326cc4f0e049c402ab9af)`(llvm::Value * input,DeletableInstructions &)` | Test whether the instruction is a call instruction and copy the callee in case it is. This function collects instructions which are scheduled for deletion at a later point.
`public llvm::Function * `[`expandFunctionCall`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1af7b21ae47a34ac3db1662812b8f20a68)`(llvm::Function & callee,ConstantArguments const & const_args)` | Copies the function body and replace function arguments whenever arguments are constant.
`public void `[`constantFoldFunction`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a0e09cd930eff6dd76c11f2cbe8f426fa)`(llvm::Function & callee)` | Folds all constant expression in function.
`public void `[`addConstExprRule`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a12db5661405c6b172188fc145eaf4582)`(`[`ReplacementRule`](#classmicrosoft_1_1quantum_1_1_replacement_rule)` && rule)` | Helper function to create replacements for constant expressions.
`public void `[`runDetectActiveCode`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a52f2dabdac85110b1cfba2dbe642d6c6)`(llvm::Module & module,llvm::ModuleAnalysisManager & mam)` | 
`public void `[`runDeleteDeadCode`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ae5cc37e351fdd49382fdebafcb98d2b3)`(llvm::Module & module,llvm::ModuleAnalysisManager & mam)` | 
`public llvm::Value * `[`detectActiveCode`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ab43309dc425d43456f06abaf4eb55999)`(llvm::Value * input,DeletableInstructions &)` | 
`public llvm::Value * `[`deleteDeadCode`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a2c328d9003c914726e99201f854c5a59)`(llvm::Value * input,DeletableInstructions &)` | 
`public bool `[`isActive`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a09c4210fc38ebf4bea3c9ce4704eba7a)`(llvm::Value * value) const` | 
`public void `[`followUsers`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a1b76d2e69bd1db38df96227b177c23b0)`(llvm::Value * value)` | 
`public void `[`runReplacePhi`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1aec2f95af82310283c7ec1457fea6f7e7)`(llvm::Module & module,llvm::ModuleAnalysisManager & mam)` | Function which replaces phi nodes which refer to inactive blocks. That is, in cases where branch statement evaluates at compile time, only one block will be marked as active. For those case we can eliminate the phi nodes. In the case where branch statements cannot be evaluated all are marked as active. In this case, phi nodes are left unchanged.
`public void `[`runApplyRules`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ae969e346542cbbe0902e2f1a93d563db)`(llvm::Module & module,llvm::ModuleAnalysisManager & mam)` | 
`public bool `[`onQubitRelease`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a884450ed469cd68d650311179c022f2f)`(llvm::Instruction * instruction,Captures & captures)` | 
`public bool `[`onQubitAllocate`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a480b9c053224192ecc6dcb19f909883e)`(llvm::Instruction * instruction,Captures & captures)` | 
`public void `[`setLogger`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a45642740d08894a7c7329eb829f6f2aa)`(ILoggerPtr logger)` | 
`typedef `[`Replacements`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1af0a45129ba9202ac90347601f719134f) | 
`typedef `[`Instruction`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a5b814f3af3684d6b66f405b516d33981) | 
`typedef `[`Rules`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1abf8768343b0fa26c376f2098a313a4ee) | 
`typedef `[`Value`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a7507d540699f7033bcb6aeb37a0a1755) | 
`typedef `[`Builder`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a8dc84138fb75565886b7f8c586827be5) | 
`typedef `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a0b426f8ca398834a0904d11e182d810d) | 
`typedef `[`Captures`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a529fcc11a8a71893a98d5a967c400016) | 
`typedef `[`ConstantArguments`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a07ac388be0bc998c320576e5c659ff91) | 
`typedef `[`ILoggerPtr`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ab1bf7939cea62871c46f2831c7d4bd08) | 
`typedef `[`DeletableInstructions`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a96436bab68086f9477de7cb38a7ba6d2) | 
`typedef `[`InstructionModifier`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a5c02846dcce74acafbecaebab953224f) | 
`private `[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` `[`rule_set_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a5d02953429b53ef034e3872538cc2df2) | Rule set which describes a set of transformations to apply to the QIR.
`private `[`TransformationRulesPassConfiguration`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration)` `[`config_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1aa3102df33b8b3f21826ebd6fb90856cc) | Configuration with enabled or disabled features, recursion limits etc.
`private ILoggerPtr `[`logger_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a34256cf8cf42c2d7621853dde04b3611) | Logger which is used to collect information, debug info, warnings, errors and internal errors.
`private uint64_t `[`depth_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a219511054f21c56b39f0313f0d5036c5) | Current recursion depth which is used to prevent unbound (at compile time) recursion.
`private `[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` `[`const_expr_replacements_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ac2c05943cb52fb5a7cd95d653047a1c7) | Rule set which is used to collapse compile-time constant expressions.
`private std::unordered_set< Value * > `[`active_pieces_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1aa5b24d39ac5feba7340d5d25e9240944) | Set to track active Values in the code.
`private std::vector< llvm::BasicBlock * > `[`blocks_to_delete_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ad897201e051c45e390e527f40162a92a) | Vector with block pointers to delete.
`private std::vector< llvm::Function * > `[`functions_to_delete_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a28cd67ab06533636f830fcb2f5230b1e) | Vector of function pointers to delete.
`private Replacements `[`replacements_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a591bfdc977b29fa9b91bd8da79925367) | Registered replacements to be executed.
`private `[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` * `[`profile_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a325cde9035481f4c15cdff8090c179e8) | Pointer to the current profile. This pointer is used to annotate top level functions with regards to how many qubits they require. TODO(issue-22): Consider moving into its own component.
`public static bool `[`isRequired`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ac928c8cb0c26cd36ee3f7e90ca7f9f1e)`()` | Whether or not this pass is required to run.

### Members

#### `public  `[`TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ad2be262fef91d79effa0b39af820967a)`(`[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` && rule_set,`[`TransformationRulesPassConfiguration`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration)` const & config,`[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` * profile)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ad2be262fef91d79effa0b39af820967a}

Custom default constructor.

#### `public  `[`TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a4021ba207d45c28c5f844a2ffab41d5f)`(`[`TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a4021ba207d45c28c5f844a2ffab41d5f}

Copy construction is banned.

#### `public  `[`TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a8180e267b570649b10ea8c900b578f30)`(`[`TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass)` &&) = default` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a8180e267b570649b10ea8c900b578f30}

We allow move semantics.

#### `public  `[`~TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a08deb76861a6aa5d8fb3918d6e8b2739)`() = default` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a08deb76861a6aa5d8fb3918d6e8b2739}

Default destruction.

#### `public `[`TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1acf8a44eebe50e5141a1f9f088c1fa8ff)`(`[`TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1acf8a44eebe50e5141a1f9f088c1fa8ff}

Copy assignment is banned.

#### `public `[`TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a058805fa119b33e409c40cdc8787a6f8)`(`[`TransformationRulesPass`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass)` &&) = default` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a058805fa119b33e409c40cdc8787a6f8}

Move assignment is permitted.

#### `public llvm::PreservedAnalyses `[`run`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a00addfd679de49affe569810b6cd79f3)`(llvm::Module & module,llvm::ModuleAnalysisManager & mam)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a00addfd679de49affe569810b6cd79f3}

Implements the transformation analysis which uses the supplied ruleset to make substitutions in each function.

#### `public bool `[`runOnFunction`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1acddcbb6d2c3664db23f00db0f5138ea3)`(llvm::Function & function,InstructionModifier const & modifier)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1acddcbb6d2c3664db23f00db0f5138ea3}

Generic function to apply a instructionModifier (lambda function) to every instruction in the function `function`. This method follows the execution path to the extend possible and deals with branching if the branch statement can be evaluated at compile time.

#### `public void `[`processReplacements`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a11a631e532b56a74f4682d4de8a78cb2)`()` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a11a631e532b56a74f4682d4de8a78cb2}

Applies each of the replacements in the `replacements_` variable.

#### `public void `[`setupCopyAndExpand`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a0eb589b31225635c588c08456b593d72)`()` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a0eb589b31225635c588c08456b593d72}

Configuration function for copy and expand to setup the necessary rules.

#### `public void `[`runCopyAndExpand`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1adc26444e98922ba682254232d46be841)`(llvm::Module & module,llvm::ModuleAnalysisManager & mam)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1adc26444e98922ba682254232d46be841}

Main function for running the copy and expand functionality. This function first identifies the entry point and then follows every execution path to copy the callee function for every call instruction encountered. This makes that every call in the code has its own unique callee function which ensures that when allocating qubits or results, the assigned registers are not accidentally reused.

#### `public llvm::Value * `[`copyAndExpand`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a213929ddf4a326cc4f0e049c402ab9af)`(llvm::Value * input,DeletableInstructions &)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a213929ddf4a326cc4f0e049c402ab9af}

Test whether the instruction is a call instruction and copy the callee in case it is. This function collects instructions which are scheduled for deletion at a later point.

#### `public llvm::Function * `[`expandFunctionCall`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1af7b21ae47a34ac3db1662812b8f20a68)`(llvm::Function & callee,ConstantArguments const & const_args)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1af7b21ae47a34ac3db1662812b8f20a68}

Copies the function body and replace function arguments whenever arguments are constant.

#### `public void `[`constantFoldFunction`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a0e09cd930eff6dd76c11f2cbe8f426fa)`(llvm::Function & callee)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a0e09cd930eff6dd76c11f2cbe8f426fa}

Folds all constant expression in function.

#### `public void `[`addConstExprRule`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a12db5661405c6b172188fc145eaf4582)`(`[`ReplacementRule`](#classmicrosoft_1_1quantum_1_1_replacement_rule)` && rule)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a12db5661405c6b172188fc145eaf4582}

Helper function to create replacements for constant expressions.

#### `public void `[`runDetectActiveCode`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a52f2dabdac85110b1cfba2dbe642d6c6)`(llvm::Module & module,llvm::ModuleAnalysisManager & mam)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a52f2dabdac85110b1cfba2dbe642d6c6}

#### `public void `[`runDeleteDeadCode`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ae5cc37e351fdd49382fdebafcb98d2b3)`(llvm::Module & module,llvm::ModuleAnalysisManager & mam)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ae5cc37e351fdd49382fdebafcb98d2b3}

#### `public llvm::Value * `[`detectActiveCode`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ab43309dc425d43456f06abaf4eb55999)`(llvm::Value * input,DeletableInstructions &)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ab43309dc425d43456f06abaf4eb55999}

#### `public llvm::Value * `[`deleteDeadCode`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a2c328d9003c914726e99201f854c5a59)`(llvm::Value * input,DeletableInstructions &)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a2c328d9003c914726e99201f854c5a59}

#### `public bool `[`isActive`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a09c4210fc38ebf4bea3c9ce4704eba7a)`(llvm::Value * value) const` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a09c4210fc38ebf4bea3c9ce4704eba7a}

#### `public void `[`followUsers`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a1b76d2e69bd1db38df96227b177c23b0)`(llvm::Value * value)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a1b76d2e69bd1db38df96227b177c23b0}

#### `public void `[`runReplacePhi`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1aec2f95af82310283c7ec1457fea6f7e7)`(llvm::Module & module,llvm::ModuleAnalysisManager & mam)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1aec2f95af82310283c7ec1457fea6f7e7}

Function which replaces phi nodes which refer to inactive blocks. That is, in cases where branch statement evaluates at compile time, only one block will be marked as active. For those case we can eliminate the phi nodes. In the case where branch statements cannot be evaluated all are marked as active. In this case, phi nodes are left unchanged.

#### `public void `[`runApplyRules`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ae969e346542cbbe0902e2f1a93d563db)`(llvm::Module & module,llvm::ModuleAnalysisManager & mam)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ae969e346542cbbe0902e2f1a93d563db}

#### `public bool `[`onQubitRelease`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a884450ed469cd68d650311179c022f2f)`(llvm::Instruction * instruction,Captures & captures)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a884450ed469cd68d650311179c022f2f}

#### `public bool `[`onQubitAllocate`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a480b9c053224192ecc6dcb19f909883e)`(llvm::Instruction * instruction,Captures & captures)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a480b9c053224192ecc6dcb19f909883e}

#### `public void `[`setLogger`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a45642740d08894a7c7329eb829f6f2aa)`(ILoggerPtr logger)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a45642740d08894a7c7329eb829f6f2aa}

#### `typedef `[`Replacements`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1af0a45129ba9202ac90347601f719134f) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1af0a45129ba9202ac90347601f719134f}

#### `typedef `[`Instruction`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a5b814f3af3684d6b66f405b516d33981) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a5b814f3af3684d6b66f405b516d33981}

#### `typedef `[`Rules`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1abf8768343b0fa26c376f2098a313a4ee) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1abf8768343b0fa26c376f2098a313a4ee}

#### `typedef `[`Value`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a7507d540699f7033bcb6aeb37a0a1755) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a7507d540699f7033bcb6aeb37a0a1755}

#### `typedef `[`Builder`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a8dc84138fb75565886b7f8c586827be5) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a8dc84138fb75565886b7f8c586827be5}

#### `typedef `[`AllocationManagerPtr`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a0b426f8ca398834a0904d11e182d810d) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a0b426f8ca398834a0904d11e182d810d}

#### `typedef `[`Captures`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a529fcc11a8a71893a98d5a967c400016) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a529fcc11a8a71893a98d5a967c400016}

#### `typedef `[`ConstantArguments`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a07ac388be0bc998c320576e5c659ff91) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a07ac388be0bc998c320576e5c659ff91}

#### `typedef `[`ILoggerPtr`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ab1bf7939cea62871c46f2831c7d4bd08) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ab1bf7939cea62871c46f2831c7d4bd08}

#### `typedef `[`DeletableInstructions`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a96436bab68086f9477de7cb38a7ba6d2) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a96436bab68086f9477de7cb38a7ba6d2}

#### `typedef `[`InstructionModifier`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a5c02846dcce74acafbecaebab953224f) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a5c02846dcce74acafbecaebab953224f}

#### `private `[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` `[`rule_set_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a5d02953429b53ef034e3872538cc2df2) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a5d02953429b53ef034e3872538cc2df2}

Rule set which describes a set of transformations to apply to the QIR.

#### `private `[`TransformationRulesPassConfiguration`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration)` `[`config_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1aa3102df33b8b3f21826ebd6fb90856cc) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1aa3102df33b8b3f21826ebd6fb90856cc}

Configuration with enabled or disabled features, recursion limits etc.

#### `private ILoggerPtr `[`logger_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a34256cf8cf42c2d7621853dde04b3611) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a34256cf8cf42c2d7621853dde04b3611}

Logger which is used to collect information, debug info, warnings, errors and internal errors.

#### `private uint64_t `[`depth_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a219511054f21c56b39f0313f0d5036c5) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a219511054f21c56b39f0313f0d5036c5}

Current recursion depth which is used to prevent unbound (at compile time) recursion.

#### `private `[`RuleSet`](#classmicrosoft_1_1quantum_1_1_rule_set)` `[`const_expr_replacements_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ac2c05943cb52fb5a7cd95d653047a1c7) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ac2c05943cb52fb5a7cd95d653047a1c7}

Rule set which is used to collapse compile-time constant expressions.

#### `private std::unordered_set< Value * > `[`active_pieces_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1aa5b24d39ac5feba7340d5d25e9240944) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1aa5b24d39ac5feba7340d5d25e9240944}

Set to track active Values in the code.

#### `private std::vector< llvm::BasicBlock * > `[`blocks_to_delete_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ad897201e051c45e390e527f40162a92a) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ad897201e051c45e390e527f40162a92a}

Vector with block pointers to delete.

#### `private std::vector< llvm::Function * > `[`functions_to_delete_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a28cd67ab06533636f830fcb2f5230b1e) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a28cd67ab06533636f830fcb2f5230b1e}

Vector of function pointers to delete.

#### `private Replacements `[`replacements_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a591bfdc977b29fa9b91bd8da79925367) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a591bfdc977b29fa9b91bd8da79925367}

Registered replacements to be executed.

#### `private `[`Profile`](#classmicrosoft_1_1quantum_1_1_profile)` * `[`profile_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a325cde9035481f4c15cdff8090c179e8) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1a325cde9035481f4c15cdff8090c179e8}

Pointer to the current profile. This pointer is used to annotate top level functions with regards to how many qubits they require. TODO(issue-22): Consider moving into its own component.

#### `public static bool `[`isRequired`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ac928c8cb0c26cd36ee3f7e90ca7f9f1e)`()` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_1ac928c8cb0c26cd36ee3f7e90ca7f9f1e}

Whether or not this pass is required to run.

## class `microsoft::quantum::TransformationRulesPassConfiguration` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration}

Configuration class for the RuleTransformation pass.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public void `[`setup`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a5b9ebdb3083d5fa17dcd60765c629623)`(`[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` & config)` | Setup function that attached the configuration to the [ConfigurationManager](#classmicrosoft_1_1quantum_1_1_configuration_manager).
`public bool `[`isDisabled`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a726c051578ab6a6b6d77af1df0b955fa)`() const` | Tests whether all functionality is disabled for this component.
`public bool `[`operator==`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a0da974cb0bcac3402e864252576e5967)`(`[`TransformationRulesPassConfiguration`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration)` const & ref) const` | Testing equality of two configurations.
`public bool `[`shouldDeleteDeadCode`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1ab95f924bde7f3a4884722dfbb29f28a1)`() const` | Whether or not the component should delete dead code.
`public bool `[`shouldCloneFunctions`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a2f2e9c0ddc9e2bfb7ae891e53f6646f9)`() const` | Whether or not the component should clone functions. This is relevant in relation to qubit allocation if execution paths are expanded.
`public bool `[`assumeNoExceptions`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1afa8268b4b9bea760bce841225609fae5)`() const` | Whether or not we assume that the code does not throw at runtime.
`public bool `[`shouldTransformExecutionPathOnly`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a96661a4711bd3bea8788865ec70c6907)`() const` | Whether or not the component should follow the execution path only or it should be applied to all parts of the code. For statically allocated qubits one generally wants to follow the execution path whereas it makes more sense to apply to all parts of the code for dynamic qubit allocation.
`public uint64_t `[`maxRecursion`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1abafd8ac31350dcf307fc64defc8520ef)`() const` | The maximum recursion acceptable when unrolling the execution path.
`public bool `[`shouldReuseQubits`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1acce4ab33f0f09a10d10e601f20a6cd31)`() const` | Whether or not to reuse qubits.
`public bool `[`shouldAnnotateQubitUse`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1aa6bec9384a7cb546fc6059e145a6034e)`() const` | Whether or not to annotate entry point with the number of qubits they use.
`public bool `[`shouldReuseResults`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a97dc372ed702c161657ef9b341a2618b)`() const` | Whether or not to reuse result registers.
`public bool `[`shouldAnnotateResultUse`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a0dc9bf3a8a78ee1d151663e58538a30a)`() const` | Whether or not to annotate entry point with the number of results they use.
`public bool `[`shouldGroupMeasurements`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a380c53738fc8e0e483b503e99a86a28b)`() const` | Whether or not the component should attempt to group measurements.
`public bool `[`oneShotMeasurement`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a3630d5f6c09f2b2d7d93107597d25ce1)`() const` | Whether or not the target supports measurement (and result interpretation) during the circuit execution.
`public bool `[`shouldSimplifyPriorTransform`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a96ead027da602486b19e1c0e29cc5b85)`() const` | Whether or not simplify the IR using LLVM passes prior to transforming the IR.
`public std::string `[`entryPointAttr`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1aeb2660c93da473cf6623fce821368a4c)`() const` | Attribute which indicate that a function is the entry point.
`private bool `[`delete_dead_code_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1aa2122dd8fb4813ec97b62e93b178d7eb) | 
`private bool `[`clone_functions_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a3b3f4fc464c015edba7625fe533420dc) | 
`private bool `[`transform_execution_path_only_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1aa272946855d21349352f24728d7333d0) | 
`private uint64_t `[`max_recursion_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a3349d12caa550950d18a224c041aaa79) | 
`private std::string `[`entry_point_attr_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1ab107f5143d7e855de1903c84b922465d) | 
`private bool `[`simplify_prior_transformation_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1af15bbd32615b62600e8a8c4527820d9f) | 
`private bool `[`assume_no_exceptions_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1aa50dd84f548fd7bfbc483da461cbc540) | 
`private bool `[`reuse_qubits_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a4dcb226196399999d8dea34f9800bad6) | 
`private bool `[`annotate_qubit_use_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1aa2919f3d6d71d204ac1e23de7db1d280) | 
`private bool `[`reuse_results_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1af69975199e5a3bc9a4b655a64584ff0b) | 
`private bool `[`annotate_result_use_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a2e11043c73aab715955c1d9d5a59ddc4) | 
`private bool `[`group_measurements_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a8dda99dcd42f8af296379d606cc3dc80) | 
`private bool `[`one_shot_measurement_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a02d62c864780aee947adf8c9b062e4df) | 
`public static `[`TransformationRulesPassConfiguration`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration)` `[`createDisabled`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1ad2493200a8bdb35e45c8ebcab15a3f4b)`()` | Creates a configuration where all functionality is disabled.

### Members

#### `public void `[`setup`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a5b9ebdb3083d5fa17dcd60765c629623)`(`[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` & config)` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a5b9ebdb3083d5fa17dcd60765c629623}

Setup function that attached the configuration to the [ConfigurationManager](#classmicrosoft_1_1quantum_1_1_configuration_manager).

#### `public bool `[`isDisabled`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a726c051578ab6a6b6d77af1df0b955fa)`() const` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a726c051578ab6a6b6d77af1df0b955fa}

Tests whether all functionality is disabled for this component.

#### `public bool `[`operator==`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a0da974cb0bcac3402e864252576e5967)`(`[`TransformationRulesPassConfiguration`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration)` const & ref) const` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a0da974cb0bcac3402e864252576e5967}

Testing equality of two configurations.

#### `public bool `[`shouldDeleteDeadCode`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1ab95f924bde7f3a4884722dfbb29f28a1)`() const` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1ab95f924bde7f3a4884722dfbb29f28a1}

Whether or not the component should delete dead code.

#### `public bool `[`shouldCloneFunctions`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a2f2e9c0ddc9e2bfb7ae891e53f6646f9)`() const` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a2f2e9c0ddc9e2bfb7ae891e53f6646f9}

Whether or not the component should clone functions. This is relevant in relation to qubit allocation if execution paths are expanded.

#### `public bool `[`assumeNoExceptions`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1afa8268b4b9bea760bce841225609fae5)`() const` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1afa8268b4b9bea760bce841225609fae5}

Whether or not we assume that the code does not throw at runtime.

#### `public bool `[`shouldTransformExecutionPathOnly`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a96661a4711bd3bea8788865ec70c6907)`() const` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a96661a4711bd3bea8788865ec70c6907}

Whether or not the component should follow the execution path only or it should be applied to all parts of the code. For statically allocated qubits one generally wants to follow the execution path whereas it makes more sense to apply to all parts of the code for dynamic qubit allocation.

#### `public uint64_t `[`maxRecursion`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1abafd8ac31350dcf307fc64defc8520ef)`() const` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1abafd8ac31350dcf307fc64defc8520ef}

The maximum recursion acceptable when unrolling the execution path.

#### `public bool `[`shouldReuseQubits`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1acce4ab33f0f09a10d10e601f20a6cd31)`() const` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1acce4ab33f0f09a10d10e601f20a6cd31}

Whether or not to reuse qubits.

#### `public bool `[`shouldAnnotateQubitUse`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1aa6bec9384a7cb546fc6059e145a6034e)`() const` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1aa6bec9384a7cb546fc6059e145a6034e}

Whether or not to annotate entry point with the number of qubits they use.

#### `public bool `[`shouldReuseResults`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a97dc372ed702c161657ef9b341a2618b)`() const` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a97dc372ed702c161657ef9b341a2618b}

Whether or not to reuse result registers.

#### `public bool `[`shouldAnnotateResultUse`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a0dc9bf3a8a78ee1d151663e58538a30a)`() const` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a0dc9bf3a8a78ee1d151663e58538a30a}

Whether or not to annotate entry point with the number of results they use.

#### `public bool `[`shouldGroupMeasurements`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a380c53738fc8e0e483b503e99a86a28b)`() const` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a380c53738fc8e0e483b503e99a86a28b}

Whether or not the component should attempt to group measurements.

#### `public bool `[`oneShotMeasurement`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a3630d5f6c09f2b2d7d93107597d25ce1)`() const` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a3630d5f6c09f2b2d7d93107597d25ce1}

Whether or not the target supports measurement (and result interpretation) during the circuit execution.

#### `public bool `[`shouldSimplifyPriorTransform`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a96ead027da602486b19e1c0e29cc5b85)`() const` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a96ead027da602486b19e1c0e29cc5b85}

Whether or not simplify the IR using LLVM passes prior to transforming the IR.

#### `public std::string `[`entryPointAttr`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1aeb2660c93da473cf6623fce821368a4c)`() const` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1aeb2660c93da473cf6623fce821368a4c}

Attribute which indicate that a function is the entry point.

#### `private bool `[`delete_dead_code_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1aa2122dd8fb4813ec97b62e93b178d7eb) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1aa2122dd8fb4813ec97b62e93b178d7eb}

#### `private bool `[`clone_functions_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a3b3f4fc464c015edba7625fe533420dc) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a3b3f4fc464c015edba7625fe533420dc}

#### `private bool `[`transform_execution_path_only_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1aa272946855d21349352f24728d7333d0) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1aa272946855d21349352f24728d7333d0}

#### `private uint64_t `[`max_recursion_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a3349d12caa550950d18a224c041aaa79) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a3349d12caa550950d18a224c041aaa79}

#### `private std::string `[`entry_point_attr_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1ab107f5143d7e855de1903c84b922465d) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1ab107f5143d7e855de1903c84b922465d}

#### `private bool `[`simplify_prior_transformation_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1af15bbd32615b62600e8a8c4527820d9f) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1af15bbd32615b62600e8a8c4527820d9f}

#### `private bool `[`assume_no_exceptions_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1aa50dd84f548fd7bfbc483da461cbc540) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1aa50dd84f548fd7bfbc483da461cbc540}

#### `private bool `[`reuse_qubits_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a4dcb226196399999d8dea34f9800bad6) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a4dcb226196399999d8dea34f9800bad6}

#### `private bool `[`annotate_qubit_use_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1aa2919f3d6d71d204ac1e23de7db1d280) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1aa2919f3d6d71d204ac1e23de7db1d280}

#### `private bool `[`reuse_results_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1af69975199e5a3bc9a4b655a64584ff0b) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1af69975199e5a3bc9a4b655a64584ff0b}

#### `private bool `[`annotate_result_use_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a2e11043c73aab715955c1d9d5a59ddc4) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a2e11043c73aab715955c1d9d5a59ddc4}

#### `private bool `[`group_measurements_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a8dda99dcd42f8af296379d606cc3dc80) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a8dda99dcd42f8af296379d606cc3dc80}

#### `private bool `[`one_shot_measurement_`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a02d62c864780aee947adf8c9b062e4df) {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1a02d62c864780aee947adf8c9b062e4df}

#### `public static `[`TransformationRulesPassConfiguration`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration)` `[`createDisabled`](#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1ad2493200a8bdb35e45c8ebcab15a3f4b)`()` {#classmicrosoft_1_1quantum_1_1_transformation_rules_pass_configuration_1ad2493200a8bdb35e45c8ebcab15a3f4b}

Creates a configuration where all functionality is disabled.

## class `microsoft::quantum::ValidationPass` {#classmicrosoft_1_1quantum_1_1_validation_pass}

```
class microsoft::quantum::ValidationPass
  : public llvm::PassInfoMixin< ValidationPass >
```

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public inline  explicit `[`ValidationPass`](#classmicrosoft_1_1quantum_1_1_validation_pass_1aa80f01e06b24a2b6b8f1ad6fd51f61d6)`(`[`ValidationPassConfiguration`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration)` const & cfg,ILoggerPtr const & logger)` | 
`public  `[`ValidationPass`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a01d0f69c64c3c646839d4a7239c74418)`(`[`ValidationPass`](#classmicrosoft_1_1quantum_1_1_validation_pass)` const &) = delete` | Copy construction is banned.
`public  `[`ValidationPass`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a3c3d4859a9792ba42c2709c6b7f4be73)`(`[`ValidationPass`](#classmicrosoft_1_1quantum_1_1_validation_pass)` &&) = default` | We allow move semantics.
`public  `[`~ValidationPass`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a7ccc70a49116a16b88b35d39ebca871c)`() = default` | Default destruction.
`public llvm::PreservedAnalyses `[`run`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a05a00cd4a93bb67cdf6a21d47c0b4c1a)`(llvm::Module & module,llvm::ModuleAnalysisManager & mam)` | 
`typedef `[`Instruction`](#classmicrosoft_1_1quantum_1_1_validation_pass_1ad49d39e11b44251627f5230685d97d59) | 
`typedef `[`Value`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a0663458e9134ed44156e7d35d8cc84a9) | 
`typedef `[`ILoggerPtr`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a32551b4f108e128bf65e1adf785fb814) | 
`private `[`ValidationPassConfiguration`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration)` `[`config_`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a94fb1525b72f3eb746310fa202144f50) | 
`private std::unordered_map< std::string, uint64_t > `[`opcodes_`](#classmicrosoft_1_1quantum_1_1_validation_pass_1aeffff6419f75ed4c16f0233a3f944d68) | 
`private std::unordered_map< std::string, uint64_t > `[`external_calls_`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a86b97c563799759f5eadb5cfdc3266b3) | 
`private std::unordered_map< std::string, uint64_t > `[`internal_calls_`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a474fd9f6e01445aaded21daf55c9ed58) | 
`private ILoggerPtr `[`logger_`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a668d78cc21333856610d2c178a6a5eb8) | 
`public static bool `[`isRequired`](#classmicrosoft_1_1quantum_1_1_validation_pass_1ac39981bc98871f0de2c35be92ccd01dc)`()` | Whether or not this pass is required to run.

### Members

#### `public inline  explicit `[`ValidationPass`](#classmicrosoft_1_1quantum_1_1_validation_pass_1aa80f01e06b24a2b6b8f1ad6fd51f61d6)`(`[`ValidationPassConfiguration`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration)` const & cfg,ILoggerPtr const & logger)` {#classmicrosoft_1_1quantum_1_1_validation_pass_1aa80f01e06b24a2b6b8f1ad6fd51f61d6}

#### `public  `[`ValidationPass`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a01d0f69c64c3c646839d4a7239c74418)`(`[`ValidationPass`](#classmicrosoft_1_1quantum_1_1_validation_pass)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_validation_pass_1a01d0f69c64c3c646839d4a7239c74418}

Copy construction is banned.

#### `public  `[`ValidationPass`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a3c3d4859a9792ba42c2709c6b7f4be73)`(`[`ValidationPass`](#classmicrosoft_1_1quantum_1_1_validation_pass)` &&) = default` {#classmicrosoft_1_1quantum_1_1_validation_pass_1a3c3d4859a9792ba42c2709c6b7f4be73}

We allow move semantics.

#### `public  `[`~ValidationPass`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a7ccc70a49116a16b88b35d39ebca871c)`() = default` {#classmicrosoft_1_1quantum_1_1_validation_pass_1a7ccc70a49116a16b88b35d39ebca871c}

Default destruction.

#### `public llvm::PreservedAnalyses `[`run`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a05a00cd4a93bb67cdf6a21d47c0b4c1a)`(llvm::Module & module,llvm::ModuleAnalysisManager & mam)` {#classmicrosoft_1_1quantum_1_1_validation_pass_1a05a00cd4a93bb67cdf6a21d47c0b4c1a}

#### `typedef `[`Instruction`](#classmicrosoft_1_1quantum_1_1_validation_pass_1ad49d39e11b44251627f5230685d97d59) {#classmicrosoft_1_1quantum_1_1_validation_pass_1ad49d39e11b44251627f5230685d97d59}

#### `typedef `[`Value`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a0663458e9134ed44156e7d35d8cc84a9) {#classmicrosoft_1_1quantum_1_1_validation_pass_1a0663458e9134ed44156e7d35d8cc84a9}

#### `typedef `[`ILoggerPtr`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a32551b4f108e128bf65e1adf785fb814) {#classmicrosoft_1_1quantum_1_1_validation_pass_1a32551b4f108e128bf65e1adf785fb814}

#### `private `[`ValidationPassConfiguration`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration)` `[`config_`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a94fb1525b72f3eb746310fa202144f50) {#classmicrosoft_1_1quantum_1_1_validation_pass_1a94fb1525b72f3eb746310fa202144f50}

#### `private std::unordered_map< std::string, uint64_t > `[`opcodes_`](#classmicrosoft_1_1quantum_1_1_validation_pass_1aeffff6419f75ed4c16f0233a3f944d68) {#classmicrosoft_1_1quantum_1_1_validation_pass_1aeffff6419f75ed4c16f0233a3f944d68}

#### `private std::unordered_map< std::string, uint64_t > `[`external_calls_`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a86b97c563799759f5eadb5cfdc3266b3) {#classmicrosoft_1_1quantum_1_1_validation_pass_1a86b97c563799759f5eadb5cfdc3266b3}

#### `private std::unordered_map< std::string, uint64_t > `[`internal_calls_`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a474fd9f6e01445aaded21daf55c9ed58) {#classmicrosoft_1_1quantum_1_1_validation_pass_1a474fd9f6e01445aaded21daf55c9ed58}

#### `private ILoggerPtr `[`logger_`](#classmicrosoft_1_1quantum_1_1_validation_pass_1a668d78cc21333856610d2c178a6a5eb8) {#classmicrosoft_1_1quantum_1_1_validation_pass_1a668d78cc21333856610d2c178a6a5eb8}

#### `public static bool `[`isRequired`](#classmicrosoft_1_1quantum_1_1_validation_pass_1ac39981bc98871f0de2c35be92ccd01dc)`()` {#classmicrosoft_1_1quantum_1_1_validation_pass_1ac39981bc98871f0de2c35be92ccd01dc}

Whether or not this pass is required to run.

## class `microsoft::quantum::ValidationPassConfiguration` {#classmicrosoft_1_1quantum_1_1_validation_pass_configuration}

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public inline void `[`setup`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a8f85c743f4b35bd669eba2ec9d490a3d)`(`[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` & config)` | Setup function that adds the configuration flags to the [ConfigurationManager](#classmicrosoft_1_1quantum_1_1_configuration_manager). See the [ConfigurationManager](#classmicrosoft_1_1quantum_1_1_configuration_manager) documentation for more details on how the setup process is implemented.
`public inline Set const  & `[`allowedOpcodes`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1ac4a34dadaaf63eca2593c9338f772e68)`() const` | 
`public inline Set const  & `[`allowedExternalCallNames`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a0f63cf12ed449222d4ed07264df02d5f)`() const` | 
`public inline bool `[`allowInternalCalls`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a2880d9f0c5631444d84a70540849cd76)`() const` | 
`public inline bool `[`allowlistOpcodes`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a4e623e25413a7c45597637896a58217a)`() const` | 
`public inline bool `[`allowlistExternalCalls`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a7e6b97a0c6d45865a1406214ecae583f)`() const` | 
`public inline String const  & `[`saveReportTo`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a74598cea51158e2bd184111fbd4290d1)`() const` | 
`typedef `[`Set`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1ab6548df53ee8fc0af5acb07b277a26a0) | 
`private Set `[`opcodes_`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a109fd51ccaccdbe9c8bf16584c5ea83d) | 
`private Set `[`external_calls_`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a092cfaa11b7500ae406ee7dabe05c6f6) | 
`private String `[`save_report_to_`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a9b66ebc1c642440ddc32800f6ec60448) | 
`private bool `[`allowlist_opcodes_`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1ad228c7c200db350b0912ef0ffd8ae4a1) | 
`private bool `[`allowlist_external_calls_`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a53d9ac020c6a8f6d2bd9ee615efd0e15) | 
`private bool `[`allow_internal_calls_`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1af2f8625c14229a8c15187241a67856b5) | 
`public inline static `[`ValidationPassConfiguration`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration)` `[`fromProfileName`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a0ec70903c2351e0a12cbc65bbea30aa6)`(String const & name)` | 

### Members

#### `public inline void `[`setup`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a8f85c743f4b35bd669eba2ec9d490a3d)`(`[`ConfigurationManager`](#classmicrosoft_1_1quantum_1_1_configuration_manager)` & config)` {#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a8f85c743f4b35bd669eba2ec9d490a3d}

Setup function that adds the configuration flags to the [ConfigurationManager](#classmicrosoft_1_1quantum_1_1_configuration_manager). See the [ConfigurationManager](#classmicrosoft_1_1quantum_1_1_configuration_manager) documentation for more details on how the setup process is implemented.

#### `public inline Set const  & `[`allowedOpcodes`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1ac4a34dadaaf63eca2593c9338f772e68)`() const` {#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1ac4a34dadaaf63eca2593c9338f772e68}

#### `public inline Set const  & `[`allowedExternalCallNames`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a0f63cf12ed449222d4ed07264df02d5f)`() const` {#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a0f63cf12ed449222d4ed07264df02d5f}

#### `public inline bool `[`allowInternalCalls`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a2880d9f0c5631444d84a70540849cd76)`() const` {#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a2880d9f0c5631444d84a70540849cd76}

#### `public inline bool `[`allowlistOpcodes`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a4e623e25413a7c45597637896a58217a)`() const` {#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a4e623e25413a7c45597637896a58217a}

#### `public inline bool `[`allowlistExternalCalls`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a7e6b97a0c6d45865a1406214ecae583f)`() const` {#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a7e6b97a0c6d45865a1406214ecae583f}

#### `public inline String const  & `[`saveReportTo`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a74598cea51158e2bd184111fbd4290d1)`() const` {#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a74598cea51158e2bd184111fbd4290d1}

#### `typedef `[`Set`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1ab6548df53ee8fc0af5acb07b277a26a0) {#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1ab6548df53ee8fc0af5acb07b277a26a0}

#### `private Set `[`opcodes_`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a109fd51ccaccdbe9c8bf16584c5ea83d) {#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a109fd51ccaccdbe9c8bf16584c5ea83d}

#### `private Set `[`external_calls_`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a092cfaa11b7500ae406ee7dabe05c6f6) {#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a092cfaa11b7500ae406ee7dabe05c6f6}

#### `private String `[`save_report_to_`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a9b66ebc1c642440ddc32800f6ec60448) {#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a9b66ebc1c642440ddc32800f6ec60448}

#### `private bool `[`allowlist_opcodes_`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1ad228c7c200db350b0912ef0ffd8ae4a1) {#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1ad228c7c200db350b0912ef0ffd8ae4a1}

#### `private bool `[`allowlist_external_calls_`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a53d9ac020c6a8f6d2bd9ee615efd0e15) {#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a53d9ac020c6a8f6d2bd9ee615efd0e15}

#### `private bool `[`allow_internal_calls_`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1af2f8625c14229a8c15187241a67856b5) {#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1af2f8625c14229a8c15187241a67856b5}

#### `public inline static `[`ValidationPassConfiguration`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration)` `[`fromProfileName`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a0ec70903c2351e0a12cbc65bbea30aa6)`(String const & name)` {#classmicrosoft_1_1quantum_1_1_validation_pass_configuration_1a0ec70903c2351e0a12cbc65bbea30aa6}

## class `microsoft::quantum::Validator` {#classmicrosoft_1_1quantum_1_1_validator}

[Validator](#classmicrosoft_1_1quantum_1_1_validator) class that defines a set of rules which constitutes the profile definition. Each of the rules can be used to transform a generic QIR and/or validate that the QIR is compliant with said rule.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  explicit `[`Validator`](#classmicrosoft_1_1quantum_1_1_validator_1a63e5eb7b96db08e726bebdb54e5a741d)`(`[`ValidationPassConfiguration`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration)` const & cfg,bool debug,llvm::TargetMachine * target_machine)` | 
`public  `[`Validator`](#classmicrosoft_1_1quantum_1_1_validator_1a7527f46e959c8612d6a275b5e55db33e)`() = delete` | 
`public  `[`Validator`](#classmicrosoft_1_1quantum_1_1_validator_1a6beec7b3a7d977e953be06744b174346)`(`[`Validator`](#classmicrosoft_1_1quantum_1_1_validator)` const &) = delete` | 
`public  `[`Validator`](#classmicrosoft_1_1quantum_1_1_validator_1a238a1c43da2b3e0b19b1823db18f6b47)`(`[`Validator`](#classmicrosoft_1_1quantum_1_1_validator)` &&) = default` | 
`public `[`Validator`](#classmicrosoft_1_1quantum_1_1_validator)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_validator_1a561411cb50cbf6e6b14b9a790e5ebcba)`(`[`Validator`](#classmicrosoft_1_1quantum_1_1_validator)` const &) = delete` | 
`public `[`Validator`](#classmicrosoft_1_1quantum_1_1_validator)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_validator_1abbb11ea9322f5e70bd625ea7f43aa0a5)`(`[`Validator`](#classmicrosoft_1_1quantum_1_1_validator)` &&) = default` | 
`public  `[`~Validator`](#classmicrosoft_1_1quantum_1_1_validator_1ac59173066371fba95b20a811adb94790)`() = default` | 
`public bool `[`validate`](#classmicrosoft_1_1quantum_1_1_validator_1a7aa811713a0b2f012ed7a4af2a7ddc6d)`(llvm::Module & module)` | Validates that a module complies with the specified QIR profile. Returns true if the module is valid and false otherwise.
`protected llvm::PassBuilder & `[`passBuilder`](#classmicrosoft_1_1quantum_1_1_validator_1ad6e91ef85395e8164f394a7b42de6d4b)`()` | Returns a reference to the pass builder.
`protected llvm::LoopAnalysisManager & `[`loopAnalysisManager`](#classmicrosoft_1_1quantum_1_1_validator_1a742f5abec1d3f8614aeb3aed8849eb87)`()` | Returns a reference to the loop analysis manager.
`protected llvm::FunctionAnalysisManager & `[`functionAnalysisManager`](#classmicrosoft_1_1quantum_1_1_validator_1ad8cc077121ae084af8fa1159a1ea8e26)`()` | Returns a reference to the function analysis manager.
`protected llvm::CGSCCAnalysisManager & `[`gsccAnalysisManager`](#classmicrosoft_1_1quantum_1_1_validator_1abe4b242cf8537bf210376d8312f2597c)`()` | Returns a reference to the GSCC analysis manager.
`protected llvm::ModuleAnalysisManager & `[`moduleAnalysisManager`](#classmicrosoft_1_1quantum_1_1_validator_1a60e93d178b54d6cbab85c961e5892e70)`()` | Returns a reference to the module analysis manager.
`typedef `[`ValidatorPtr`](#classmicrosoft_1_1quantum_1_1_validator_1a32dfb51f3d2bc3b2e5d004af2733c6cf) | 
`typedef `[`LogColloectionPtr`](#classmicrosoft_1_1quantum_1_1_validator_1ae8e30d9652a8ca05223fde0e3e05c015) | 
`private llvm::LoopAnalysisManager `[`loop_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_validator_1aac5625d250a18c5aa3a2baf2e714a832) | 
`private llvm::FunctionAnalysisManager `[`function_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_validator_1a0e3453adc4e78f7a26614197ecb86599) | 
`private llvm::CGSCCAnalysisManager `[`gscc_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_validator_1a0e0044e5032e2a0d217212ed46ffce0a) | 
`private llvm::ModuleAnalysisManager `[`module_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_validator_1acc1ab3578b06f2980b9af091ef6d6f01) | 
`private PassBuilderPtr `[`pass_builder_`](#classmicrosoft_1_1quantum_1_1_validator_1a988f08b850c1b621ee80895757f424d6) | 
`private llvm::ModulePassManager `[`module_pass_manager_`](#classmicrosoft_1_1quantum_1_1_validator_1a49c7b1b6514e965fc4cf6b3abdb34105) | 
`private LogColloectionPtr `[`logger_`](#classmicrosoft_1_1quantum_1_1_validator_1a5a1c8787b20c5aecfb5fc10b5f3e23c4) | Logger to keep track of errors and warnings occurring.
`private String `[`save_to_filename_`](#classmicrosoft_1_1quantum_1_1_validator_1ad85a4d0b974fadbebd1d9f585a02dcfa) | 
`private void `[`saveReportToFileIfNeeded`](#classmicrosoft_1_1quantum_1_1_validator_1a3216e0a17f4ceef9f1bc79ada8a13b2c)`()` | 

### Members

#### `public  explicit `[`Validator`](#classmicrosoft_1_1quantum_1_1_validator_1a63e5eb7b96db08e726bebdb54e5a741d)`(`[`ValidationPassConfiguration`](#classmicrosoft_1_1quantum_1_1_validation_pass_configuration)` const & cfg,bool debug,llvm::TargetMachine * target_machine)` {#classmicrosoft_1_1quantum_1_1_validator_1a63e5eb7b96db08e726bebdb54e5a741d}

#### `public  `[`Validator`](#classmicrosoft_1_1quantum_1_1_validator_1a7527f46e959c8612d6a275b5e55db33e)`() = delete` {#classmicrosoft_1_1quantum_1_1_validator_1a7527f46e959c8612d6a275b5e55db33e}

#### `public  `[`Validator`](#classmicrosoft_1_1quantum_1_1_validator_1a6beec7b3a7d977e953be06744b174346)`(`[`Validator`](#classmicrosoft_1_1quantum_1_1_validator)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_validator_1a6beec7b3a7d977e953be06744b174346}

#### `public  `[`Validator`](#classmicrosoft_1_1quantum_1_1_validator_1a238a1c43da2b3e0b19b1823db18f6b47)`(`[`Validator`](#classmicrosoft_1_1quantum_1_1_validator)` &&) = default` {#classmicrosoft_1_1quantum_1_1_validator_1a238a1c43da2b3e0b19b1823db18f6b47}

#### `public `[`Validator`](#classmicrosoft_1_1quantum_1_1_validator)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_validator_1a561411cb50cbf6e6b14b9a790e5ebcba)`(`[`Validator`](#classmicrosoft_1_1quantum_1_1_validator)` const &) = delete` {#classmicrosoft_1_1quantum_1_1_validator_1a561411cb50cbf6e6b14b9a790e5ebcba}

#### `public `[`Validator`](#classmicrosoft_1_1quantum_1_1_validator)` & `[`operator=`](#classmicrosoft_1_1quantum_1_1_validator_1abbb11ea9322f5e70bd625ea7f43aa0a5)`(`[`Validator`](#classmicrosoft_1_1quantum_1_1_validator)` &&) = default` {#classmicrosoft_1_1quantum_1_1_validator_1abbb11ea9322f5e70bd625ea7f43aa0a5}

#### `public  `[`~Validator`](#classmicrosoft_1_1quantum_1_1_validator_1ac59173066371fba95b20a811adb94790)`() = default` {#classmicrosoft_1_1quantum_1_1_validator_1ac59173066371fba95b20a811adb94790}

#### `public bool `[`validate`](#classmicrosoft_1_1quantum_1_1_validator_1a7aa811713a0b2f012ed7a4af2a7ddc6d)`(llvm::Module & module)` {#classmicrosoft_1_1quantum_1_1_validator_1a7aa811713a0b2f012ed7a4af2a7ddc6d}

Validates that a module complies with the specified QIR profile. Returns true if the module is valid and false otherwise.

#### `protected llvm::PassBuilder & `[`passBuilder`](#classmicrosoft_1_1quantum_1_1_validator_1ad6e91ef85395e8164f394a7b42de6d4b)`()` {#classmicrosoft_1_1quantum_1_1_validator_1ad6e91ef85395e8164f394a7b42de6d4b}

Returns a reference to the pass builder.

#### `protected llvm::LoopAnalysisManager & `[`loopAnalysisManager`](#classmicrosoft_1_1quantum_1_1_validator_1a742f5abec1d3f8614aeb3aed8849eb87)`()` {#classmicrosoft_1_1quantum_1_1_validator_1a742f5abec1d3f8614aeb3aed8849eb87}

Returns a reference to the loop analysis manager.

#### `protected llvm::FunctionAnalysisManager & `[`functionAnalysisManager`](#classmicrosoft_1_1quantum_1_1_validator_1ad8cc077121ae084af8fa1159a1ea8e26)`()` {#classmicrosoft_1_1quantum_1_1_validator_1ad8cc077121ae084af8fa1159a1ea8e26}

Returns a reference to the function analysis manager.

#### `protected llvm::CGSCCAnalysisManager & `[`gsccAnalysisManager`](#classmicrosoft_1_1quantum_1_1_validator_1abe4b242cf8537bf210376d8312f2597c)`()` {#classmicrosoft_1_1quantum_1_1_validator_1abe4b242cf8537bf210376d8312f2597c}

Returns a reference to the GSCC analysis manager.

#### `protected llvm::ModuleAnalysisManager & `[`moduleAnalysisManager`](#classmicrosoft_1_1quantum_1_1_validator_1a60e93d178b54d6cbab85c961e5892e70)`()` {#classmicrosoft_1_1quantum_1_1_validator_1a60e93d178b54d6cbab85c961e5892e70}

Returns a reference to the module analysis manager.

#### `typedef `[`ValidatorPtr`](#classmicrosoft_1_1quantum_1_1_validator_1a32dfb51f3d2bc3b2e5d004af2733c6cf) {#classmicrosoft_1_1quantum_1_1_validator_1a32dfb51f3d2bc3b2e5d004af2733c6cf}

#### `typedef `[`LogColloectionPtr`](#classmicrosoft_1_1quantum_1_1_validator_1ae8e30d9652a8ca05223fde0e3e05c015) {#classmicrosoft_1_1quantum_1_1_validator_1ae8e30d9652a8ca05223fde0e3e05c015}

#### `private llvm::LoopAnalysisManager `[`loop_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_validator_1aac5625d250a18c5aa3a2baf2e714a832) {#classmicrosoft_1_1quantum_1_1_validator_1aac5625d250a18c5aa3a2baf2e714a832}

#### `private llvm::FunctionAnalysisManager `[`function_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_validator_1a0e3453adc4e78f7a26614197ecb86599) {#classmicrosoft_1_1quantum_1_1_validator_1a0e3453adc4e78f7a26614197ecb86599}

#### `private llvm::CGSCCAnalysisManager `[`gscc_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_validator_1a0e0044e5032e2a0d217212ed46ffce0a) {#classmicrosoft_1_1quantum_1_1_validator_1a0e0044e5032e2a0d217212ed46ffce0a}

#### `private llvm::ModuleAnalysisManager `[`module_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_validator_1acc1ab3578b06f2980b9af091ef6d6f01) {#classmicrosoft_1_1quantum_1_1_validator_1acc1ab3578b06f2980b9af091ef6d6f01}

#### `private PassBuilderPtr `[`pass_builder_`](#classmicrosoft_1_1quantum_1_1_validator_1a988f08b850c1b621ee80895757f424d6) {#classmicrosoft_1_1quantum_1_1_validator_1a988f08b850c1b621ee80895757f424d6}

#### `private llvm::ModulePassManager `[`module_pass_manager_`](#classmicrosoft_1_1quantum_1_1_validator_1a49c7b1b6514e965fc4cf6b3abdb34105) {#classmicrosoft_1_1quantum_1_1_validator_1a49c7b1b6514e965fc4cf6b3abdb34105}

#### `private LogColloectionPtr `[`logger_`](#classmicrosoft_1_1quantum_1_1_validator_1a5a1c8787b20c5aecfb5fc10b5f3e23c4) {#classmicrosoft_1_1quantum_1_1_validator_1a5a1c8787b20c5aecfb5fc10b5f3e23c4}

Logger to keep track of errors and warnings occurring.

#### `private String `[`save_to_filename_`](#classmicrosoft_1_1quantum_1_1_validator_1ad85a4d0b974fadbebd1d9f585a02dcfa) {#classmicrosoft_1_1quantum_1_1_validator_1ad85a4d0b974fadbebd1d9f585a02dcfa}

#### `private void `[`saveReportToFileIfNeeded`](#classmicrosoft_1_1quantum_1_1_validator_1a3216e0a17f4ceef9f1bc79ada8a13b2c)`()` {#classmicrosoft_1_1quantum_1_1_validator_1a3216e0a17f4ceef9f1bc79ada8a13b2c}

# namespace `microsoft::quantum::notation` {#namespacemicrosoft_1_1quantum_1_1notation}

Shorthand notations to make it easy and readible to create patterns.

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public IOperandPrototypePtr `[`basicBlock`](#group__shorthand_notation_1ga1df4795986302aa16342db829b457071)`()`            | Matches a load instruction with one argument.
`public IOperandPrototypePtr `[`bitCast`](#group__shorthand_notation_1gad649d125a7dfa6d4fd594400b1638683)`(IOperandPrototypePtr const & arg)`            | Matches the llvm::BitCast instructruction.
`public IOperandPrototypePtr `[`branch`](#group__shorthand_notation_1gad06c9d1eace6451c6cb6a80150b87576)`(IOperandPrototypePtr const & cond,IOperandPrototypePtr const & arg1,IOperandPrototypePtr const & arg2)`            | Matches a branch instruction given a condition and two arguments.
`public template<>`  <br/>`IOperandPrototypePtr `[`call`](#group__shorthand_notation_1gabb463c16465034b9d9b85290edd9a4bc)`(std::string const & name,Args... args)`            | Shorthand notations are made to make it possible to match patterns in the QIR. This part of the library focuses on making it easy to express advance patterns in just a few lines and specify what parts of the IR is of interest to the replacer function. An example is following pattern
`public IOperandPrototypePtr `[`callByNameOnly`](#group__shorthand_notation_1ga766351375d479dbb164ee827ee330219)`(std::string const & name)`            | Shorthand notation to match an instruction with a specified name. Unlike call, this pattern matches by name only and ignore the arguments.
`public `[`Capture`](#classmicrosoft_1_1quantum_1_1notation_1_1_capture)` `[`operator""_cap`](#group__shorthand_notation_1ga566037f3a56a77f63868af1ed5743731)`(char const * name,std::size_t)`            | Literal for specifying the capture of a llvm::Value*. This literal calls the IOperandPrototype::enableCapture through the assignment of a IOperandPrototypePtr to the class [Capture](#classmicrosoft_1_1quantum_1_1notation_1_1_capture).
`public IOperandPrototypePtr `[`constInt`](#group__shorthand_notation_1gaea3374cd06fe2f3b4d9bff4ad23a4af4)`()`            | Matches the llvm::ConstantInt instructruction.
`public IOperandPrototypePtr `[`intToPtr`](#group__shorthand_notation_1gacdb76f23b9282dead50b4b5bf6c6ab64)`(IOperandPrototypePtr const & arg)`            | Matches the llvm::IntToPtr instructruction.
`public IOperandPrototypePtr `[`load`](#group__shorthand_notation_1ga44ddd41276fac20964ede0e3b3a2c864)`(IOperandPrototypePtr const & arg)`            | Matches a load instruction with one argument.
`public ReplacerFunction `[`deleteInstruction`](#group__shorthand_notation_1gae89b441f450b5df53717bbf6f5c134c4)`()`            | Shorthand notation to delete an instruction. If passed as the replacement function, this function generates a replacer that deletes the instruction. This is a shorthand notation for deleting an instruction that can be used with a custom rule when building a ruleset. This function can be used with shorthand notation for patterns as follows: 
`public IOperandPrototypePtr `[`unnamedInvoke`](#group__shorthand_notation_1gad1881ef24c25dfceb3ad71f18aa2c43f)`()`            | Matches a invoke instruction.
`public template<>`  <br/>`IOperandPrototypePtr `[`phi`](#group__shorthand_notation_1gad70623d62fe54e6077fd102a33a93e5b)`(Args... args)`            | Matches a phi node with N arguments.
`public IOperandPrototypePtr `[`switchOp`](#group__shorthand_notation_1gaa8a0123f4724cb44f2484e7d8e38d086)`(IOperandPrototypePtr const & cond,IOperandPrototypePtr const & arg1,IOperandPrototypePtr const & arg2)`            | 
`public IOperandPrototypePtr `[`select`](#group__shorthand_notation_1ga2b184fe960d85fd09167f16c833907b3)`(IOperandPrototypePtr const & cond,IOperandPrototypePtr const & arg1,IOperandPrototypePtr const & arg2)`            | Matches a select instruction given a condition and two arguments.
`public IOperandPrototypePtr `[`store`](#group__shorthand_notation_1ga2fb129cfb7135e02513ac0eea14b94bc)`(IOperandPrototypePtr const & target,IOperandPrototypePtr const & value)`            | Matches a store instruction with a target and a value. 
`class `[`microsoft::quantum::notation::Capture`](#classmicrosoft_1_1quantum_1_1notation_1_1_capture) | Helper class to enable literals for IR patterns. The main purpose of this class is to enable notation that allows one write `"name"_cap = operandGenerator()` where the operand generator is a function which creates a IOperandPrototypePtr. This notation means that whenever a operand is matched, the matched value is stored under "name".

## Members

#### `public IOperandPrototypePtr `[`basicBlock`](#group__shorthand_notation_1ga1df4795986302aa16342db829b457071)`()` {#group__shorthand_notation_1ga1df4795986302aa16342db829b457071}

Matches a load instruction with one argument.

#### `public IOperandPrototypePtr `[`bitCast`](#group__shorthand_notation_1gad649d125a7dfa6d4fd594400b1638683)`(IOperandPrototypePtr const & arg)` {#group__shorthand_notation_1gad649d125a7dfa6d4fd594400b1638683}

Matches the llvm::BitCast instructruction.

#### `public IOperandPrototypePtr `[`branch`](#group__shorthand_notation_1gad06c9d1eace6451c6cb6a80150b87576)`(IOperandPrototypePtr const & cond,IOperandPrototypePtr const & arg1,IOperandPrototypePtr const & arg2)` {#group__shorthand_notation_1gad06c9d1eace6451c6cb6a80150b87576}

Matches a branch instruction given a condition and two arguments.

#### `public template<>`  <br/>`IOperandPrototypePtr `[`call`](#group__shorthand_notation_1gabb463c16465034b9d9b85290edd9a4bc)`(std::string const & name,Args... args)` {#group__shorthand_notation_1gabb463c16465034b9d9b85290edd9a4bc}

Shorthand notations are made to make it possible to match patterns in the QIR. This part of the library focuses on making it easy to express advance patterns in just a few lines and specify what parts of the IR is of interest to the replacer function. An example is following pattern

```cpp
auto get_one = call("__quantum__rt__result_get_one");
addRule(
    {branch("cond"_cap = call("__quantum__rt__result_equal", "result"_cap = _, "one"_cap =
    get_one), _, _),
     replace_branch_positive});
```

which matches IRs of the form

```cpp
%1 = call %Result* @__quantum__rt__result_get_one()
%2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)
br i1 %2, label %then0__1, label %continue__1
```

The pattern futher specifies that as a successful match is obtained, a table capturing certain values must be created. In the above example, the table would contain three entries: `cond`, `result` and `one` each of which would point to a a llvm::Value* in the QIR. This allows the replacement function to easily manipulate the DAG in these three places (four if you include the main captured value which is always passed to the replacement function). Shorthand notation to match an instruction for a function call. The resulting [IOperandPrototype](#classmicrosoft_1_1quantum_1_1_i_operand_prototype) matches a function call with arguments as specified by the arguments given. For instance,

```cpp
addRule({call("foo", _, _), deleteInstruction()});
```

matches a call to the function `foo` with exactly two arguments.

Shorthand notation to match an instruction for a function call. The resulting [IOperandPrototype](#classmicrosoft_1_1quantum_1_1_i_operand_prototype) matches a function call with arguments as specified by the arguments given. For instance,

```cpp
addRule({call("foo", _, _), deleteInstruction()});
```

matches a call to the function `foo` with exactly two arguments.

#### `public IOperandPrototypePtr `[`callByNameOnly`](#group__shorthand_notation_1ga766351375d479dbb164ee827ee330219)`(std::string const & name)` {#group__shorthand_notation_1ga766351375d479dbb164ee827ee330219}

Shorthand notation to match an instruction with a specified name. Unlike call, this pattern matches by name only and ignore the arguments.

```cpp
addRule({callByNameOnly("foo"), deleteInstruction()});
```

matches calls to the function `foo` regardless of the number of arguments.

#### `public `[`Capture`](#classmicrosoft_1_1quantum_1_1notation_1_1_capture)` `[`operator""_cap`](#group__shorthand_notation_1ga566037f3a56a77f63868af1ed5743731)`(char const * name,std::size_t)` {#group__shorthand_notation_1ga566037f3a56a77f63868af1ed5743731}

Literal for specifying the capture of a llvm::Value*. This literal calls the IOperandPrototype::enableCapture through the assignment of a IOperandPrototypePtr to the class [Capture](#classmicrosoft_1_1quantum_1_1notation_1_1_capture).

As an example, one may want to match the pattern `foo(bar(baz(x)), y)` and extract the variable `x` to add meta data to it. The corresponding IR could look like: 
```cpp
%1 = call %Type* @baz(%Type* %0)
%2 = call %Type* @bar(%Type* %1)
call void @foo(%Type* %2, %Type* %3)
```
 To match this pattern, one would create the pattern `call("foo", call("bar", call("baz", "x"_cap = _)), _)`. This pattern would ensure that at the time where the replacer function is called, the value stored in `%0` is captured under the name `x`.

#### `public IOperandPrototypePtr `[`constInt`](#group__shorthand_notation_1gaea3374cd06fe2f3b4d9bff4ad23a4af4)`()` {#group__shorthand_notation_1gaea3374cd06fe2f3b4d9bff4ad23a4af4}

Matches the llvm::ConstantInt instructruction.

#### `public IOperandPrototypePtr `[`intToPtr`](#group__shorthand_notation_1gacdb76f23b9282dead50b4b5bf6c6ab64)`(IOperandPrototypePtr const & arg)` {#group__shorthand_notation_1gacdb76f23b9282dead50b4b5bf6c6ab64}

Matches the llvm::IntToPtr instructruction.

#### `public IOperandPrototypePtr `[`load`](#group__shorthand_notation_1ga44ddd41276fac20964ede0e3b3a2c864)`(IOperandPrototypePtr const & arg)` {#group__shorthand_notation_1ga44ddd41276fac20964ede0e3b3a2c864}

Matches a load instruction with one argument.

#### `public ReplacerFunction `[`deleteInstruction`](#group__shorthand_notation_1gae89b441f450b5df53717bbf6f5c134c4)`()` {#group__shorthand_notation_1gae89b441f450b5df53717bbf6f5c134c4}

Shorthand notation to delete an instruction. If passed as the replacement function, this function generates a replacer that deletes the instruction. This is a shorthand notation for deleting an instruction that can be used with a custom rule when building a ruleset. This function can be used with shorthand notation for patterns as follows: 
```cpp
addRule({callByNameOnly(name), deleteInstruction()});
```
 to delete the instructions that calls functions with the name `name`.

#### `public IOperandPrototypePtr `[`unnamedInvoke`](#group__shorthand_notation_1gad1881ef24c25dfceb3ad71f18aa2c43f)`()` {#group__shorthand_notation_1gad1881ef24c25dfceb3ad71f18aa2c43f}

Matches a invoke instruction.

#### `public template<>`  <br/>`IOperandPrototypePtr `[`phi`](#group__shorthand_notation_1gad70623d62fe54e6077fd102a33a93e5b)`(Args... args)` {#group__shorthand_notation_1gad70623d62fe54e6077fd102a33a93e5b}

Matches a phi node with N arguments.

#### `public IOperandPrototypePtr `[`switchOp`](#group__shorthand_notation_1gaa8a0123f4724cb44f2484e7d8e38d086)`(IOperandPrototypePtr const & cond,IOperandPrototypePtr const & arg1,IOperandPrototypePtr const & arg2)` {#group__shorthand_notation_1gaa8a0123f4724cb44f2484e7d8e38d086}

#### `public IOperandPrototypePtr `[`select`](#group__shorthand_notation_1ga2b184fe960d85fd09167f16c833907b3)`(IOperandPrototypePtr const & cond,IOperandPrototypePtr const & arg1,IOperandPrototypePtr const & arg2)` {#group__shorthand_notation_1ga2b184fe960d85fd09167f16c833907b3}

Matches a select instruction given a condition and two arguments.

#### `public IOperandPrototypePtr `[`store`](#group__shorthand_notation_1ga2fb129cfb7135e02513ac0eea14b94bc)`(IOperandPrototypePtr const & target,IOperandPrototypePtr const & value)` {#group__shorthand_notation_1ga2fb129cfb7135e02513ac0eea14b94bc}

Matches a store instruction with a target and a value. 
```cpp
addRule({store("target"_cap = _, "value"_cap = _), replaceConstExpr});
```
 where we want to match all store instructions and do not really care about how the target or value came about. In this case, we may want to capture the values to, for instance, make assignment at compile time.

## class `microsoft::quantum::notation::Capture` {#classmicrosoft_1_1quantum_1_1notation_1_1_capture}

Helper class to enable literals for IR patterns. The main purpose of this class is to enable notation that allows one write `"name"_cap = operandGenerator()` where the operand generator is a function which creates a IOperandPrototypePtr. This notation means that whenever a operand is matched, the matched value is stored under "name".

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  explicit `[`Capture`](#group__shorthand_notation_1ga75cc713660bd3bfdae9ed36001c31591)`(std::string const & name)` | Explicit creation using string name constructor.
`public IOperandPrototypePtr `[`operator=`](#group__shorthand_notation_1ga067f53b718d424ca59ec3b70a6b5c9b1)`(IOperandPrototypePtr const & other)` | 
`private std::string `[`name_`](#group__shorthand_notation_1ga438cd693264597e73300e12811e46810) | Name that is assigned to the [IOperandPrototype](#classmicrosoft_1_1quantum_1_1_i_operand_prototype).

### Members

#### `public  explicit `[`Capture`](#group__shorthand_notation_1ga75cc713660bd3bfdae9ed36001c31591)`(std::string const & name)` {#group__shorthand_notation_1ga75cc713660bd3bfdae9ed36001c31591}

Explicit creation using string name constructor.

#### `public IOperandPrototypePtr `[`operator=`](#group__shorthand_notation_1ga067f53b718d424ca59ec3b70a6b5c9b1)`(IOperandPrototypePtr const & other)` {#group__shorthand_notation_1ga067f53b718d424ca59ec3b70a6b5c9b1}

#### `private std::string `[`name_`](#group__shorthand_notation_1ga438cd693264597e73300e12811e46810) {#group__shorthand_notation_1ga438cd693264597e73300e12811e46810}

Name that is assigned to the [IOperandPrototype](#classmicrosoft_1_1quantum_1_1_i_operand_prototype).

## class `microsoft::quantum::ModuleLoader::SingleModuleTransformation` {#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation}

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public inline  explicit `[`SingleModuleTransformation`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a423adbc88e7fdc5422376d8a41670a64)`(OptimizationLevel const & optimisation_level,bool debug)` | 
`public inline bool `[`apply`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a1b51a04ac60a5994c4bf6ee50afca192)`(llvm::Module * module)` | 
`public inline bool `[`isDebugMode`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a52cebd2d1678855a2428d305cb3d4bed)`() const` | 
`typedef `[`PassBuilder`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1ad30042cf934882eb233c22ccf78ca77f) | 
`typedef `[`OptimizationLevel`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a0159e93092221942a7f96c1964d6fbc7) | 
`typedef `[`FunctionAnalysisManager`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a6e490edbf50c7b52074e07c9b377cb35) | 
`private llvm::PassBuilder `[`pass_builder_`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1ae226e25d786482440021b3c5d7debb11) | 
`private llvm::LoopAnalysisManager `[`loop_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1aebeabfc4bf2302b881d2b94abee9f41e) | 
`private llvm::FunctionAnalysisManager `[`function_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a5f3b38df56137f5f74418f0405fef67b) | 
`private llvm::CGSCCAnalysisManager `[`gscc_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1aae240f91dce81b35fe48fdae2829c9d4) | 
`private llvm::ModuleAnalysisManager `[`module_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a48838bece9458c2cd0a284490f9e7e98) | 
`private llvm::ModulePassManager `[`module_pass_manager_`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1ac36e484881dfaa7329513930c8213bc9) | 
`private OptimizationLevel `[`optimisation_level_`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1af2e4110a74829034827f02bf255e8911) | 
`private bool `[`debug_`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1abd72939faa0b735e8418de359f25c393) | 

### Members

#### `public inline  explicit `[`SingleModuleTransformation`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a423adbc88e7fdc5422376d8a41670a64)`(OptimizationLevel const & optimisation_level,bool debug)` {#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a423adbc88e7fdc5422376d8a41670a64}

#### `public inline bool `[`apply`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a1b51a04ac60a5994c4bf6ee50afca192)`(llvm::Module * module)` {#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a1b51a04ac60a5994c4bf6ee50afca192}

#### `public inline bool `[`isDebugMode`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a52cebd2d1678855a2428d305cb3d4bed)`() const` {#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a52cebd2d1678855a2428d305cb3d4bed}

#### `typedef `[`PassBuilder`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1ad30042cf934882eb233c22ccf78ca77f) {#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1ad30042cf934882eb233c22ccf78ca77f}

#### `typedef `[`OptimizationLevel`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a0159e93092221942a7f96c1964d6fbc7) {#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a0159e93092221942a7f96c1964d6fbc7}

#### `typedef `[`FunctionAnalysisManager`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a6e490edbf50c7b52074e07c9b377cb35) {#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a6e490edbf50c7b52074e07c9b377cb35}

#### `private llvm::PassBuilder `[`pass_builder_`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1ae226e25d786482440021b3c5d7debb11) {#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1ae226e25d786482440021b3c5d7debb11}

#### `private llvm::LoopAnalysisManager `[`loop_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1aebeabfc4bf2302b881d2b94abee9f41e) {#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1aebeabfc4bf2302b881d2b94abee9f41e}

#### `private llvm::FunctionAnalysisManager `[`function_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a5f3b38df56137f5f74418f0405fef67b) {#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a5f3b38df56137f5f74418f0405fef67b}

#### `private llvm::CGSCCAnalysisManager `[`gscc_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1aae240f91dce81b35fe48fdae2829c9d4) {#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1aae240f91dce81b35fe48fdae2829c9d4}

#### `private llvm::ModuleAnalysisManager `[`module_analysis_manager_`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a48838bece9458c2cd0a284490f9e7e98) {#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1a48838bece9458c2cd0a284490f9e7e98}

#### `private llvm::ModulePassManager `[`module_pass_manager_`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1ac36e484881dfaa7329513930c8213bc9) {#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1ac36e484881dfaa7329513930c8213bc9}

#### `private OptimizationLevel `[`optimisation_level_`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1af2e4110a74829034827f02bf255e8911) {#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1af2e4110a74829034827f02bf255e8911}

#### `private bool `[`debug_`](#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1abd72939faa0b735e8418de359f25c393) {#classmicrosoft_1_1quantum_1_1_module_loader_1_1_single_module_transformation_1abd72939faa0b735e8418de359f25c393}

## struct `microsoft::quantum::BasicAllocationManager::AllocatedMemoryBlock` {#structmicrosoft_1_1quantum_1_1_basic_allocation_manager_1_1_allocated_memory_block}

Defines a named register/memory address segment with start position, end position and count. We think of the address space as a continuous sequence of spaces that can store values and we refer to a bounded continuous sequence memory addresses as a segment (or memory address segment):          start                   end
           │                      │
           ▼                      ▼
        ┌  ─  ─  ─  ─  ─  ─  ─
 ┌ ─ ─ ┬ ─ ─ ┬─────┬─────┐ ┌─────┼ ─ ─ ┬ ─ ─ ┐ 0 1 │ 2 │ 3 │... │ N+1 │ N+2 N+3 └ ─ ─ ┴ ─ ─ ┴─────┴─────┘ └─────┴ ─ ─ ┴ ─ ─ ┘ Address │ space │ Memory address segment of N elements │ └ ─ ─ ─ ─ ─ ─ ─

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public String `[`name`](#structmicrosoft_1_1quantum_1_1_basic_allocation_manager_1_1_allocated_memory_block_1a5efa65d2923020ff8bc5982ade5ddb34) | Name of the segment, if any given.
`public `[`Index`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a8b959912df70a013f90086320202f833)` `[`count`](#structmicrosoft_1_1quantum_1_1_basic_allocation_manager_1_1_allocated_memory_block_1ab7d942f1ce6cb09cd350ff57128715f3) | Number of elements contained within memory address segment.
`public `[`Address`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1abf24411fc914344277ef965d27112b18)` `[`start`](#structmicrosoft_1_1quantum_1_1_basic_allocation_manager_1_1_allocated_memory_block_1af9df8901f253993fa54e39083e809ab0) | Start address of memory address segment.
`public `[`Address`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1abf24411fc914344277ef965d27112b18)` `[`end`](#structmicrosoft_1_1quantum_1_1_basic_allocation_manager_1_1_allocated_memory_block_1a5393d491ea56a3dc30f7b0a486c10b9b) | End address (not included in memory address segment)

### Members

#### `public String `[`name`](#structmicrosoft_1_1quantum_1_1_basic_allocation_manager_1_1_allocated_memory_block_1a5efa65d2923020ff8bc5982ade5ddb34) {#structmicrosoft_1_1quantum_1_1_basic_allocation_manager_1_1_allocated_memory_block_1a5efa65d2923020ff8bc5982ade5ddb34}

Name of the segment, if any given.

#### `public `[`Index`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1a8b959912df70a013f90086320202f833)` `[`count`](#structmicrosoft_1_1quantum_1_1_basic_allocation_manager_1_1_allocated_memory_block_1ab7d942f1ce6cb09cd350ff57128715f3) {#structmicrosoft_1_1quantum_1_1_basic_allocation_manager_1_1_allocated_memory_block_1ab7d942f1ce6cb09cd350ff57128715f3}

Number of elements contained within memory address segment.

#### `public `[`Address`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1abf24411fc914344277ef965d27112b18)` `[`start`](#structmicrosoft_1_1quantum_1_1_basic_allocation_manager_1_1_allocated_memory_block_1af9df8901f253993fa54e39083e809ab0) {#structmicrosoft_1_1quantum_1_1_basic_allocation_manager_1_1_allocated_memory_block_1af9df8901f253993fa54e39083e809ab0}

Start address of memory address segment.

#### `public `[`Address`](#classmicrosoft_1_1quantum_1_1_i_allocation_manager_1abf24411fc914344277ef965d27112b18)` `[`end`](#structmicrosoft_1_1quantum_1_1_basic_allocation_manager_1_1_allocated_memory_block_1a5393d491ea56a3dc30f7b0a486c10b9b) {#structmicrosoft_1_1quantum_1_1_basic_allocation_manager_1_1_allocated_memory_block_1a5393d491ea56a3dc30f7b0a486c10b9b}

End address (not included in memory address segment)

## struct `microsoft::quantum::LogCollection::Location` {#structmicrosoft_1_1quantum_1_1_log_collection_1_1_location}

Class that holds the location of where the incident happened.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public String `[`name`](#structmicrosoft_1_1quantum_1_1_log_collection_1_1_location_1aba7147a3055edec4cb60df7f2daadf77) | 
`public uint64_t `[`row`](#structmicrosoft_1_1quantum_1_1_log_collection_1_1_location_1a952633a590a9a7f1243ea06ab36ffed8) | 
`public uint64_t `[`col`](#structmicrosoft_1_1quantum_1_1_log_collection_1_1_location_1abbecbf6fce6745668d68a5b86956a53f) | 

### Members

#### `public String `[`name`](#structmicrosoft_1_1quantum_1_1_log_collection_1_1_location_1aba7147a3055edec4cb60df7f2daadf77) {#structmicrosoft_1_1quantum_1_1_log_collection_1_1_location_1aba7147a3055edec4cb60df7f2daadf77}

#### `public uint64_t `[`row`](#structmicrosoft_1_1quantum_1_1_log_collection_1_1_location_1a952633a590a9a7f1243ea06ab36ffed8) {#structmicrosoft_1_1quantum_1_1_log_collection_1_1_location_1a952633a590a9a7f1243ea06ab36ffed8}

#### `public uint64_t `[`col`](#structmicrosoft_1_1quantum_1_1_log_collection_1_1_location_1abbecbf6fce6745668d68a5b86956a53f) {#structmicrosoft_1_1quantum_1_1_log_collection_1_1_location_1abbecbf6fce6745668d68a5b86956a53f}

## struct `microsoft::quantum::LogCollection::Message` {#structmicrosoft_1_1quantum_1_1_log_collection_1_1_message}

Struct to hold a message together with its type and location.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public `[`Type`](#classmicrosoft_1_1quantum_1_1_log_collection_1a8b5d562fd58a95348898743509c8678f)` `[`type`](#structmicrosoft_1_1quantum_1_1_log_collection_1_1_message_1a668661e9658d3c4495b31b2d3c39982e) | 
`public `[`Location`](#structmicrosoft_1_1quantum_1_1_log_collection_1_1_location)` `[`location`](#structmicrosoft_1_1quantum_1_1_log_collection_1_1_message_1aed5aa9af706966901c70c40500ea5125) | 
`public String `[`message`](#structmicrosoft_1_1quantum_1_1_log_collection_1_1_message_1ac7c397bd49f9f9feb8073755b2b1afd9) | 

### Members

#### `public `[`Type`](#classmicrosoft_1_1quantum_1_1_log_collection_1a8b5d562fd58a95348898743509c8678f)` `[`type`](#structmicrosoft_1_1quantum_1_1_log_collection_1_1_message_1a668661e9658d3c4495b31b2d3c39982e) {#structmicrosoft_1_1quantum_1_1_log_collection_1_1_message_1a668661e9658d3c4495b31b2d3c39982e}

#### `public `[`Location`](#structmicrosoft_1_1quantum_1_1_log_collection_1_1_location)` `[`location`](#structmicrosoft_1_1quantum_1_1_log_collection_1_1_message_1aed5aa9af706966901c70c40500ea5125) {#structmicrosoft_1_1quantum_1_1_log_collection_1_1_message_1aed5aa9af706966901c70c40500ea5125}

#### `public String `[`message`](#structmicrosoft_1_1quantum_1_1_log_collection_1_1_message_1ac7c397bd49f9f9feb8073755b2b1afd9) {#structmicrosoft_1_1quantum_1_1_log_collection_1_1_message_1ac7c397bd49f9f9feb8073755b2b1afd9}

## struct `microsoft::quantum::ParameterParser::ParsedValue` {#structmicrosoft_1_1quantum_1_1_parameter_parser_1_1_parsed_value}

Struct that contains parsed and interpreted values of command line arguments.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public bool `[`is_key`](#structmicrosoft_1_1quantum_1_1_parameter_parser_1_1_parsed_value_1aa861b7e0c375dbb6e49eaa427e614eb2) | Whether or not a parsed value should be considered a key.
`public String `[`value`](#structmicrosoft_1_1quantum_1_1_parameter_parser_1_1_parsed_value_1aa385fb0c3a431090a0c02809db161254) | Value after parsing.

### Members

#### `public bool `[`is_key`](#structmicrosoft_1_1quantum_1_1_parameter_parser_1_1_parsed_value_1aa861b7e0c375dbb6e49eaa427e614eb2) {#structmicrosoft_1_1quantum_1_1_parameter_parser_1_1_parsed_value_1aa861b7e0c375dbb6e49eaa427e614eb2}

Whether or not a parsed value should be considered a key.

#### `public String `[`value`](#structmicrosoft_1_1quantum_1_1_parameter_parser_1_1_parsed_value_1aa385fb0c3a431090a0c02809db161254) {#structmicrosoft_1_1quantum_1_1_parameter_parser_1_1_parsed_value_1aa385fb0c3a431090a0c02809db161254}

Value after parsing.

## struct `microsoft::quantum::ConfigurationManager::Section` {#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section}

[Section](#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section) defines a section in the configuration. It holds the type of the configuration class, the name of the section a description, the instance of the configuration class itself and list of parameter bindings.

### Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public `[`TypeId`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1aa6b9c062753af58a8d594990aef93a56)` `[`type`](#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1afec35e68ca96f14439b46e5b798dc8d4) | Type of the configuration.
`public String `[`name`](#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1aa5869e1e1f4c39f53a774ea0a2c4874c) | Name of the section.
`public String `[`description`](#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1afa4fa7ebdac7845f745567ae6ce043b7) | Description of the section.
`public `[`VoidPtr`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a7a7a51a321cb6c140f34431e1f2371a9)` `[`configuration`](#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1a689440e2171f234cfb3e49016ee29ea4) | Configuration class instance.
`public `[`ConfigList`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a26f163aa8940c36278da8b280882583d)` `[`settings`](#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1a6930799c8a556e6b212f1d10817a8d24) | List of parameter bindings.
`public BoolPtr `[`active`](#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1a8d790e3ceb4e78675dfac053bf75164a) | Whether or not this component is active;.
`public String `[`id`](#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1a9cace218e8ade25b3c4aa2317d21e9a9) | Id referring to this component.

### Members

#### `public `[`TypeId`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1aa6b9c062753af58a8d594990aef93a56)` `[`type`](#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1afec35e68ca96f14439b46e5b798dc8d4) {#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1afec35e68ca96f14439b46e5b798dc8d4}

Type of the configuration.

#### `public String `[`name`](#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1aa5869e1e1f4c39f53a774ea0a2c4874c) {#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1aa5869e1e1f4c39f53a774ea0a2c4874c}

Name of the section.

#### `public String `[`description`](#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1afa4fa7ebdac7845f745567ae6ce043b7) {#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1afa4fa7ebdac7845f745567ae6ce043b7}

Description of the section.

#### `public `[`VoidPtr`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a7a7a51a321cb6c140f34431e1f2371a9)` `[`configuration`](#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1a689440e2171f234cfb3e49016ee29ea4) {#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1a689440e2171f234cfb3e49016ee29ea4}

Configuration class instance.

#### `public `[`ConfigList`](#classmicrosoft_1_1quantum_1_1_configuration_manager_1a26f163aa8940c36278da8b280882583d)` `[`settings`](#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1a6930799c8a556e6b212f1d10817a8d24) {#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1a6930799c8a556e6b212f1d10817a8d24}

List of parameter bindings.

#### `public BoolPtr `[`active`](#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1a8d790e3ceb4e78675dfac053bf75164a) {#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1a8d790e3ceb4e78675dfac053bf75164a}

Whether or not this component is active;.

#### `public String `[`id`](#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1a9cace218e8ade25b3c4aa2317d21e9a9) {#structmicrosoft_1_1quantum_1_1_configuration_manager_1_1_section_1a9cace218e8ade25b3c4aa2317d21e9a9}

Id referring to this component.

Generated by [Moxygen](https://sourcey.com/moxygen)
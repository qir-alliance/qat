#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/qat/AdaptorFactory/QirAdaptorFactory.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/TestTools/TestVm.hpp"

#include <unordered_set>
#include <vector>

namespace microsoft::quantum
{

class IrManipulationTestHelper
{
  public:
    using String            = std::string;
    using Strings           = std::vector<String>;
    using LLVMContext       = llvm::LLVMContext;
    using SMDiagnostic      = llvm::SMDiagnostic;
    using Module            = llvm::Module;
    using ContextPtr        = std::unique_ptr<LLVMContext>;
    using ModulePtr         = std::unique_ptr<Module>;
    using OptimizationLevel = llvm::OptimizationLevel;
    using GeneratorPtr      = std::shared_ptr<QirAdaptorFactory>;

    // IrManipulationTestHelper is default constructible with no ability to move
    // or copy.
    //

    IrManipulationTestHelper()                                = default;
    IrManipulationTestHelper(IrManipulationTestHelper const&) = delete;
    IrManipulationTestHelper& operator=(IrManipulationTestHelper const&) = delete;
    IrManipulationTestHelper(IrManipulationTestHelper&&)                 = delete;
    IrManipulationTestHelper& operator=(IrManipulationTestHelper&&) = delete;

    // Output functions
    //

    /// Generates a string for the IR currently held in the module.
    String toString() const;

    /// Generates a list of instructions for the main function in the module.
    Strings toBodyInstructions(String const& block_name = "");

    TestProgram toProgram();

    // Test functions
    //

    /// Tests whether the main body contains a sequence of instructions. This function
    /// ignores instructions in-between the instruction set given. If block name is specified
    /// then only instructions within this block are extracted
    bool hasInstructionSequence(Strings const& instructions, String const& block_name = "");

    /// Applies a adaptor to the module to allow which transforms the IR. This
    /// allow us to write small adaptors to test a single piece of transformation.
    void applyQirAdaptor(
        GeneratorPtr const&      generator,
        OptimizationLevel const& optimization_level = OptimizationLevel::O0,
        bool                     debug              = false);

    /// Validates a adaptor to the module to allow which transforms the IR. This
    /// allow us to write small adaptors to test a single piece of transformation.
    bool validateQirAdaptor(GeneratorPtr const& generator, String const& target_name = "generic", bool debug = false);

    /// Tests whether a given set of errors (LLVM hints) are present in the validation errors
    /// for a specific adaptor. This method only checks if errors are present but does not fail if
    /// there are more errors than requested through the API.
    bool containsValidationErrors(
        GeneratorPtr const& generator,
        String const&       target_name,
        Strings const&      errors,
        bool                debug = false) const;

    /// Tests whether a given set of errors (LLVM hints) are present in the validation errors
    /// for a specific adaptor. In contrast to containsValidationErrors, this function expect an exact
    /// match in the actual and expected errors.
    bool containsExactValidationErrors(
        GeneratorPtr const& generator,
        String const&       target_name,
        Strings const&      errors,
        bool                debug = false) const;

    // Declaration of partial or full IR
    //

    /// Declares a opaque type. Only the name of the type should be supplied to
    /// this function. Example usage
    ///
    /// ```
    /// irmanip.declareOpaque("Qubit");
    /// ```
    void declareOpaque(String const& name);

    /// Declares a function. The full signature should be supplied to
    /// as the first argument. Example usage
    ///
    /// ```
    /// irmanip.declareOpaque("%Result* @__quantum__rt__result_get_zero()");
    /// ```
    void declareFunction(String const& declaration);

    /// Creates an LLVM module given a function body. This function makes use
    /// of the inputs from IrManipulationTestHelper::declareOpaque and
    /// IrManipulationTestHelper::declareFunction to construct the full
    /// IR. Example usage:
    ///
    /// ```
    /// irmanip.fromBodyString(R"script(
    /// %leftMessage = call %Qubit* @__quantum__rt__qubit_allocate()
    /// call void @__quantum__qis__h__body(%Qubit* %leftMessage)
    /// )script");
    /// ```
    ///
    /// Returns false if the IR is invalid.
    bool fromBodyString(String const& body, String const& args = "");

    /// Generates a script given the body of the main function.
    String generateScript(String const& body, String const& args = "") const;

    /// Creates an LLVM module given from a fully specified IR. This function
    /// ignores all inputs from IrManipulationTestHelper::declareOpaque and
    /// IrManipulationTestHelper::declareFunction.
    ///
    /// Returns false if the IR is invalid.
    bool fromString(String const& data);

    /// Gets an error message if the compilation failed.
    String getErrorMessage() const;

    /// Whether or not the module is broken.
    bool isModuleBroken();

    // Acccess member functions
    //

    /// Returns a reference to the module
    ModulePtr& module();

  private:
    // Declarations
    //

    /// Set of opaque type declarations
    std::unordered_set<std::string> opaque_declarations_{};

    /// Set of function declarations
    std::unordered_set<std::string> function_declarations_{};

    // Compilation state
    //

    /// Whether the compilation failed.
    bool compilation_failed_{false};

    /// The LLVM context.
    ContextPtr context_;

    /// Pointer to the module obtained from the compilation process.
    ModulePtr module_;

    /// The LLVM error encountered.
    SMDiagnostic error_;
};

} // namespace microsoft::quantum

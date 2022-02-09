// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Generators/DefaultProfileGenerator.hpp"
#include "Llvm/Llvm.hpp"
#include "Rules/Factory.hpp"
#include "TestTools/IrManipulationTestHelper.hpp"
#include "gtest/gtest.h"

#include <functional>
using namespace microsoft::quantum;

namespace {
using IrManipulationTestHelperPtr = std::shared_ptr<IrManipulationTestHelper>;
IrManipulationTestHelperPtr newIrManip(std::string const &script)
{
  IrManipulationTestHelperPtr ir_manip = std::make_shared<IrManipulationTestHelper>();

  ir_manip->declareOpaque("Qubit");
  ir_manip->declareOpaque("Result");
  ir_manip->declareOpaque("Array");
  ir_manip->declareOpaque("Tuple");
  ir_manip->declareOpaque("Range");
  ir_manip->declareOpaque("Callable");
  ir_manip->declareOpaque("String");

  ir_manip->declareFunction("void @__quantum__qis__h__body(%Qubit*)");
  ir_manip->declareFunction("void @__quantum__qis__x__body(%Qubit*)");
  ir_manip->declareFunction("void @__quantum__qis__s__body(%Qubit*)");
  ir_manip->declareFunction("void @__quantum__qis__cx__body(%Qubit*, %Qubit*)");
  ir_manip->declareFunction("void @__quantum__qis__h__body(%Qubit*)");
  ir_manip->declareFunction("void @__quantum__qis__rz__body(double, %Qubit*)");
  ir_manip->declareFunction("void @__quantum__qis__t__body(%Qubit*)");
  ir_manip->declareFunction("void @__quantum__qis__z__body(%Qubit*)");
  ir_manip->declareFunction("%Array* @__quantum__rt__array_copy(%Array*, i1)");
  ir_manip->declareFunction("%Array* @__quantum__rt__array_create_1d(i32, i64)");
  ir_manip->declareFunction("i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64)");
  ir_manip->declareFunction("void @__quantum__qis__mz__body(%Qubit*, %Result*)");
  ir_manip->declareFunction("void @__quantum__qis__reset__body(%Qubit*)");
  ir_manip->declareFunction("i1 @__quantum__qis__read_result__body(%Result*)");
  ir_manip->declareFunction("void @__quantum__qis__cnot__body(%Qubit*, %Qubit*)");

  if (!ir_manip->fromBodyString(script))
  {
    llvm::outs() << ir_manip->generateScript(script) << "\n\n";
    llvm::outs() << ir_manip->getErrorMessage() << "\n";
    exit(-1);
  }
  return ir_manip;
}

void expectFail(String const &profile_name, String const &script)
{
  auto ir_manip = newIrManip(script);

  auto profile_generator = std::make_shared<DefaultProfileGenerator>();

  ConfigurationManager &configuration_manager = profile_generator->configurationManager();
  configuration_manager.addConfig<FactoryConfiguration>();
  configuration_manager.addConfig<ValidationPassConfiguration>(
      "validation-configuration", ValidationPassConfiguration::fromProfileName(profile_name));

  EXPECT_FALSE(ir_manip->hasValidationErrors(profile_generator, profile_name, {}));
}

}  // namespace

TEST(QSharpNegative, ConstArray)
{
  expectFail("base", R"script(
  %0 = tail call %Array* @__quantum__rt__array_create_1d(i32 8, i64 10)
  %1 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 0)
  %2 = bitcast i8* %1 to i64*
  %3 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 1)
  %4 = bitcast i8* %3 to i64*
  %5 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 2)
  %6 = bitcast i8* %5 to i64*
  %7 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 3)
  %8 = bitcast i8* %7 to i64*
  %9 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 4)
  %10 = bitcast i8* %9 to i64*
  %11 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 5)
  %12 = bitcast i8* %11 to i64*
  %13 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 6)
  %14 = bitcast i8* %13 to i64*
  %15 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 7)
  %16 = bitcast i8* %15 to i64*
  %17 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 8)
  %18 = bitcast i8* %17 to i64*
  %19 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 9)
  %20 = bitcast i8* %19 to i64*
  store i64 1, i64* %2, align 4
  store i64 2, i64* %4, align 4
  store i64 3, i64* %6, align 4
  store i64 4, i64* %8, align 4
  store i64 5, i64* %10, align 4
  store i64 6, i64* %12, align 4
  store i64 7, i64* %14, align 4
  store i64 8, i64* %16, align 4
  store i64 9, i64* %18, align 4
  store i64 10, i64* %20, align 4
  %21 = tail call %Array* @__quantum__rt__array_copy(%Array* %0, i1 false)
  %22 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %21, i64 7)
  %23 = bitcast i8* %22 to i64*
  store i64 1337, i64* %23, align 4
  %24 = tail call %Array* @__quantum__rt__array_copy(%Array* %21, i1 false)
  %25 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %21, i64 7)
  %26 = bitcast i8* %25 to i64*
  %27 = load i64, i64* %26, align 4
  %28 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %24, i64 3)
  %29 = bitcast i8* %28 to i64*
  store i64 %27, i64* %29, align 4
  %30 = tail call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %24, i64 3)
  %31 = bitcast i8* %30 to i64*
  %32 = load i64, i64* %31, align 4
  )script");
}

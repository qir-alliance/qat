// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Generators/ConfigurableProfileGenerator.hpp"
#include "GroupingPass/GroupingPass.hpp"
#include "Rules/Factory.hpp"
#include "TestTools/IrManipulationTestHelper.hpp"
#include "gtest/gtest.h"

#include "Llvm/Llvm.hpp"

#include <functional>
using namespace microsoft::quantum;

namespace
{
using IrManipulationTestHelperPtr = std::shared_ptr<IrManipulationTestHelper>;
IrManipulationTestHelperPtr newIrManip(std::string const& script)
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
    //  ir_manip->declareFunction("void @__quantum__qis__m__body(%Qubit*,%Result*)");

    ir_manip->declareFunction("i64 @TeleportChain__Calculate__body(i64, %Qubit*)");

    if (!ir_manip->fromBodyString(script))
    {
        llvm::outs() << ir_manip->generateScript(script) << "\n\n";
        llvm::outs() << ir_manip->getErrorMessage() << "\n";
        exit(-1);
    }
    return ir_manip;
}

void expectSuccess(String const& profile_name, String const& script)
{
    auto ir_manip = newIrManip(script);

    auto profile_generator = std::make_shared<ConfigurableProfileGenerator>();

    ConfigurationManager& configuration_manager = profile_generator->configurationManager();
    configuration_manager.addConfig<FactoryConfiguration>();

    configuration_manager.setConfig(ValidationPassConfiguration::fromProfileName(profile_name));
    configuration_manager.setConfig(LlvmPassesConfiguration::createUnrollInline());
    configuration_manager.setConfig(GroupingPassConfiguration::createDisabled());

    EXPECT_TRUE(ir_manip->validateProfile(profile_generator, profile_name));
}
} // namespace

TEST(CirqPositive, BscMeanField)
{
    expectSuccess("default", R"script(
  %0 = inttoptr i64 0 to %Qubit*
  %1 = inttoptr i64 1 to %Qubit*
  %2 = inttoptr i64 2 to %Qubit*
  %3 = inttoptr i64 3 to %Qubit*
  %4 = inttoptr i64 4 to %Qubit*
  %5 = inttoptr i64 5 to %Qubit*
  %6 = inttoptr i64 6 to %Qubit*
  %7 = inttoptr i64 7 to %Qubit*
  call void @__quantum__qis__x__body(%Qubit* %2)
  call void @__quantum__qis__x__body(%Qubit* %6)
  call void @__quantum__qis__x__body(%Qubit* %5)
  call void @__quantum__qis__x__body(%Qubit* %0)
  call void @__quantum__qis__s__body(%Qubit* %2)
  call void @__quantum__qis__s__body(%Qubit* %6)
  call void @__quantum__qis__s__body(%Qubit* %5)
  call void @__quantum__qis__s__body(%Qubit* %0)
  call void @__quantum__qis__cx__body(%Qubit* %2, %Qubit* %4)
  call void @__quantum__qis__h__body(%Qubit* %2)
  call void @__quantum__qis__cx__body(%Qubit* %4, %Qubit* %2)
  call void @__quantum__qis__rz__body(double 0x3FD190467F77F61E, %Qubit* %2)
  call void @__quantum__qis__cx__body(%Qubit* %4, %Qubit* %2)
  call void @__quantum__qis__rz__body(double 0xBFD190467F77F61E, %Qubit* %2)
  call void @__quantum__qis__h__body(%Qubit* %2)
  call void @__quantum__qis__cx__body(%Qubit* %2, %Qubit* %4)
  call void @__quantum__qis__cx__body(%Qubit* %6, %Qubit* %7)
  call void @__quantum__qis__h__body(%Qubit* %6)
  call void @__quantum__qis__cx__body(%Qubit* %7, %Qubit* %6)
  call void @__quantum__qis__rz__body(double 0x3FE069081E98A77B, %Qubit* %6)
  call void @__quantum__qis__cx__body(%Qubit* %7, %Qubit* %6)
  call void @__quantum__qis__rz__body(double 0xBFE069081E98A77B, %Qubit* %6)
  call void @__quantum__qis__h__body(%Qubit* %6)
  call void @__quantum__qis__cx__body(%Qubit* %6, %Qubit* %7)
  call void @__quantum__qis__cx__body(%Qubit* %5, %Qubit* %3)
  call void @__quantum__qis__s__body(%Qubit* %3)
  call void @__quantum__qis__cx__body(%Qubit* %3, %Qubit* %5)
  call void @__quantum__qis__cx__body(%Qubit* %5, %Qubit* %3)
  call void @__quantum__qis__cx__body(%Qubit* %0, %Qubit* %1)
  call void @__quantum__qis__h__body(%Qubit* %0)
  call void @__quantum__qis__cx__body(%Qubit* %1, %Qubit* %0)
  call void @__quantum__qis__rz__body(double 0x3FE069081E98A785, %Qubit* %0)
  call void @__quantum__qis__cx__body(%Qubit* %1, %Qubit* %0)
  call void @__quantum__qis__rz__body(double 0xBFE069081E98A785, %Qubit* %0)
  call void @__quantum__qis__h__body(%Qubit* %0)
  call void @__quantum__qis__cx__body(%Qubit* %0, %Qubit* %1)
  call void @__quantum__qis__t__body(%Qubit* %2)
  call void @__quantum__qis__s__body(%Qubit* %2)
  call void @__quantum__qis__t__body(%Qubit* %6)
  call void @__quantum__qis__s__body(%Qubit* %6)
  call void @__quantum__qis__t__body(%Qubit* %5)
  call void @__quantum__qis__s__body(%Qubit* %5)
  call void @__quantum__qis__t__body(%Qubit* %0)
  call void @__quantum__qis__s__body(%Qubit* %0)
  call void @__quantum__qis__x__body(%Qubit* %2)
  call void @__quantum__qis__x__body(%Qubit* %6)
  call void @__quantum__qis__x__body(%Qubit* %5)
  call void @__quantum__qis__x__body(%Qubit* %0)

  )script");
}

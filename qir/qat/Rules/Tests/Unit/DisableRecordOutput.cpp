// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "Generators/ConfigurableProfileGenerator.hpp"
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
    ir_manip->declareOpaque("String");
    ir_manip->declareOpaque("Array");

    ir_manip->declareFunction("void @__quantum__rt__result_record_output(%Result*)");
    ir_manip->declareFunction("void @__quantum__rt__integer_record_output(i64)");
    ir_manip->declareFunction("void @__quantum__rt__double_record_output(double)");
    ir_manip->declareFunction("void @__quantum__rt__bool_record_output(i1)");
    ir_manip->declareFunction("void @__quantum__rt__tuple_start_record_output()");
    ir_manip->declareFunction("void @__quantum__rt__tuple_end_record_output()");
    ir_manip->declareFunction("void @__quantum__rt__array_start_record_output()");
    ir_manip->declareFunction("void @__quantum__rt__array_end_record_output()");

    if (!ir_manip->fromBodyString(script))
    {
        llvm::outs() << ir_manip->getErrorMessage() << "\n";
        exit(-1);
    }
    return ir_manip;
}

} // namespace

TEST(RuleSetTestSuite, DisablingRecordOutput)
{
    auto ir_manip = newIrManip(R"script(
    call void @__quantum__rt__result_record_output(%Result* null)      
    call void @__quantum__rt__integer_record_output(i64 0)    
    call void @__quantum__rt__double_record_output(double 0.000000e+00)    
    call void @__quantum__rt__bool_record_output(i1 0)    
    call void @__quantum__rt__tuple_start_record_output()    
    call void @__quantum__rt__tuple_end_record_output()    
    call void @__quantum__rt__array_start_record_output()    
    call void @__quantum__rt__array_end_record_output()    
  )script");

    auto configure_profile = [](RuleSet& rule_set) {
        auto factory = RuleFactory(rule_set, BasicAllocationManager::createNew(), BasicAllocationManager::createNew());

        factory.disableRecordOutputSupport();
    };

    auto profile = std::make_shared<ConfigurableProfileGenerator>(std::move(configure_profile));

    ir_manip->applyProfile(profile);

    // We expect that the call was removed
    EXPECT_EQ(ir_manip->toBodyInstructions(), IrManipulationTestHelper::Strings{"ret i8 0"});
}

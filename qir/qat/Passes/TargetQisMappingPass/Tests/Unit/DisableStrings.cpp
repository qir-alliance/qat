// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "gtest/gtest.h"
#include "qir/qat/AdaptorFactory/ConfigurableQirAdaptorFactory.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Passes/TargetQisMappingPass/Factory.hpp"
#include "qir/qat/TestTools/IrManipulationTestHelper.hpp"

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

    ir_manip->declareFunction("%String* @__quantum__rt__string_create(i8*)");
    ir_manip->declareFunction("void @__quantum__rt__message(%String*)");
    ir_manip->declareFunction("void @__quantum__rt__string_update_alias_count(%String*, i32)");
    ir_manip->declareFunction("void @__quantum__rt__string_update_reference_count(%String*, i32)");

    if (!ir_manip->fromBodyString(script))
    {
        llvm::outs() << ir_manip->getErrorMessage() << "\n";
        exit(-1);
    }

    return ir_manip;
}

} // namespace

TEST(RuleSetTestSuite, DisablingStrings)
{
    auto ir_manip = newIrManip(R"script(
    %0 = call %String* @__quantum__rt__string_create(i8* null)
    call void @__quantum__rt__string_update_reference_count(%String* %0, i32 1)      
    call void @__quantum__rt__string_update_alias_count(%String* %0, i32 1)    
    call void @__quantum__rt__message(%String* %0)
    call void @__quantum__rt__string_update_alias_count(%String* %0, i32 -1)    
    call void @__quantum__rt__string_update_reference_count(%String* %0, i32 -11)          
  )script");

    auto configure_adaptor = [](RuleSet& rule_set)
    {
        auto factory =
            RuleFactory(rule_set, BasicAllocationManager::createNew(), BasicAllocationManager::createNew(), nullptr);

        factory.disableStringSupport();
    };
    ConfigurationManager configuration_manager;
    auto adaptor = std::make_shared<ConfigurableQirAdaptorFactory>(configuration_manager, std::move(configure_adaptor));

    ir_manip->applyQirAdaptor(adaptor);

    // We expect that the call was removed
    EXPECT_EQ(ir_manip->toBodyInstructions(), IrManipulationTestHelper::Strings{"ret i8 0"});
}

// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/external/gtest.hpp"
#include "qir/qat/Generators/ConfigurableProfileGenerator.hpp"
#include "qir/qat/GroupingPass/GroupingPass.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Logging/CommentLogger.hpp"
#include "qir/qat/Profile/Profile.hpp"
#include "qir/qat/Rules/Factory.hpp"
#include "qir/qat/StaticResourceComponent/StaticResourceComponentConfiguration.hpp"
#include "qir/qat/TestTools/IrManipulationTestHelper.hpp"
#include "qir/qat/Utils/FunctionToModule.hpp"
#include "qir/qat/ZExtTransformPass/ZExtTransformPass.hpp"

#include <functional>

using namespace microsoft::quantum;

TEST(ZExtTransformPassTests, Unfold)
{
    auto script   = R"script(
    %0 = call i1 @get_i1()
    %1 = zext i1 %0 to i64
    call void @print_i64(i64 %1)
    %2 = call i2 @get_i2()
    %3 = zext i2 %2 to i64
    call void @print_i64(i64 %3)  
  )script";
    auto ir_manip = std::make_shared<IrManipulationTestHelper>();

    ir_manip->declareFunction("void @print_i64(i64)");
    ir_manip->declareFunction("i1 @get_i1()");
    ir_manip->declareFunction("i2 @get_i2()");

    if (!ir_manip->fromBodyString(script))
    {
        llvm::outs() << ir_manip->generateScript(script) << "\n\n";
        llvm::outs() << ir_manip->getErrorMessage() << "\n";
        exit(-1);
    }

    auto    logger = std::make_shared<CommentLogger>();
    Profile profile{"generic", logger, true, nullptr, nullptr, nullptr};
    profile.modulePassManager().addPass(FunctionToModule(llvm::FunctionPassManager()));
    profile.apply(*ir_manip->module());

    // EXPECT_TRUE(ir_manip->hasInstructionSequence({"%1 = select i1 %0, i64 1, i64 0", "%3 = zext i2 %2 to i64"}));
    // EXPECT_FALSE(ir_manip->hasInstructionSequence({"%1 = zext i1 %0 to i64"}));
}

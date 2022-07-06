// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/external/gtest.hpp"
#include "qir/qat/Llvm/Llvm.hpp"
#include "qir/qat/Rules/Factory.hpp"
#include "qir/qat/TestTools/IrManipulationTestHelper.hpp"
#include "qir/qat/Utils/FunctionToModule.hpp"
#include "qir/qat/ZExtTransformPass/ZExtTransformPass.hpp"

#include <functional>
#include <memory>

using namespace microsoft::quantum;

TEST(ZExtTransformPassTests, BasicReplacementTest)
{
    auto               context = std::make_unique<llvm::LLVMContext>();
    llvm::SMDiagnostic error;
    std::string        script = R"(
declare i1 @get_i1()
declare i2 @get_i2()
declare void @print_i64(i64)
define i8 @TheMain() {
entry:
    %0 = call i1 @get_i1()
    %1 = zext i1 %0 to i64
    call void @print_i64(i64 %1)
    %2 = call i2 @get_i2()
    %3 = zext i2 %2 to i64
    call void @print_i64(i64 %3) 
    ret i8 9
} 
    )";
    auto               module = llvm::parseIR(llvm::MemoryBufferRef(script, "test.ll"), error, *context);

    if (!module)
    {
        throw std::runtime_error("Failed to parse script");
    }

    llvm::LoopAnalysisManager     loop_analysis_manager;
    llvm::FunctionAnalysisManager function_analysis_manager;
    llvm::CGSCCAnalysisManager    gscc_analysis_manager;
    llvm::ModuleAnalysisManager   module_analysis_manager;

    auto pass_builder = std::make_unique<llvm::PassBuilder>();

    pass_builder->registerModuleAnalyses(module_analysis_manager);
    pass_builder->registerCGSCCAnalyses(gscc_analysis_manager);
    pass_builder->registerFunctionAnalyses(function_analysis_manager);
    pass_builder->registerLoopAnalyses(loop_analysis_manager);

    pass_builder->crossRegisterProxies(
        loop_analysis_manager, function_analysis_manager, gscc_analysis_manager, module_analysis_manager);

    llvm::ModulePassManager   mpm{};
    llvm::FunctionPassManager fpm{};

    auto pass = ZExtTransformPass();
    fpm.addPass(std::move(pass));

    mpm.addPass(FunctionToModule(std::move(fpm)));
    mpm.run(*module, module_analysis_manager);

    String                   output;
    llvm::raw_string_ostream ostream(output);
    ostream << *module;

    EXPECT_TRUE(output.find("%1 = select i1 %0, i64 1, i64 0") != std::string::npos);
}

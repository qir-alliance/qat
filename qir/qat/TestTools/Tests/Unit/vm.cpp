// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "TestTools/TestVm.hpp"
#include "gtest/gtest.h"

using namespace microsoft::quantum;

int8_t print_call_value = 0;
void   internal_print_name(int32_t x)
{
    print_call_value = x;
}

TEST(TestToolsTestSuite, TestVmBasic)
{
    llvm::InitializeNativeTarget();
    llvm::InitializeNativeTargetAsmPrinter();

    TestProgram program;
    program.parseFromScript("test.ll", R"(
@global_value = external global i32
declare void @print(i32)

define i8 @TheMain() {
entry:
  %0 = load i32, i32* @global_value
  store i32 1337, i32* @global_value
  call void @print(i32 %0)
  ret i8 9
} 
    )");

    TestVM test_vm(program);

    print_call_value     = 0;
    int32_t global_value = -119;

    test_vm.attachGlobalPointer("global_value", &global_value);
    test_vm.attachRuntimeFunction<void, int32_t>("print", &internal_print_name);

    auto val = test_vm.run<int8_t>("TheMain");
    EXPECT_EQ(print_call_value, -119);
    EXPECT_EQ(global_value, 1337);
    EXPECT_EQ(val, 9);
}

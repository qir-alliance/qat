// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "gtest/gtest.h"
#include "qir/qat/TestTools/TestVm.hpp"

using namespace microsoft::quantum;
namespace
{
int8_t print_call_value = 0;
void   internalPrintName(int32_t x)
{
    print_call_value = static_cast<int8_t>(print_call_value + x);
}
} // namespace

TEST(TestToolsTestSuite, TestVmBasic)
{

    TestProgram program;
    program.parseFromScript("test.ll", R"(
@global_value = external global i32
declare void @print_lambda(i32)
declare void @print_fptr(i32)

define i8 @TheMain() {
entry:
  %0 = load i32, i32* @global_value
  store i32 1337, i32* @global_value
  call void @print_lambda(i32 %0)
  call void @print_fptr(i32 %0)  
  ret i8 9
} 
    )");

    TestVM test_vm(program);

    print_call_value     = 0;
    int32_t global_value = 4;

    test_vm.attachGlobalExternalVariable("global_value", &global_value);
    test_vm.attachRuntimeFunction<void, int32_t>(
        "print_lambda", [](int32_t x) -> void { print_call_value = static_cast<int8_t>(print_call_value + 2 * x); });
    test_vm.attachRuntimeFunction<void, int32_t>("print_fptr", internalPrintName);

    auto val = test_vm.run<int8_t>("TheMain");
    EXPECT_EQ(print_call_value, 12);
    EXPECT_EQ(global_value, 1337);
    EXPECT_EQ(val, 9);
}

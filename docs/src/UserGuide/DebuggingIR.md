# Debugging an LLVM IR

```c++
#include <iostream>
#include <vector>

int main()
{
  std::vector<int> x;
  x[10299] = x[10299 * 2777] + 2;
  std::cout << "X[10299] = " << x[10299] << std::endl;
  return 0;
}
```

We create an IR and use QAT to add debug info

```
% clang++ -O3 -c -S -emit-llvm segfault.cpp
% qat -S segfault.ll > with_debug.ll
% mkdir -p bin
% llc -filetype=obj -o bin/testprog.o with_debug.ll
% clang++ -g -O1 bin/testprog.o -o bin/testprog
% lldb bin/testprog
```

Executing the program in the debugger we now see that the IR file is referred to when the segfault is happening:

```
(lldb) target create "bin/testprog"
Current executable set to '/Users/tfr/Documents/TestArea/LLVMIR/bin/testprog' (x86_64).
(lldb) r
Process 88015 launched: '/Users/tfr/Documents/TestArea/LLVMIR/bin/testprog' (x86_64)
Hello world
Process 88015 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = EXC_BAD_ACCESS (code=1, address=0x6d1a00c)
    frame #0: 0x0000000100003a4e testprog`main at segfault.ll:72:75
   69     call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %11) #9
   70     %24 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(%"class.std::__1::basic_ostream"* nonnull %3, i8 signext %20)
   71     %25 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull %3)
-> 72     %26 = load i32, i32* inttoptr (i64 114401292 to i32*), align 4, !tbaa !6
   73     %27 = add nsw i32 %26, 2
   74     store i32 %27, i32* inttoptr (i64 41196 to i32*), align 4, !tbaa !6
   75     %28 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(%"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i64 11)
(lldb)
```

# Debugging an LLVM IR

## Quick start with basic example

Assuming that you have compiled `qat` and have its location in your `PATH`
environment variable, create a C++ file called `segfault.cpp` with following
contents:

```c++
int main()
{
  int *ptr   = nullptr;
  ptr[10299] = ptr[10299 * 2777] + 2;
  return ptr[99];
}
```

Then run following commands

```sh
clang++ -O3 -c -S -emit-llvm segfault.cpp
qat -S segfault.ll > with_debug.ll
mkdir -p bin
llc -filetype=obj -o bin/segfault.o with_debug.ll
clang++ -g -O1 bin/segfault.o -o bin/segfault
lldb bin/segfault
```

Running the program in `lldb` should now create a stack trace that refers to the
`segfault.ll` file rather than the original `segfault.cpp` file:

```text
(lldb) target create "bin/segfault"
Current executable set to '/path/to/test/bin/segfault' (x86_64).
(lldb) r
Process 25334 launched: '/path/to/test/bin/segfault' (x86_64)
Process 25334 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = EXC_BAD_ACCESS (code=1, address=0x6d1a00c)
    frame #0: 0x0000000100003f60 segfault`main at segfault.ll:8:74
   5
   6    ; Function Attrs: nofree norecurse nounwind ssp uwtable
   7    define i32 @main() local_unnamed_addr #0 {
-> 8      %1 = load i32, i32* inttoptr (i64 114401292 to i32*), align 4, !tbaa !3
   9      %2 = add nsw i32 %1, 2
   10     store i32 %2, i32* inttoptr (i64 41196 to i32*), align 4, !tbaa !3
   11     %3 = load i32, i32* inttoptr (i64 396 to i32*), align 4, !tbaa !3
```

## Detailed basic example

In this example, we generate a simple program that will cause a segmentation
fault. The main program

```c++
int main()
{
  int *ptr   = nullptr;
  ptr[10299] = ptr[10299 * 2777] + 2;
  return ptr[99];
}
```

To generate the IR, we use `clang` with `-emit-llvm`

```sh
clang++ -O3 -c -S -emit-llvm segfault.cpp
```

which generates a file called `segfault.ll`. The main content of this file
should be similar to:

```llvm
define i32 @main() local_unnamed_addr #0 {
  %1 = load i32, i32* inttoptr (i64 114401292 to i32*), align 4, !tbaa !3
  %2 = add nsw i32 %1, 2
  store i32 %2, i32* inttoptr (i64 41196 to i32*), align 4, !tbaa !3
  %3 = load i32, i32* inttoptr (i64 396 to i32*), align 4, !tbaa !3
  ret i32 %3
}
```

We would expect that the program would segfault at the line starting with `%1`
as we have not allocated any memory. To create an IR with debug information, we
use `qat` as follows:

```sh
qat -S --add-ir-debug segfault.ll > segfault.dbg.ll
```

This command will add debug information referring to the original `segfault.ll`
places where no debug information is present. In case that the `.ll` file
already have debug information, we can strip that using `--strip-existing-dbg`:

```sh
qat -S --strip-existing-dbg --add-ir-debug segfault.ll > segfault.dbg.ll
```

Next we transform the new `.ll` file into an executable:

```sh
mkdir -p bin
llc -filetype=obj -o bin/segfault.o segfault.dbg.ll
clang++ -g -O1 bin/segfault.o -o bin/segfault
```

Running this program in `lldb`, we will now get stack traces that refer to the
`.ll` file rather than than `.cpp` file:

```text
% lldb bin/segfault
(lldb) target create "bin/segfault"
Current executable set to '/path/to/test/bin/segfault' (x86_64).
(lldb) r
Process 25334 launched: '/path/to/test/bin/segfault' (x86_64)
Process 25334 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = EXC_BAD_ACCESS (code=1, address=0x6d1a00c)
    frame #0: 0x0000000100003f60 segfault`main at segfault.ll:8:74
   5
   6    ; Function Attrs: nofree norecurse nounwind ssp uwtable
   7    define i32 @main() local_unnamed_addr #0 {
-> 8      %1 = load i32, i32* inttoptr (i64 114401292 to i32*), align 4, !tbaa !3
   9      %2 = add nsw i32 %1, 2
   10     store i32 %2, i32* inttoptr (i64 41196 to i32*), align 4, !tbaa !3
   11     %3 = load i32, i32* inttoptr (i64 396 to i32*), align 4, !tbaa !3
```

In this way, we can now trace the origin of an issue to the LLVM IR rather than
the original source file.

## Mixing IR with runtime

In this section we consider a slightly more complicated example where we want to
debug an IR combined with a runtime. Our runtime looks as follows:

```c++
int foo();
int ir_recurse(int);

int standard_recurse(int n)
{
  if (n <= 0)
  {
    return foo();
  }
  return ir_recurse(n - 1);
}

int main()
{
  int x = 2;
  return standard_recurse(20) + 2 * x;
}
```

As in the previous example, our IR will produce a segmentation fault. To ensure
that we get a stack trace containing traces of both the runtime and the IR, we
use a recursive function that alternates between using functionality in the
runtime and the main IR itself:

```c++
int standard_recurse(int);

int foo()
{
  int *ptr   = nullptr;
  ptr[10299] = ptr[10299 * 2777] + 2;
  return ptr[99];
}

int ir_recurse(int n)
{
  if (n <= 0)
  {
    return foo();
  }
  return standard_recurse(n - 1);
}
```

As in the previous example, we annotate `foo.ll` with debug information using
QAT before creating the object file and linking:

```sh
  clang++ -c -g -o bin/runtime.o runtime.cpp
  clang++ -c -S -emit-llvm foo.cpp
  qat -S --add-ir-debug  foo.ll  > foo.dbg.ll
  mkdir -p bin
  llc -filetype=obj -o bin/foo.dbg.o foo.dbg.ll
  clang++ -g bin/foo.dbg.o bin/runtime.o -o bin/qir_program
```

Running the debugger, we can now execute the program and produce a stack trace
as in the previous examples:

```text
Current executable set to '/path/to/test/bin/qir_program' (x86_64).
(lldb) r
Process 54371 launched: '/path/to/test/bin/qir_program' (x86_64)
Process 54371 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = EXC_BAD_ACCESS (code=1, address=0x6d1a00c)
    frame #0: 0x0000000100003e89 qir_program`_Z3foov at foo.ll:12:34
   9      store i32* null, i32** %1, align 8
   10     %2 = load i32*, i32** %1, align 8
   11     %3 = getelementptr inbounds i32, i32* %2, i64 28600323
-> 12     %4 = load i32, i32* %3, align 4
   13     %5 = add nsw i32 %4, 2
   14     %6 = load i32*, i32** %1, align 8
   15     %7 = getelementptr inbounds i32, i32* %6, i64 10299
(lldb) bt
* thread #1, queue = 'com.apple.main-thread', stop reason = EXC_BAD_ACCESS (code=1, address=0x6d1a00c)
  * frame #0: 0x0000000100003e89 qir_program`_Z3foov at foo.ll:12:34
    frame #1: 0x0000000100003efa qir_program`standard_recurse(n=0) at runtime.cpp:9:12
    frame #2: 0x0000000100003ecb qir_program`_Z10ir_recursei at foo.ll:40:49
    frame #3: 0x0000000100003f0f qir_program`standard_recurse(n=2) at runtime.cpp:11:10
    frame #4: 0x0000000100003ecb qir_program`_Z10ir_recursei at foo.ll:40:49
    frame #5: 0x0000000100003f0f qir_program`standard_recurse(n=4) at runtime.cpp:11:10
    frame #6: 0x0000000100003ecb qir_program`_Z10ir_recursei at foo.ll:40:49
    frame #7: 0x0000000100003f0f qir_program`standard_recurse(n=6) at runtime.cpp:11:10
    frame #8: 0x0000000100003ecb qir_program`_Z10ir_recursei at foo.ll:40:49
    frame #9: 0x0000000100003f0f qir_program`standard_recurse(n=8) at runtime.cpp:11:10
    frame #10: 0x0000000100003ecb qir_program`_Z10ir_recursei at foo.ll:40:49
    frame #11: 0x0000000100003f0f qir_program`standard_recurse(n=10) at runtime.cpp:11:10
    frame #12: 0x0000000100003ecb qir_program`_Z10ir_recursei at foo.ll:40:49
    frame #13: 0x0000000100003f0f qir_program`standard_recurse(n=12) at runtime.cpp:11:10
    frame #14: 0x0000000100003ecb qir_program`_Z10ir_recursei at foo.ll:40:49
    frame #15: 0x0000000100003f0f qir_program`standard_recurse(n=14) at runtime.cpp:11:10
    frame #16: 0x0000000100003ecb qir_program`_Z10ir_recursei at foo.ll:40:49
    frame #17: 0x0000000100003f0f qir_program`standard_recurse(n=16) at runtime.cpp:11:10
    frame #18: 0x0000000100003ecb qir_program`_Z10ir_recursei at foo.ll:40:49
    frame #19: 0x0000000100003f0f qir_program`standard_recurse(n=18) at runtime.cpp:11:10
    frame #20: 0x0000000100003ecb qir_program`_Z10ir_recursei at foo.ll:40:49
    frame #21: 0x0000000100003f0f qir_program`standard_recurse(n=20) at runtime.cpp:11:10
    frame #22: 0x0000000100003f40 qir_program`main at runtime.cpp:17:10
    frame #23: 0x000000010000d51e dyld`start + 462
(lldb) f 1
frame #1: 0x0000000100003efa qir_program`standard_recurse(n=0) at runtime.cpp:9:12
   6    {
   7      if (n <= 0)
   8      {
-> 9        return foo();
   10     }
   11     return ir_recurse(n - 1);
   12   }
(lldb)
```

We note how this incorporates traces from both `runtime.cpp` and `foo.ll` with
exact line reference. In this way, it is possible to debug in a similar manner
to what we are used to from classical computing.

## Multi-IR projects

Occasionally, we may want combine multiple IRs to produce one debuggable
executable. We note that we can choose two paths: Either we link at the IR
level, or we link at the object level. Unfortunately, LLVM does not produce
adequate debug symbols when multiple compilation units are defined in the same
IR. Hence, if we wish to follow the path of the former, we first need to combine
the IRs and then add debug information with reference to the _one combined
file_:

```sh
qat -S foo.ll bar.ll > combined.ll
qat -S --strip-existing-dbg  --add-ir-debug combined.ll > combined.dbg.ll
```

However, this approach looses the information about the location of the original
files `foo.ll` and `bar.ll`:

```text
  * thread #1, queue = 'com.apple.main-thread', stop reason = EXC_BAD_ACCESS (code=1, address=0x6d1a00c)
  * frame #0: 0x0000000100003ec9 combined_example`_Z3foov at combined.ll:11:34
    frame #1: 0x0000000100003f2e combined_example`_Z16standard_recursei at combined.ll:57:37
    frame #2: 0x0000000100003f0b combined_example`_Z10ir_recursei at combined.ll:38:49
    frame #3: 0x0000000100003f3b combined_example`_Z16standard_recursei at combined.ll:64:53
    frame #4: 0x0000000100003f0b combined_example`_Z10ir_recursei at combined.ll:38:49
    frame #5: 0x0000000100003f3b combined_example`_Z16standard_recursei at combined.ll:64:53
    frame #6: 0x0000000100003f0b combined_example`_Z10ir_recursei at combined.ll:38:49
    frame #7: 0x0000000100003f3b combined_example`_Z16standard_recursei at combined.ll:64:53
    frame #8: 0x0000000100003f0b combined_example`_Z10ir_recursei at combined.ll:38:49
    frame #9: 0x0000000100003f3b combined_example`_Z16standard_recursei at combined.ll:64:53
    frame #10: 0x0000000100003f0b combined_example`_Z10ir_recursei at combined.ll:38:49
    frame #11: 0x0000000100003f3b combined_example`_Z16standard_recursei at combined.ll:64:53
    frame #12: 0x0000000100003f0b combined_example`_Z10ir_recursei at combined.ll:38:49
    frame #13: 0x0000000100003f3b combined_example`_Z16standard_recursei at combined.ll:64:53
    frame #14: 0x0000000100003f0b combined_example`_Z10ir_recursei at combined.ll:38:49
    frame #15: 0x0000000100003f3b combined_example`_Z16standard_recursei at combined.ll:64:53
    frame #16: 0x0000000100003f0b combined_example`_Z10ir_recursei at combined.ll:38:49
    frame #17: 0x0000000100003f3b combined_example`_Z16standard_recursei at combined.ll:64:53
    frame #18: 0x0000000100003f0b combined_example`_Z10ir_recursei at combined.ll:38:49
    frame #19: 0x0000000100003f3b combined_example`_Z16standard_recursei at combined.ll:64:53
    frame #20: 0x0000000100003f0b combined_example`_Z10ir_recursei at combined.ll:38:49
    frame #21: 0x0000000100003f3b combined_example`_Z16standard_recursei at combined.ll:64:53
    frame #22: 0x0000000100003f6a combined_example`main at combined.ll:82:57
    frame #23: 0x000000010000d51e dyld`start + 462
```

To keep information about the original files, we have to turn to the second
approach where we create separate object files. This will prevent some
optimisations such as inlining, but will ensure that we can trace locations in
the individual files:

```sh
  clang++ -c -S -emit-llvm foo.cpp
  clang++ -c -S -emit-llvm bar.cpp
  qat -S --add-ir-debug  foo.ll  > foo.dbg.ll
  qat -S --add-ir-debug  bar.ll  > bar.dbg.ll
  mkdir -p bin
  llc -filetype=obj -o bin/foo.dbg.o foo.dbg.ll
  llc -filetype=obj -o bin/bar.dbg.o bar.dbg.ll
  clang++ -g bin/foo.dbg.o bin/bar.dbg.o -o bin/foo_bar_example
```

The executable will now contain debug symbols referring to `foo.ll` and
`bar.ll`.

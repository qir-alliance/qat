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

```lldb
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

```lldb
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


cc_library(
    name = "Llvm",
    srcs = glob(["Llvm/*.cpp", "Llvm/**/*.cpp"]),
    hdrs = glob(["Llvm/*.hpp", "Llvm/**/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "@llvm-project//llvm:IRReader",
      "@llvm-project//llvm:Target",
      "@llvm-project//llvm:TransformUtils",
      "@llvm-project//llvm:InstCombine",
      "@llvm-project//llvm:Scalar",

      # VM deps
      "@llvm-project//llvm:X86CodeGen",      
      "@llvm-project//llvm:X86AsmParser",            
      "@llvm-project//llvm:ExecutionEngine",
      "@llvm-project//llvm:OrcJIT",
      "@llvm-project//llvm:Interpreter"
    ],
)

cc_library(
    name = "AllocationManager",
    srcs = glob(["AllocationManager/*.cpp", "AllocationManager/**/*.cpp"]),
    hdrs = glob(["AllocationManager/*.hpp", "AllocationManager/**/*.hpp"]),   
    hdrs = glob(["*.hpp"]),    
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
    ],
)

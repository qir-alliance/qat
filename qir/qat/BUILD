
cc_library(
    name = "Llvm",
    srcs = glob(["Llvm/*.cpp"]),
    hdrs = glob(["Llvm/*.hpp"]),   
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
    name = "Logging",
    srcs = glob(["Logging/*.cpp"]),
    hdrs = glob(["Logging/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
    ],
)

cc_library(
    name = "Commandline",
    srcs = glob(["Commandline/*.cpp"]),
    hdrs = glob(["Commandline/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
    ],
)

cc_library(
    name = "Profile",
    srcs = glob(["Profile/*.cpp"]),
    hdrs = glob(["Profile/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
    ],
)

cc_library(
    name = "Validator",
    srcs = glob(["Validator/*.cpp"]),
    hdrs = glob(["Validator/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
      "//qir/qat:Logging",       
    ],
)

cc_library(
    name = "ValidatorPass",
    srcs = glob(["ValidatorPass/*.cpp"]),
    hdrs = glob(["ValidatorPass/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
      "//qir/qat:Logging", 
    ],
)

cc_library(
    name = "PreTransformTrimming",
    srcs = glob(["PreTransformTrimming/*.cpp"]),
    hdrs = glob(["PreTransformTrimming/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
      "//qir/qat:Logging", 
    ],
)


cc_library(
    name = "PostTransformValidation",
    srcs = glob(["PostTransformValidation/*.cpp"]),
    hdrs = glob(["PostTransformValidation/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
      "//qir/qat:Logging", 
    ],
)

cc_library(
    name = "StaticResourceComponent",
    srcs = glob(["StaticResourceComponent/*.cpp"]),
    hdrs = glob(["StaticResourceComponent/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
      "//qir/qat:Logging", 
    ],
)

cc_library(
    name = "GroupingPass",
    srcs = glob(["GroupingPass/*.cpp"]),
    hdrs = glob(["GroupingPass/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
      "//qir/qat:Logging", 
    ],
)

cc_library(
    name = "ModuleLoader",
    srcs = glob(["ModuleLoader/*.cpp"]),
    hdrs = glob(["ModuleLoader/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
    ],
)


cc_library(
    name = "AllocationManager",
    srcs = glob(["AllocationManager/*.cpp"]),
    hdrs = glob(["AllocationManager/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
    ],
)

cc_library(
    name = "Rules",
    srcs = glob(["Rules/*.cpp"]),
    hdrs = glob(["Rules/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
      "//qir/qat:Logging", 
    ],
)

cc_library(
    name = "TransformationRulesPass",
    srcs = glob(["TransformationRulesPass/*.cpp"]),
    hdrs = glob(["TransformationRulesPass/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
      "//qir/qat:Logging", 
      "//qir/qat:Rules",       
    ],
)

cc_library(
    name = "Generators",
    srcs = glob(["Generators/*.cpp"]),
    hdrs = glob(["Generators/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
      "//qir/qat:Logging", 
      "//qir/qat:Rules",       
      "//qir/qat:Commandline",             
      "//qir/qat:AllocationManager",             
      "//qir/qat:TransformationRulesPass",             
      "//qir/qat:Profile",             
      "//qir/qat:Validator",             
      "//qir/qat:StaticResourceComponent",             
      "//qir/qat:ValidationPass",      
      "//qir/qat:PostTransformValidation",      
      "//qir/qat:PreTransformTrimming",      
    ],
)


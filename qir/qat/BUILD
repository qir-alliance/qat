
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
      "@llvm-project//llvm:ARMCodeGen",      
      "@llvm-project//llvm:ARMAsmParser",            
      "@llvm-project//llvm:ExecutionEngine",
      "@llvm-project//llvm:OrcJIT",
      "@llvm-project//llvm:Interpreter"
    ],
)

cc_library(
    name = "QatTypes",
    srcs = glob(["QatTypes/*.cpp"]),
    hdrs = glob(["QatTypes/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
    ],
)

cc_library(
    name = "Utils",
    srcs = glob(["Utils/*.cpp"]),
    hdrs = glob(["Utils/*.hpp", "Utils/**/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:QatTypes", 
    ],
)


cc_library(
    name = "Logging",
    srcs = glob(["Logging/*.cpp"]),
    hdrs = glob(["Logging/*.hpp", "Logging/**/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm",
      "//qir/qat:QatTypes",
      "//qir/qat:Utils",
    ],
)

cc_library(
    name = "Commandline",
    srcs = glob(["Commandline/*.cpp"]),
    hdrs = glob(["Commandline/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:QatTypes",       
    ],
)

cc_library(
    name = "Profile",
    srcs = glob(["Profile/*.cpp"]),
    hdrs = glob(["Profile/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
      "//qir/qat:QatTypes",       
      "//qir/qat:Validator",      
      "//qir/qat:AllocationManager", 
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
      "//qir/qat:QatTypes",       
      "//qir/qat:ValidationPass",         
      "//qir/qat:StaticResourceComponent",          
      "//qir/qat:AllocationManager",            
    ],
)

cc_library(
    name = "ValidationPass",
    srcs = glob(["ValidationPass/*.cpp"]),
    hdrs = glob(["ValidationPass/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
      "//qir/qat:Logging", 
      "//qir/qat:QatTypes",    
      "//qir/qat:StaticResourceComponent",        
      "//qir/qat:Commandline",            
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
      "//qir/qat:QatTypes",       
      "//qir/qat:Commandline",   
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
      "//qir/qat:QatTypes",
      "//qir/qat:Commandline",                
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
      "//qir/qat:QatTypes",        
      "//qir/qat:Commandline"
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
      "//qir/qat:QatTypes",       
      "//qir/qat:Commandline",           
    ],
)

cc_library(
    name = "RemoveDisallowedAttributesPass",
    srcs = glob(["RemoveDisallowedAttributesPass/*.cpp"]),
    hdrs = glob(["RemoveDisallowedAttributesPass/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
      "//qir/qat:QatTypes",       
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
      "//qir/qat:QatTypes",       
      "//qir/qat:Logging",       
      "//qir/qat:RemoveDisallowedAttributesPass"
    ],
)


cc_library(
    name = "AllocationManager",
    srcs = glob(["AllocationManager/*.cpp"]),
    hdrs = glob(["AllocationManager/*.hpp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
      "//qir/qat:QatTypes",       
    ],
)

cc_library(
    name = "Rules",
    srcs = glob(["Rules/*.cpp", "Rules/Patterns/*.cpp", "Rules/Notation/*.cpp"]),
    hdrs = glob(["Rules/*.hpp", "Rules/**/*.hpp", "Rules/**/*.ipp"]),   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
      "//qir/qat:Logging", 
      "//qir/qat:QatTypes",       
      "//qir/qat:AllocationManager",      
      "//qir/qat:Commandline"        
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
      "//qir/qat:QatTypes",       
      "//qir/qat:Commandline",       
      "//qir/qat:Profile",       
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
      "//qir/qat:GroupingPass",
      "//qir/qat:QatTypes",       
    ],
)


cc_library(
    name = "QatConfig",
    srcs = ["Apps/Qat/QatConfig.cpp"],
    hdrs = ["Apps/Qat/QatConfig.hpp"],   
    visibility = ["//visibility:public"],
    deps = [
      "//qir/qat:Llvm", 
      "//qir/qat:Logging", 
      "//qir/qat:Commandline",                 
    ],
)

cc_binary(
    name = "qat",
    srcs = ["Apps/Qat/Qat.cpp"],
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
      "//qir/qat:GroupingPass",
      "//qir/qat:QatTypes",     
      "//qir/qat:QatConfig",           
      "//qir/qat:ModuleLoader", 
      "//qir/qat:Generators",           

    ],
    visibility = [
        "//visibility:public",
    ],
)


cc_binary(
    name = "test",
    srcs = ["Apps/Qat/Test.cpp"],
    deps = [   
    ],
    visibility = [
        "//visibility:public",
    ],
)

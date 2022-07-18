load("@rules_cc//cc:defs.bzl", "cc_library")
load("//:config/microsoft.bzl", "ms_cc_binary", "ms_cc_library")

cc_library(
    name = "Llvm",
    srcs = [],
    hdrs = ["Llvm/Llvm.hpp"],
    visibility = ["//visibility:public"],
    deps = [
        "@llvm-project//llvm:IRReader",
        "@llvm-project//llvm:Target",
        "@llvm-project//llvm:TransformUtils",
        "@llvm-project//llvm:InstCombine",
        "@llvm-project//llvm:Scalar",
        "@llvm-project//llvm:Passes",

        # VM deps
        "@llvm-project//llvm:ExecutionEngine",
        "@llvm-project//llvm:OrcJIT",
        "@llvm-project//llvm:Interpreter",
    ] + select({
        "@platforms//cpu:aarch64": [
            "@llvm-project//llvm:AArch64CodeGen",
            "@llvm-project//llvm:AArch64AsmParser",
        ],
        "@platforms//cpu:arm": [
            "@llvm-project//llvm:ARMCodeGen",
            "@llvm-project//llvm:ARMAsmParser",
        ],
        "@platforms//cpu:x86_64": [
            "@llvm-project//llvm:X86CodeGen",
            "@llvm-project//llvm:X86AsmParser",
        ],
        "//conditions:default": [
        ],
    }),
)

ms_cc_library(
    name = "QatTypes",
    srcs = glob(["QatTypes/*.cpp"]),
    hdrs = glob(["QatTypes/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Llvm",
    ],
)

ms_cc_library(
    name = "Utils",
    srcs = glob(["Utils/*.cpp"]),
    hdrs = glob([
        "Utils/*.hpp",
        "Utils/**/*.hpp",
    ]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:QatTypes",
    ],
)

ms_cc_library(
    name = "Logging",
    srcs = glob(["Logging/*.cpp"]),
    hdrs = glob([
        "Logging/*.hpp",
        "Logging/**/*.hpp",
    ]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Llvm",
        "//qir/qat:QatTypes",
        "//qir/qat:Utils",
    ],
)

ms_cc_library(
    name = "Commandline",
    srcs = glob(["Commandline/*.cpp"]),
    hdrs = glob(["Commandline/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:QatTypes",
    ],
)

ms_cc_library(
    name = "Profile",
    srcs = glob(["Profile/*.cpp"]),
    hdrs = glob(["Profile/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:AllocationManager",
        "//qir/qat:Llvm",
        "//qir/qat:QatTypes",
        "//qir/qat:Validator",
    ],
)

ms_cc_library(
    name = "Validator",
    srcs = glob(["Validator/*.cpp"]),
    hdrs = glob(["Validator/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:AllocationManager",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:QatTypes",
        "//qir/qat:StaticResourceComponent",
        "//qir/qat:ValidationPass",
    ],
)

ms_cc_library(
    name = "ValidationPass",
    srcs = glob(["ValidationPass/*.cpp"]),
    hdrs = glob(["ValidationPass/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Commandline",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:QatTypes",
        "//qir/qat:StaticResourceComponent",
    ],
)

ms_cc_library(
    name = "PreTransformTrimming",
    srcs = glob(["PreTransformTrimming/*.cpp"]),
    hdrs = glob(["PreTransformTrimming/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Commandline",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:QatTypes",
    ],
)

ms_cc_library(
    name = "PostTransformValidation",
    srcs = glob(["PostTransformValidation/*.cpp"]),
    hdrs = glob(["PostTransformValidation/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Commandline",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:QatTypes",
    ],
)

ms_cc_library(
    name = "StaticResourceComponent",
    srcs = glob(["StaticResourceComponent/*.cpp"]),
    hdrs = glob(["StaticResourceComponent/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Commandline",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:QatTypes",
    ],
)

ms_cc_library(
    name = "GroupingPass",
    srcs = glob(["GroupingPass/*.cpp"]),
    hdrs = glob(["GroupingPass/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Commandline",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:QatTypes",
    ],
)

ms_cc_library(
    name = "RemoveDisallowedAttributesPass",
    srcs = glob(["RemoveDisallowedAttributesPass/*.cpp"]),
    hdrs = glob(["RemoveDisallowedAttributesPass/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:QatTypes",
    ],
)

ms_cc_library(
    name = "ZExtTransformPass",
    srcs = glob(["ZExtTransformPass/*.cpp"]),
    hdrs = glob(["ZExtTransformPass/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:QatTypes",
    ],
)

ms_cc_library(
    name = "ModuleLoader",
    srcs = glob(["ModuleLoader/*.cpp"]),
    hdrs = glob(["ModuleLoader/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:QatTypes",
        "//qir/qat:RemoveDisallowedAttributesPass",
    ],
)

ms_cc_library(
    name = "AllocationManager",
    srcs = glob(["AllocationManager/*.cpp"]),
    hdrs = glob(["AllocationManager/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Llvm",
        "//qir/qat:QatTypes",
    ],
)

ms_cc_library(
    name = "Rules",
    srcs = glob([
        "Rules/*.cpp",
        "Rules/Patterns/*.cpp",
        "Rules/Notation/*.cpp",
    ]),
    hdrs = glob([
        "Rules/*.hpp",
        "Rules/**/*.hpp",
        "Rules/**/*.ipp",
    ]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:AllocationManager",
        "//qir/qat:Commandline",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:QatTypes",
    ],
)

ms_cc_library(
    name = "TransformationRulesPass",
    srcs = glob(["TransformationRulesPass/*.cpp"]),
    hdrs = glob(["TransformationRulesPass/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Commandline",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:Profile",
        "//qir/qat:QatTypes",
        "//qir/qat:Rules",
    ],
)

ms_cc_library(
    name = "RecordPullBackPass",
    srcs = glob(["RecordPullBackPass/*.cpp"]),
    hdrs = glob(["RecordPullBackPass/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Commandline",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:QatTypes",
    ],
)

ms_cc_library(
    name = "Generators",
    srcs = glob(["Generators/*.cpp"]),
    hdrs = glob(["Generators/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:AllocationManager",
        "//qir/qat:Commandline",
        "//qir/qat:GroupingPass",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:PostTransformValidation",
        "//qir/qat:PreTransformTrimming",
        "//qir/qat:Profile",
        "//qir/qat:QatTypes",
        "//qir/qat:RecordPullBackPass",
        "//qir/qat:Rules",
        "//qir/qat:StaticResourceComponent",
        "//qir/qat:TransformationRulesPass",
        "//qir/qat:ValidationPass",
        "//qir/qat:Validator",
        "//qir/qat:ZExtTransformPass",
    ],
)

ms_cc_library(
    name = "QatConfig",
    srcs = ["Apps/Qat/QatConfig.cpp"],
    hdrs = ["Apps/Qat/QatConfig.hpp"],
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Commandline",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
    ],
)

ms_cc_library(
    name = "TestTools",
    srcs = glob(["TestTools/*.cpp"]),
    hdrs = glob(["TestTools/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:AllocationManager",
        "//qir/qat:Commandline",
        "//qir/qat:Generators",
        "//qir/qat:GroupingPass",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:ModuleLoader",
        "//qir/qat:PostTransformValidation",
        "//qir/qat:PreTransformTrimming",
        "//qir/qat:Profile",
        "//qir/qat:QatConfig",
        "//qir/qat:QatTypes",
        "//qir/qat:Rules",
        "//qir/qat:StaticResourceComponent",
        "//qir/qat:TransformationRulesPass",
        "//qir/qat:ValidationPass",
        "//qir/qat:Validator",
    ],
)

ms_cc_binary(
    name = "qat",
    srcs = ["Apps/Qat/Qat.cpp"],
    visibility = [
        "//visibility:public",
    ],
    deps = [
        "//qir/qat:AllocationManager",
        "//qir/qat:Commandline",
        "//qir/qat:Generators",
        "//qir/qat:GroupingPass",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:ModuleLoader",
        "//qir/qat:PostTransformValidation",
        "//qir/qat:PreTransformTrimming",
        "//qir/qat:Profile",
        "//qir/qat:QatConfig",
        "//qir/qat:QatTypes",
        "//qir/qat:RecordPullBackPass",
        "//qir/qat:Rules",
        "//qir/qat:StaticResourceComponent",
        "//qir/qat:TransformationRulesPass",
        "//qir/qat:ValidationPass",
        "//qir/qat:Validator",
    ],
)

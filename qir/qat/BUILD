load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")
load("@rules_cc//cc:defs.bzl", "cc_library")
load("@rules_python//python:defs.bzl", "py_binary")
load("//:config/microsoft.bzl", "ms_cc_binary", "ms_cc_library")
# To build Docker image include
# load("@io_bazel_rules_docker//container:container.bzl", "container_image")

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
        "@llvm-project//llvm:MCJIT",
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

genrule(
    name = "WorkspaceVariables",
    outs = ["workspace.txt"],
    cmd = "cp bazel-out/stable-status.txt $@",
    stamp = 1,
)

py_binary(
    name = "VersionBuilder",
    srcs = ["Version/version_builder.py"],
    main = "version_builder.py",
)

genrule(
    name = "VersionHeaderFile",
    srcs = ["Version/Version.tpl.hpp"],
    outs = ["Version/Version.hpp"],
    cmd = "$(location //qir/qat:VersionBuilder) $(location //qir/qat:WorkspaceVariables) $(location Version/Version.tpl.hpp) $@",
    tools = [
        "//qir/qat:VersionBuilder",
        "//qir/qat:WorkspaceVariables",
    ],
)

ms_cc_library(
    name = "Version",
    srcs = ["Version/Version.cpp"],
    hdrs = ["Version/Version.hpp"],
    data = [
        "//qir/qat:VersionHeaderFile",
    ],
)

ms_cc_binary(
    name = "VersionTool",
    srcs = ["Apps/VersionTool/VersionTool.cpp"],
    visibility = [
        "//visibility:public",
    ],
    deps = [
        "//qir/qat:Version",
    ],
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
        "//qir/external:yaml",
        "//qir/qat:QatTypes",
    ],
)

ms_cc_library(
    name = "QirAdaptor",
    srcs = glob(["QirAdaptor/*.cpp"]),
    hdrs = glob(["QirAdaptor/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:AllocationManager",
        "//qir/qat:Llvm",
        "//qir/qat:QatTypes",
        "//qir/qat:Validator",
    ],
)

ms_cc_library(
    name = "DivisionByZero",
    srcs = glob(["Passes/DivisionByZeroPass/*.cpp"]),
    hdrs = glob(["Passes/DivisionByZeroPass/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:QatTypes",
        "//qir/qat:ValidationPass",
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
    srcs = glob(["Passes/ValidationPass/*.cpp"]),
    hdrs = glob(["Passes/ValidationPass/*.hpp"]),
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
    name = "RemoveNonEntrypointFunctions",
    srcs = glob(["Passes/RemoveNonEntrypointFunctions/*.cpp"]),
    hdrs = glob(["Passes/RemoveNonEntrypointFunctions/*.hpp"]),
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
    srcs = glob(["Passes/PostTransformValidation/*.cpp"]),
    hdrs = glob(["Passes/PostTransformValidation/*.hpp"]),
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
    srcs = glob(["Passes/StaticResourceComponent/*.cpp"]),
    hdrs = glob(["Passes/StaticResourceComponent/*.hpp"]),
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
    srcs = glob(["Passes/GroupingPass/*.cpp"]),
    hdrs = glob(["Passes/GroupingPass/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Commandline",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:QatTypes",
    ],
)

ms_cc_library(
    name = "FunctionReplacementPass",
    srcs = glob(["Passes/FunctionReplacementPass/*.cpp"]),
    hdrs = glob(["Passes/FunctionReplacementPass/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Commandline",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:QatTypes",
    ],
)

ms_cc_library(
    name = "ZExtTransformPass",
    srcs = glob(["Passes/ZExtTransformPass/*.cpp"]),
    hdrs = glob(["Passes/ZExtTransformPass/*.hpp"]),
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
    name = "TargetQisMappingPass",
    srcs = glob(["Passes/TargetQisMappingPass/*.cpp"]),
    hdrs = glob(["Passes/TargetQisMappingPass/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Commandline",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:QatTypes",
        "//qir/qat:QirAdaptor",
        "//qir/qat:Rules",
    ],
)

cc_library(
    name = "DeferMeasurementPass",
    srcs = glob(["Passes/DeferMeasurementPass/*.cpp"]),
    hdrs = glob(["Passes/DeferMeasurementPass/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Commandline",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:QatTypes",
    ],
)

ms_cc_library(
    name = "AdaptorFactory",
    srcs = glob(["AdaptorFactory/*.cpp"]),
    hdrs = glob(["AdaptorFactory/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:AllocationManager",
        "//qir/qat:Commandline",
        "//qir/qat:DeferMeasurementPass",
        "//qir/qat:FunctionReplacementPass",
        "//qir/qat:GroupingPass",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:PostTransformValidation",
        "//qir/qat:QatTypes",
        "//qir/qat:QirAdaptor",
        "//qir/qat:RemoveNonEntrypointFunctions",
        "//qir/qat:Rules",
        "//qir/qat:StaticResourceComponent",
        "//qir/qat:TargetQisMappingPass",
        "//qir/qat:ValidationPass",
        "//qir/qat:Validator",
        "//qir/qat:ZExtTransformPass",
    ],
)

ms_cc_library(
    name = "QatConfig",
    srcs = [
        "Apps/Qat/QatConfig.cpp",
        "Apps/Qat/QirAdaptorConfiguration.cpp",
    ],
    hdrs = [
        "Apps/Qat/QatConfig.hpp",
        "Apps/Qat/QirAdaptorConfiguration.hpp",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:Commandline",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:ValidationPass",
    ],
)

ms_cc_library(
    name = "TestTools",
    srcs = glob(["TestTools/*.cpp"]),
    hdrs = glob(["TestTools/*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//qir/qat:AdaptorFactory",
        "//qir/qat:AllocationManager",
        "//qir/qat:Commandline",
        "//qir/qat:FunctionReplacementPass",
        "//qir/qat:GroupingPass",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:ModuleLoader",
        "//qir/qat:PostTransformValidation",
        "//qir/qat:QatConfig",
        "//qir/qat:QatTypes",
        "//qir/qat:QirAdaptor",
        "//qir/qat:RemoveNonEntrypointFunctions",
        "//qir/qat:Rules",
        "//qir/qat:StaticResourceComponent",
        "//qir/qat:TargetQisMappingPass",
        "//qir/qat:ValidationPass",
        "//qir/qat:Validator",
    ],
)

ms_cc_binary(
    name = "qat",
    srcs = [
        "Apps/Qat/Qat.cpp",
        "Apps/Qat/QirAdaptorConfiguration.hpp",
    ],
    visibility = [
        "//visibility:public",
    ],
    deps = [
        "//qir/qat:AdaptorFactory",
        "//qir/qat:AllocationManager",
        "//qir/qat:Commandline",
        "//qir/qat:DeferMeasurementPass",
        "//qir/qat:FunctionReplacementPass",
        "//qir/qat:GroupingPass",
        "//qir/qat:Llvm",
        "//qir/qat:Logging",
        "//qir/qat:ModuleLoader",
        "//qir/qat:PostTransformValidation",
        "//qir/qat:QatConfig",
        "//qir/qat:QatTypes",
        "//qir/qat:QirAdaptor",
        "//qir/qat:RemoveNonEntrypointFunctions",
        "//qir/qat:Rules",
        "//qir/qat:StaticResourceComponent",
        "//qir/qat:TargetQisMappingPass",
        "//qir/qat:ValidationPass",
        "//qir/qat:Validator",
        "//qir/qat:Version",
    ],
)

pkg_tar(
    name = "qat-tar",
    srcs = [":qat"],
    mode = "0755",
    package_dir = "/opt",
    visibility = ["//visibility:public"],
)

# To enable building Docker images, add this
# container_image(
#     name = "qat-image",
#     base = "@ubuntu-linux//image",
#     cmd = ["/opt/qat"],
#     target_compatible_with = [
#         "@platforms//cpu:x86_64",
#         "@platforms//os:linux",
#     ],
#     tars = [":qat-tar"],
# )

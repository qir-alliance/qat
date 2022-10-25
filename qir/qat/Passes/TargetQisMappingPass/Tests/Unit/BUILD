load("@rules_cc//cc:defs.bzl", "cc_test")

cc_test(
    name = "unit",
    srcs = glob(["*.cpp"]),
    deps = [
        "//qir/external:gmock",
        "//qir/qat:AdaptorFactory",
        "//qir/qat:AllocationManager",
        "//qir/qat:Commandline",
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
        "//qir/qat:TestTools",
        "//qir/qat:ValidationPass",
        "//qir/qat:Validator",
    ],
)

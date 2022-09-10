load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "yaml",
    hdrs = ["yaml.hpp"],
    copts = [
    ],
    visibility = [
        "//visibility:public",
    ],
    deps = [
        "@yaml-cpp//:yaml-cpp",
    ],
)

cc_library(
    name = "gtest",
    hdrs = ["gtest.hpp"],
    copts = [
        "-Iexternal/googletest/googletest/include",
        "-Iexternal/googlemock/googlemock/include",
    ],
    visibility = [
        "//visibility:public",
    ],
    deps = [
        "@googletest",
    ],
)

cc_library(
    name = "gmock",
    hdrs = [
        "gmock.hpp",
        "gtest.hpp",
    ],
    copts = [
        "-Iexternal/googletest/googletest/include",
        "-Iexternal/googlemock/googlemock/include",
    ],
    visibility = [
        "//visibility:public",
    ],
    deps = [
        "@googletest//:googlemock",
    ],
)

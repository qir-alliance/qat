load("@rules_cc//cc:defs.bzl", "cc_library")

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
        "gtest.hpp",
        "gmock.hpp",
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

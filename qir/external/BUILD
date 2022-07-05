cc_library(
    name = "gtest",
    hdrs = glob(["gtest.hpp"]),  
    copts = [
        "-Iexternal/googletest/googletest/include", 
        "-Iexternal/googlemock/googlemock/include"],  
    deps = [ 
      "@googletest//:googletest",
    ],
    visibility = [
        "//visibility:public",
    ],
)

cc_library(
    name = "gmock",
    hdrs = glob(["gmock.hpp", "gtest.hpp"]),  
    copts = [
        "-Iexternal/googletest/googletest/include", 
        "-Iexternal/googlemock/googlemock/include"],  
    deps = [ 

      "@googletest//:googlemock",
    ],
    visibility = [
        "//visibility:public",
    ],
)

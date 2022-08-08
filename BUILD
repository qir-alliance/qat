
constraint_setting(name = "stdlib")
constraint_value(
    name = "glibc",
    constraint_setting = ":stdlib",
)
constraint_value(
    name = "musl",
    constraint_setting = ":stdlib",
)

platform(
    name = "apple-silicon",
    constraint_values = [
        "@//:glibc",
        "@platforms//cpu:arm64",
        "@platforms//os:osx",
    ],
)

platform(
    name = "apple-x86",
    constraint_values = [
        "@//:glibc",    
        "@platforms//cpu:x86_64",
        "@platforms//os:osx",
    ],
)


platform(
    name = "linux-x86",
    constraint_values = [
        "@//:glibc",    
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
)

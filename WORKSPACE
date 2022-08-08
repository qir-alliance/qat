workspace(name = "microsoft")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_skylib",
    sha256 = "97e70364e9249702246c0e9444bccdc4b847bed1eb03c5a3ece4f83dfe6abc44",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
    ],
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

http_archive(
    name = "bazel_gazelle",
    sha256 = "d8c45ee70ec39a57e7a05e5027c32b1576cc7f16d9dd37135b0eddde45cf1b10",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/bazel-gazelle/releases/download/v0.20.0/bazel-gazelle-v0.20.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.20.0/bazel-gazelle-v0.20.0.tar.gz",
    ],
)

## `bazel-toolchain`:
LLVM_TOOLCHAIN_VER = "f353e0a15b96f5aaf915dcc0772794faba899e38"

LLVM_TOOLCHAIN_SHA = "b0d6a9fe9b962939c01e2e5ad6dae5d7843d9c8c24df8258ea433634e9b11728"

http_archive(
    name = "com_grail_bazel_toolchain",
    canonical_id = LLVM_TOOLCHAIN_VER,
    sha256 = LLVM_TOOLCHAIN_SHA,
    strip_prefix = "bazel-toolchain-{ver}".format(ver = LLVM_TOOLCHAIN_VER),
    url = "https://github.com/rrbutani/bazel-toolchain/archive/{ver}.tar.gz".format(ver = LLVM_TOOLCHAIN_VER),
)

load("@com_grail_bazel_toolchain//toolchain:deps.bzl", "bazel_toolchain_dependencies")

bazel_toolchain_dependencies()

## Toolchains:
load("@com_grail_bazel_toolchain//toolchain:rules.bzl", "llvm_toolchain")

llvm_toolchain(
    name = "llvm_toolchain",
    # NOTE: This is required to set up toolchains outside of `@llvm_toolchain`, unfortunately
    absolute_paths = True,
    llvm_version = "12.0.0",
)

# Not sure if there's a *right* place to grab the macOS SDKs, but this certainly works:
#
# TODO: this is massive (~640MB); we only need a fraction of the things in `/usr/lib`
# `/usr/include` (if you exclude `/usr/lib/swift` these are about 10MB or so).
#
# If we add this to `bazel-toolchain` we should have a repo rule only copy in the stuff
# that's needed to save disk space.
http_archive(
    name = "macos-11.3-sdk",
    build_file_content = """
filegroup(
  name = "sysroot",
  srcs = glob(["usr/**"], exclude = ["usr/share/**"]),
  visibility = ["//visibility:public"],
)
""",
    sha256 = "cd4f08a75577145b8f05245a2975f7c81401d75e9535dcffbb879ee1deefcbf4",
    strip_prefix = "MacOSX11.3.sdk",
    url = "https://github.com/phracker/MacOSX-SDKs/releases/download/11.3/MacOSX11.3.sdk.tar.xz",
)

load("@llvm_toolchain//:toolchains.bzl", "llvm_register_toolchains")

llvm_register_toolchains()

register_toolchains("//toolchain:clang-darwin-arm64")

# ================================================================
# LLVM
# ================================================================

# Replace with the LLVM commit you want to use.
LLVM_COMMIT = "81d5412439efd0860c0a8dd51b831204f118d485"

# The easiest way to calculate this for a new commit is to set it to empty and
# then run a bazel build and it will report the digest necessary to cache the
# archive and make the build reproducible.
LLVM_SHA256 = "50b3ef31b228ea0c96ae074005bfac087c56e6a4b1c147592dd33f41cad0706b"

http_archive(
    name = "llvm-raw",
    build_file_content = "# empty",
    sha256 = LLVM_SHA256,
    strip_prefix = "llvm-project-" + LLVM_COMMIT,
    urls = ["https://github.com/llvm/llvm-project/archive/{commit}.tar.gz".format(commit = LLVM_COMMIT)],
)

load("@llvm-raw//utils/bazel:configure.bzl", "llvm_configure", "llvm_disable_optional_support_deps")

llvm_configure(name = "llvm-project")

# Disables optional dependencies for Support like zlib and terminfo. You may
# instead want to configure them using the macros in the corresponding bzl
# files.
llvm_disable_optional_support_deps()

# ================================================================
# Google
# ================================================================

http_archive(
    name = "googletest",
    build_file = "@//:config/BUILD.googletest",
    sha256 = "94c634d499558a76fa649edb13721dce6e98fb1e7018dfaeba3cd7a083945e91",
    strip_prefix = "googletest-release-1.10.0",
    url = "https://github.com/google/googletest/archive/release-1.10.0.zip",
)

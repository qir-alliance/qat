{ pkgs, lib, config, inputs, ... }:

{
  env = {
    CC = lib.getExe' pkgs.clang "clang";
    CXX = lib.getExe' pkgs.clang "clang++";
  };

  packages = [
    pkgs.bazel_5 # see .bazelversion
    pkgs.bazelisk

    # locked: new versions of LLVM are not supported
    pkgs.llvmPackages_14.llvm

    # required libraries
    pkgs.libffi
    pkgs.ncurses # → pkgs.libtinfo
    pkgs.libxml2
  ];

  enterShell = ''
    export CC=${config.env.CC}
    export CXX=${config.env.CXX}
  '';

  languages.cplusplus.enable = true;
  languages.python.enable = true;
  #languages.python.uv.enable = true;
}

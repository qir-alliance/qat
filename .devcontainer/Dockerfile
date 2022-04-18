FROM mcr.microsoft.com/vscode/devcontainers/universal:1-linux

USER root

RUN apt-get -y update && \
    apt-get -y remove llvm-10 && \
    apt-get -y install cmake clang-11 clang-format-11 clang-tidy-11

USER codespace

ENV CC=clang-11 CXX=clang++-11

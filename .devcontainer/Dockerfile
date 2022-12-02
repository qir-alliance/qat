FROM ubuntu:focal
ADD https://apt.llvm.org/llvm-snapshot.gpg.key /llvm-snapshot.gpg.key
USER codespace
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y git gnupg2 software-properties-common cmake python3-pip && \
    apt-key add /llvm-snapshot.gpg.key && \
    add-apt-repository "deb https://apt.llvm.org/focal/ llvm-toolchain-focal-13 main" && \
    apt-get -y update && \
    apt-get -y install clang-13 clang-format-13 clang-tidy-13 && \
    apt autoremove -y
ENV CC=clang-13 CXX=clang++-13

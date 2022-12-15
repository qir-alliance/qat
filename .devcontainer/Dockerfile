FROM ubuntu:jammy
ADD https://apt.llvm.org/llvm-snapshot.gpg.key /llvm-snapshot.gpg.key
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y git gnupg2 software-properties-common cmake python3-pip && \
    apt-key add /llvm-snapshot.gpg.key && \
    add-apt-repository "deb https://apt.llvm.org/jammy/ llvm-toolchain-jammy-14 main" && \
    apt-get -y update && \
    apt-get -y install clang-14 clang-format-14 clang-tidy-14 llvm-14 && \
    apt autoremove -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/
RUN adduser --system codespace
USER codespace
ENV CC=clang-14 CXX=clang++-14 SHELL=/usr/bin/bash
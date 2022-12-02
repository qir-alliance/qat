FROM ubuntu:focal
ADD https://apt.llvm.org/llvm-snapshot.gpg.key /llvm-snapshot.gpg.key
USER codespace
ARG DEBIAN_FRONTEND=noninteractive
RUN sudo apt-get update && \
    sudo apt-get install -y git gnupg2 software-properties-common cmake python3-pip && \
    sudo apt-key add /llvm-snapshot.gpg.key && \
    sudo add-apt-repository "deb https://apt.llvm.org/focal/ llvm-toolchain-focal-13 main" && \
    sudo apt-get -y update && \
    sudo apt-get -y install clang-13 clang-format-13 clang-tidy-13 && \
    sudo apt autoremove -y && \
    sudo apt-get clean && rm -rf /var/lib/apt/lists/
ENV CC=clang-13 CXX=clang++-13

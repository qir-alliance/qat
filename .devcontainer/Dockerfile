FROM mcr.microsoft.com/vscode/devcontainers/universal:1-linux

USER root

RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add - && \
    add-apt-repository "deb https://apt.llvm.org/focal/ llvm-toolchain-focal-13 main" && \
    apt-get -y update && \
    apt-get -y remove llvm-10 && \
    apt-get -y install cmake clang-13 clang-format-13 clang-tidy-13 && \
    npm install -g prettier@2.2.1

USER codespace

ENV CC=clang-13 CXX=clang++-13

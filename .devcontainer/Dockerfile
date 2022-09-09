FROM mcr.microsoft.com/vscode/devcontainers/universal:linux
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add - && \
    sudo add-apt-repository "deb https://apt.llvm.org/focal/ llvm-toolchain-focal-13 main" && \
    sudo apt-get -y update && \
    sudo apt-get -y remove llvm-10 && \
    sudo apt-get -y install clang-13 clang-format-13 clang-tidy-13 && \
    sudo apt autoremove -y && \
    npm install -g prettier@2.2.1
ENV CC=clang-13 CXX=clang++-13

FROM ubuntu:22.04

# basic dependencies -
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
  apt-get install -y 

RUN apt-get install -y curl \
  pkg-config \
  findutils \
  wget

# build dependencies
RUN apt-get install -y && \
    apt-get remove -y llvm-12 clang-format-11 clang-tidy-11 && \
    apt-get install -y curl pkg-config findutils  wget && \
    apt install -y clang-13 cmake clang-format-13 clang-tidy-13 && \
    apt-get install -y llvm-13 lldb-13 llvm-13-dev libllvm11 llvm-13-runtime opt && \
    apt-get install -y nodejs npm && \
    apt install -y python3 python3-pip && \
    npm install -g prettier@2.2.1 && \
    export CC=clang-13 && \
    export CXX=clang++-13

# Python
RUN apt install -y python3 python3-pip && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 0

ADD ./requirements.txt /src/
ADD ./manage /src/
RUN cd /src/ && \
      pip install -r requirements.txt && \
      chmod +x manage

# running the build
ENV CC=clang-13 \
  CXX=clang++-13 \
  PYTHONUNBUFFERED=1 \
  PYTHON_BIN_PATH=/usr/bin/python3

WORKDIR /src/

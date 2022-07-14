FROM ubuntu:22.04

# basic dependencies -
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install --no-install-recommends -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get install --no-install-recommends -y curl=7.81.0 pkg-config=0.29.2 findutils=4.8.0 wget=1.21.2 && \
    apt-get remove -y llvm-12 clang-format-11 clang-tidy-11

# build dependencies
RUN apt-get install --no-install-recommends -y clang-13=13.0.1 cmake=3.22.1 clang-format-13=13.0.1 clang-tidy-13=13.0.1  \
                    llvm-13=13.0.1 lldb-13=13.0.1 llvm-13-dev=13.0.1 llvm-13-runtime=13.0.1 opt=13.0.1  \
                    nodejs=12.22.9 npm=8.5.1  \
                    python3=3.10.4 python3-pip=3.10.4 && \
    npm install -g prettier@2.2.1 && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 0

COPY ./requirements.txt /src/
COPY ./manage /src/
WORKDIR /src
RUN pip install --no-cache-dir -r requirements.txt && \
      chmod +x manage

# running the build
ENV CC=clang-13 \
  CXX=clang++-13 \
  PYTHONUNBUFFERED=1 \
  PYTHON_BIN_PATH=/usr/bin/python3

WORKDIR /src/

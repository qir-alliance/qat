FROM debian:stable-slim as builder

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install --no-install-recommends -y && \
    apt-get install --no-install-recommends -y clang unzip zip python3 && \
    apt-get install --no-install-recommends -y openjdk-11-jdk wget && \
    apt-get clean && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/bazelbuild/bazel/releases/download/5.2.0/bazel-5.2.0-installer-linux-x86_64.sh && \
    chmod +x bazel-5.2.0-installer-linux-x86_64.sh && \
    ./bazel-5.2.0-installer-linux-x86_64.sh

COPY ./ /src/
WORKDIR /src/
RUN bazel build --config generic_clang --config release //qir/qat:qat && \
    cp bazel-bin/qir/qat/qat ./ 


FROM debian:stable-slim
RUN mkdir -p /bin
COPY --from=builder /src/qat /bin/qat



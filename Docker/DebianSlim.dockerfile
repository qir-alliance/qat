FROM debian:stable-slim as builder

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install --no-install-recommends -y && \
    apt-get install --no-install-recommends -y \
        clang=1:11.0* \
        unzip=6.0* \
        zip=3.0* \
        python3=3.9.2* \
        openjdk-11-jdk=11.0.15* \
        npm=7.5.2* && \
    apt-get clean && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g @bazel/bazelisk@1.12.0

COPY ./ /src/
WORKDIR /src/
RUN bazelisk build --config clang --config release //qir/qat:qat && \
    cp bazel-bin/qir/qat/qat ./ 


FROM debian:stable-slim
RUN mkdir -p /bin
COPY --from=builder /src/qat /bin/qat


# To build this docker file: docker build -f Docker/DebianSlim.dockerfile -t qat-debian:latest .
# To run qat afterwards: docker run -it qat-debian:latest /bin/qat
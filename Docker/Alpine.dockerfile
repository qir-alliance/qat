FROM alpine:edge AS builder

ENV PATH=/usr/local/bin:$PATH

# Install system build dependencies
ENV PATH=/usr/local/bin:$PATH
RUN apk add --no-cache git build-base linux-headers zlib-dev && \
    apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing bazel && \
    apk add clang python3 && \
    ln -s /usr/bin/python3 /usr/bin/python

COPY ./ /src/
WORKDIR /src/
RUN bazel build --config generic_clang --config release //qir/qat:qat && \
    cp bazel-bin/qir/qat/qat ./ && \
    tar cf qat.tar qat && \
    gzip qat.tar


FROM mcr.microsoft.com/cbl-mariner/base/core:1.0 as builder

RUN  yum install bazel clang

COPY ./ /src/
WORKDIR /src/
RUN bazel build --config generic_clang --config release //qir/qat:qat && \
    cp bazel-bin/qir/qat/qat ./ && \
    tar cf qat.tar qat && \
    gzip qat.tar


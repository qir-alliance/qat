##########################
# Generator
##########################
FROM ubuntu:20.04 as generator

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install --no-install-recommends -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get install --no-install-recommends -y curl=7.68.0 pkg-config=0.29.1 findutils=4.7.0 wget=1.20.3  \
    unzip=6.0 doxygen=1.8.17

RUN wget -q https://github.com/matusnovak/doxybook2/releases/download/v1.3.6/doxybook2-linux-amd64-v1.3.6.zip && \
    unzip doxybook2-linux-amd64-v1.3.6.zip

COPY qir/qat/ /build/qir/qat/
COPY doxygen.cfg /build/
COPY docs/ /build/docs/

WORKDIR /build/
RUN doxygen doxygen.cfg && \
   doxybook2 --input Doxygen/xml --config docs/.doxybook/config.json --output docs/src/ && \
   rm -rf docs/src/Namespaces/namespace_0d* 

##########################
# Builder
##########################
FROM node:alpine as builder

RUN mkdir /src/
COPY --from=generator /build/docs/ /docs/

WORKDIR /docs/
RUN yarn install && yarn build


##########################
# Documentation
##########################
FROM nginx:1.23.0 as documentation
COPY docs/nginx/default.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /docs/src/.vuepress/dist/ /usr/share/nginx/html

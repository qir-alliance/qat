FROM python:2.7 as builder

COPY ./ /src/
WORKDIR /src/

RUN pip install mkdocs
RUN pip install mkdocs-gitbook
RUN mkdocs build

FROM nginx:latest as documentation
ADD nginx/default.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /src/site /usr/share/nginx/html
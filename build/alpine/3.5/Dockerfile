FROM docker.io/alpine:3.5
MAINTAINER 杨圆建 <624508914@qq.com>

RUN apk add --no-cache \
    bash \
    zip

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

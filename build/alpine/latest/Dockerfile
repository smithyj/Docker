FROM docker.io/alpine:latest
MAINTAINER 杨圆建 <624508914@qq.com>

RUN apk add --no-cache \
    bash \
    zip

COPY docker-entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

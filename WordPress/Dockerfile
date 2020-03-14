FROM alpine:latest
RUN apk update; apk add php7 openrc  php7-fpm php7-opcache
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl
COPY script.sh /tmp/script.sh


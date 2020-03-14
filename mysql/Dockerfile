FROM alpine:latest
RUN apk add mariadb mariadb-client openrc
COPY script.sh /tmp/
RUN sh /tmp/script.sh

EXPOSE 3306

FROM alpine:latest
RUN apk update; apk add nginx openrc
COPY . /tmp/

EXPOSE 80
EXPOSE 22
EXPOSE 443


RUN sh /tmp/script.sh

CMD ["nginx", "-g", "daemon off;"]

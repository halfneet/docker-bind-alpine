FROM alpine:3.6

RUN apk add bind --no-cache

EXPOSE 53/udp 53/tcp

COPY ./config/named.conf /etc/bind/named.conf
COPY ./config/*.zone /etc/bind/

USER root

CMD ["/usr/sbin/named", "-c", "/etc/bind/config/named.conf", "-u", "named", "-g"]
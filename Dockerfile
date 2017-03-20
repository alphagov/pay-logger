FROM alpine:3.5

RUN echo "http://nl.alpinelinux.org/alpine/v3.4/main/" >> /etc/apk/repositories;

RUN apk update
RUN apk upgrade

RUN apk add syslog-ng=3.7.2-r2

ADD ./syslog-ng.conf /etc/syslog-ng/syslog-ng.conf

EXPOSE 5514:5514/udp

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F", "-f", "/etc/syslog-ng/syslog-ng.conf"]

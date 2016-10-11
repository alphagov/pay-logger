FROM alpine:3.4

RUN echo "http://nl.alpinelinux.org/alpine/v3.4/main/" >> /etc/apk/repositories;
RUN apk update && apk add syslog-ng=3.7.2-r0
ADD ./syslog-ng.conf /etc/syslog-ng/syslog-ng.conf

EXPOSE 5514:5514/udp

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F", "-f", "/etc/syslog-ng/syslog-ng.conf"]

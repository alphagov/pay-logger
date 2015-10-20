FROM ubuntu:15.04

ENV ELASTICSEARCH_HOST localhost # please override

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y upgrade && apt-get install -y syslog-ng-mod-elasticsearch syslog-ng-mod-json && apt-get -y autoclean

# AWS ES needs https
RUN sed -i 's/http:/https:/' /usr/share/syslog-ng/include/scl/elasticsearch/es-bridge
# We will use daily indices
RUN sed -i 's/`index`/`index`-$(date +%F)/' /usr/share/syslog-ng/include/scl/elasticsearch/plugin.conf

COPY syslog-ng.conf /etc/syslog-ng/
COPY run-syslog-ng.sh /

RUN chmod +x /run-syslog-ng.sh

EXPOSE 5514:5514
EXPOSE 5514:5514/udp

ENTRYPOINT ["/run-syslog-ng.sh"]

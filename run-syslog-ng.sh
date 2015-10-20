#!/bin/bash
env
cat /etc/syslog-ng/syslog-ng.conf
sed -i "s/ELASTICSEARCH_HOST/${ELASTICSEARCH_HOST}/" /etc/syslog-ng/syslog-ng.conf
cat /etc/syslog-ng/syslog-ng.conf
syslog-ng --no-caps -Fdv

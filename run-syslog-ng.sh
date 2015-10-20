#!/bin/bash

# Update syslog config with env from docker run
sed -i "s/ELASTICSEARCH_HOST/${ELASTICSEARCH_HOST}/" /etc/syslog-ng/syslog-ng.conf
sed -i "s/ELASTICSEARCH_INDEX/${ELASTICSEARCH_INDEX}/" /etc/syslog-ng/syslog-ng.conf

# show the config for debugging purposes
cat /etc/syslog-ng/syslog-ng.conf

syslog-ng --no-caps -Fdv

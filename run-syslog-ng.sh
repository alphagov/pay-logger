#!/bin/bash

# exit if we do not have an ES destination
if [ -z "$ELASTICSEARCH_HOST" -o -z "$ELASTICSEARCH_INDEX" ]; then
    echo "please define ELASTICSEARCH_HOST and ELASTICSEARCH_INDEX"
    exit 1
fi

# Update syslog config with env from docker run
sed -i "s/ELASTICSEARCH_HOST/${ELASTICSEARCH_HOST}/" /etc/syslog-ng/syslog-ng.conf
sed -i "s/ELASTICSEARCH_INDEX/${ELASTICSEARCH_INDEX}/" /etc/syslog-ng/syslog-ng.conf

# show the config for debugging purposes
cat /etc/syslog-ng/syslog-ng.conf

syslog-ng --no-caps -F

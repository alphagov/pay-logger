# pay-logger

I AM A BADGER

A simple syslog to AWS ES log forwarder.

Runs on a docker host and listens for Syslog on port 5514/tcp.

Uses the ELASTICSEARCH_HOST and ELASTICSEARCH_INDEX env variable and forwards any received syslog logs to this host.

Designed to be used with the docker syslog logging driver.

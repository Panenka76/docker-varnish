#!/usr/bin/env bash

if [ -n "${CONFIG_FILE+1}" ] && [ -f $CONFIG_FILE ]; then
	CONFIG=$CONFIG_FILE
else
	CONFIG=/etc/varnish/default.vcl
fi

COMMAND="varnishd -F -f $CONFIG -s malloc,${VARNISH_MEMORY} -a 0.0.0.0:${VARNISH_PORT} -p http_req_hdr_len=16384 -p http_resp_hdr_len=16384 ${VARNISH_DAEMON_OPTS}"
echo "Starting varnish with options: $COMMAND"

if [ -n "${ENABLE_LOGGING+1}" ] && [ "${ENABLE_LOGGING,,}" = "true" ] ; then
    echo "start logging with options $LOGGING_OPTS"
	eval "varnishncsa ${LOGGING_OPTS}" &
fi

exec $COMMAND

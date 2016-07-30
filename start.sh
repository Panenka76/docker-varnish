#!/usr/bin/env bash

if [ -n "${CONFIG_FILE+1}" ] && [ -f $CONFIG_FILE ]; then
	cp $CONFIG_FILE /etc/varnish/default.vcl
fi

exec start-varnishd
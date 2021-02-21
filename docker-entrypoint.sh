#~/bin/sh

EXTRA_FLAGS=""

if $IP_V4; then
	EXTRA_FLAGS="${EXTRA_FLAGS} -4 "
fi
if $HTTP_1; then
	EXTRA_FLAGS="${EXTRA_FLAGS} -x "
fi
if [ ! -z "$PROXY_SERVER" ]; then
	EXTRA_FLAGS="${EXTRA_FLAGS} -t ${PROXY_SERVER} "
fi
if [ ! -z "$DSCP_CODEPOINT" ]; then
	EXTRA_FLAGS="${EXTRA_FLAGS} -c ${DSCP_CODEPOINT} "
fi
if [ ! -z "$LOG_VERBOSITY" ]; then
	EXTRA_FLAGS="${EXTRA_FLAGS} -${LOG_VERBOSITY} "
fi
if [ ! -z "$POLLING_INTERVAL" ]; then
        EXTRA_FLAGS="${EXTRA_FLAGS} -i ${POLLING INTERVAL} "
fi

exec ./https_dns_proxy -u proxy -g proxy -b $DNS_SERVERS -r $RESOLVER_URL -a 0.0.0.0 $EXTRA_FLAGS

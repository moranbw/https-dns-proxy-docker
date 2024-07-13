#!/bin/sh

EXTRA_FLAGS=""

for ARG in "$@"
do
	if [ "$ARG" == "-4" ]; then
		EXTRA_FLAGS="${EXTRA_FLAGS} ${ARG} "
	elif [ "$ARG" == "-x" ]; then
		EXTRA_FLAGS="${EXTRA_FLAGS} ${ARG} "
	elif [ "$ARG" == "-v" ] || [ "$ARG" == "-vv" ] || [ "$ARG" == "-vvv" ]; then
		EXTRA_FLAGS="${EXTRA_FLAGS} ${ARG} "
	else
		echo "Invalid argument ${ARG}, exiting."
		exit 127
	fi
done

if [ ! -z "$PROXY_SERVER" ]; then
	EXTRA_FLAGS="${EXTRA_FLAGS} -t ${PROXY_SERVER} "
fi
if [ ! -z "$DSCP_CODEPOINT" ]; then
	EXTRA_FLAGS="${EXTRA_FLAGS} -c ${DSCP_CODEPOINT} "
fi
if [ ! -z "$POLLING_INTERVAL" ]; then
	EXTRA_FLAGS="${EXTRA_FLAGS} -i ${POLLING INTERVAL} "
fi

exec /bin/https_dns_proxy -b $DNS_SERVERS -r $RESOLVER_URL -a 0.0.0.0 $EXTRA_FLAGS
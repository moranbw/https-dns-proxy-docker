FROM alpine:latest

RUN apk add --no-cache \
        c-ares-dev curl-dev libev-dev openssl-dev \
        git build-base cmake \
        && \ 
	addgroup -S proxy && adduser -S proxy -G proxy \
	&& \
	mkdir /https_dns_proxy \
	&& \
	chown proxy:proxy /https_dns_proxy \
	&& \
	git clone https://github.com/aarond10/https_dns_proxy.git \
	&& \
	cd /https_dns_proxy \
	&& cmake . && make

USER proxy

WORKDIR /https_dns_proxy

ENV DNS_SERVERS="1.1.1.1,1.0.0.1"
ENV RESOLVER_URL="https://cloudflare-dns.com/dns-query"
ENV EXTRA_FLAGS=""

ENTRYPOINT ./https_dns_proxy -u proxy -g proxy -b $DNS_SERVERS -r $RESOLVER_URL -a 0.0.0.0 $EXTRA_FLAGS

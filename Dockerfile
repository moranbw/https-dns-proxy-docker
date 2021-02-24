FROM alpine:latest

COPY docker-entrypoint.sh .

RUN apk add --no-cache \
	c-ares-dev curl-dev libev-dev openssl-dev \
	git build-base cmake \
	tini \
	&& \ 
	addgroup -S proxy && adduser -S proxy -G proxy \
	&& \
	git clone https://github.com/aarond10/https_dns_proxy.git \
	&& \
	mv docker-entrypoint.sh /https_dns_proxy/ \
	&& \
	cd /https_dns_proxy \
	&& \
	cmake . && make \
	&& \
	ln -s /https_dns_proxy/https_dns_proxy /usr/local/bin/https_dns_proxy

USER proxy

WORKDIR /https_dns_proxy

ENV DNS_SERVERS="1.1.1.1,1.0.0.1"
ENV RESOLVER_URL="https://cloudflare-dns.com/dns-query"

EXPOSE 5053

ENTRYPOINT ["/sbin/tini", "--", "./docker-entrypoint.sh"]
FROM alpine:latest

COPY docker-entrypoint.sh .

RUN apk add --no-cache \
	c-ares-dev curl-dev libev-dev openssl-dev \
	git build-base cmake \
	&& \ 
	addgroup -S proxy && adduser -S proxy -G proxy \
	&& \
	git clone https://github.com/aarond10/https_dns_proxy.git \
	&& \
	mv docker-entrypoint.sh /https_dns_proxy/ \
	&& \
	cd /https_dns_proxy \
	&& \
	mkdir log \
	&& \
	cmake . && make \
	&& \
	chown -R proxy:proxy /https_dns_proxy

USER proxy

WORKDIR /https_dns_proxy

ENV DNS_SERVERS="1.1.1.1,1.0.0.1"
ENV RESOLVER_URL="https://cloudflare-dns.com/dns-query"

ENTRYPOINT ["./docker-entrypoint.sh"]

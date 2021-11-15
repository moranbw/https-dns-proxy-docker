# syntax=docker/dockerfile:1
FROM alpine:latest

ENV DNS_SERVERS="1.1.1.1,1.0.0.1"
ENV RESOLVER_URL="https://cloudflare-dns.com/dns-query"

EXPOSE 5053

COPY docker-entrypoint.sh /

ENTRYPOINT ["/sbin/tini", "--", "/docker-entrypoint.sh"]

RUN apk add --no-cache \
      tini c-ares curl libev openssl \
      # temporal build dependencies
      c-ares-dev curl-dev libev-dev openssl-dev \
      git build-base cmake && \
    git clone https://github.com/aarond10/https_dns_proxy.git && \
    cd /https_dns_proxy && \
    cmake . && \
    make && \
    mv https_dns_proxy /bin && \
    cd / && \
    rm -rf /https_dns_proxy && \
    apk del \
      c-ares-dev curl-dev libev-dev openssl-dev \
      git build-base cmake

USER nobody

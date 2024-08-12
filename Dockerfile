FROM alpine:latest AS build

ENV DNS_SERVERS="1.1.1.1,1.0.0.1"
ENV RESOLVER_URL="https://cloudflare-dns.com/dns-query"

RUN apk add --no-cache \
      c-ares-dev curl-dev libev-dev openssl-dev git build-base cmake && \
    git clone https://github.com/aarond10/https_dns_proxy.git && \
    cd /https_dns_proxy && \
    cmake -D CMAKE_BUILD_TYPE=Release . && \
    make

FROM alpine:latest AS runner

RUN apk add --no-cache \
      tini c-ares curl libev

COPY --from=build /https_dns_proxy/https_dns_proxy /bin/https_dns_proxy
COPY docker-entrypoint.sh /

USER nobody

EXPOSE 5053

ENTRYPOINT ["/sbin/tini", "--", "/docker-entrypoint.sh"]
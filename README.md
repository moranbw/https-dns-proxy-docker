# https-dns-proxy <img alt="Docker Pulls" align="right" src="https://img.shields.io/docker/pulls/bwmoran/https-dns-proxy?style=flat-square">
Simple container image for aarond10's https-dns-proxy library.

https://github.com/aarond10/https_dns_proxy

instructions
---
**simple run**
```
docker run --name "https-dns-proxy" -p 5053:5053/udp -d bwmoran/https-dns-proxy
```

**environment variables**
* DNS_SERVERS
   * (default value: "1.1.1.1,1.0.0.1")
* RESOLVER_URL
   * (default value: "https://cloudflare-dns.com/dns-query")
* EXTRA_FLAGS
   * (default value: "")

**custom run**
```
docker run --name "https-dns-proxy" -p 5053:5053/udp  \
  -e DNS_SERVERS="94.140.14.14,94.140.15.15" \
  -e RESOLVER_URL="https://dns.adguard.com/dns-query" \
  -e EXTRA_ARGS="-4 -vvv" \
  -d bwmoran/https-dns-proxy
```
   * points towards AdGuard DNS, only use IPv4, increase logging

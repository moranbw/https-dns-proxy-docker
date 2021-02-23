# https-dns-proxy <a href="https://hub.docker.com/r/bwmoran/https-dns-proxy"><img alt="Docker Pulls" align="right" src="https://img.shields.io/docker/pulls/bwmoran/https-dns-proxy?style=flat-square"></a>
Simple container image for aarond10's https-dns-proxy library.

https://github.com/aarond10/https_dns_proxy

instructions
---
**simple run**
```
docker run --name "https-dns-proxy" -p 5053:5053/udp -d bwmoran/https-dns-proxy
```

**environment variables**
```
DNS_SERVERS
   (default value: "1.1.1.1,1.0.0.1")
   -b flag from https_dns_proxy

DSCP_CODEPOINT
   (default value: unused)
   -c flag from https_dns_proxy

HTTP_1
   (true/false, default value: false)
   -x flag from https_dns_proxy
   
IP_V4
   (true/false, default value: false)
   -4 flag from https_dns_proxy

LOG_VERBOSITY
   (default value: unused)
   -v flag from https_dns_proxy

POLLING_INTERVAL
   (default value: 120)
   -i flag from https_dns_proxy
   
PROXY_SERVER
   (default value: unused)
   -t flag from https_dns_proxy

RESOLVER_URL
   (default value: "https://cloudflare-dns.com/dns-query")
   -r flag from https_dns_proxy
```
**custom run**
```
### points towards AdGuard DNS, only use IPv4, increase logging ###

docker run --name "https-dns-proxy" -p 5053:5053/udp  \
  -e DNS_SERVERS="94.140.14.14,94.140.15.15" \
  -e RESOLVER_URL="https://dns.adguard.com/dns-query" \
  -e IP_V4=true \
  -e LOG_VERBOSITY="vvv" \
  -d bwmoran/https-dns-proxy
```
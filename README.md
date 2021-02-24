# https-dns-proxy <a href="https://hub.docker.com/r/bwmoran/https-dns-proxy"><img alt="Docker Pulls" align="right" src="https://img.shields.io/docker/pulls/bwmoran/https-dns-proxy?style=flat-square"></a>
Simple container image for aarond10's https-dns-proxy library.

https://github.com/aarond10/https_dns_proxy

instructions
---
**simple run**
```
docker run --name "https-dns-proxy" -p 5053:5053/udp -d bwmoran/https-dns-proxy
```

**flags passed as environment variables**
```
   DNS_SERVERS       Comma-separated IPv4/v6 addresses and ports (addr:port)
                     of DNS servers to resolve resolver host (e.g. dns.google).
                     When specifying a port for IPv6, enclose the address in [].
                     (default value: "1.1.1.1,1.0.0.1")
                     
                     -b flag from https_dns_proxy

   DSCP_CODEPOINT    Optional DSCP codepoint[0-63] to set on upstream DNS server
                     connections.
                     (default value: unused)

                     -c flag from https_dns_proxy

   POLLING_INTERVAL  Optional polling interval of DNS servers.
                     (Default: 120, Min: 5, Max: 3600)

                     -i flag from https_dns_proxy
   
   PROXY_SERVER      Optional HTTP proxy. e.g. socks5://127.0.0.1:1080
                     Remote name resolution will be used if the protocol
                     supports it (http, https, socks4a, socks5h), otherwise
                     initial DNS resolution will still be done via the
                     bootstrap DNS servers.  
                     (default value: unused)

                     -t flag from https_dns_proxy

   RESOLVER_URL      The HTTPS path to the resolver URL.
                     (default value: "https://cloudflare-dns.com/dns-query")

                     -r flag from https_dns_proxy
```

**flags passed as CMD arguments**
```
   -4                   Force IPv4 hostnames for DNS resolvers non IPv6 networks.

   -x                   Use HTTP/1.1 instead of HTTP/2. Useful with broken
                        or limited builds of libcurl. (false)
                        
   -v                   Increase logging verbosity. (INFO)
```
**custom run**
```
### points towards AdGuard DNS, only use IPv4, increase logging ###

docker run --name "https-dns-proxy" -p 5053:5053/udp  \
  -e DNS_SERVERS="94.140.14.14,94.140.15.15" \
  -e RESOLVER_URL="https://dns.adguard.com/dns-query" \
  -d bwmoran/https-dns-proxy \
  -4 -vvv
```
#!/bin/sh
iptables -t nat -N SHADOWSOCKS

# ss-server的访问放行
iptables -t nat -A SHADOWSOCKS -d 167.179.102.79 -j RETURN
# 局域网放行
iptables -t nat -A SHADOWSOCKS -d 10.0.0.0/8,192.168.0.0/16 -j RETURN
# k8s内网网段放行
iptables -t nat -A SHADOWSOCKS -d 172.24.0.0/16,172.25.0.0/20 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 172.18.0.0/16,172.19.0.0/20 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 172.20.0.0/16,172.21.0.0/20 -j RETURN
# 其他所有访问都走代理
iptables -t nat -A SHADOWSOCKS -p tcp -d 0.0.0.0/0 -j REDIRECT --to-ports 1080

iptables -t nat -A OUTPUT -p tcp -j SHADOWSOCKS

# start ss-redir
ss-redir -v -c /etc/ss.conf

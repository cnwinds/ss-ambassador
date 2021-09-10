#!/bin/sh
iptables -t nat -N SHADOWSOCKS

# ss-server的访问放行
iptables -t nat -A SHADOWSOCKS -p tcp -d 167.179.102.79 --dport 62420 -j RETURN
# 其他所有访问都走代理
iptables -t nat -A SHADOWSOCKS -p tcp -d 0.0.0.0/0 -j REDIRECT --to-ports 1080

# start ss-redir
ss-redir -v -c /etc/ss.conf

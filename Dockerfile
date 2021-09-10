FROM ubuntu:latest
RUN apt update && apt install -y shadowsocks-libev
RUN apt-get install -y inetutils-ping curl dnsutils
RUN apt-get install -y iptables 
ADD start.sh /root
ADD ./ss.conf /etc/ss.conf
USER root
CMD /root/start.sh

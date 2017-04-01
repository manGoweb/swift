FROM ubuntu:14.04

MAINTAINER manGoweb.cz (rafaj@mangoweb.cz)

LABEL Description="Ubuntu 14.04 image + Swift + Java & Ruby & Python"

RUN sed -i 's/^.*PASS_MAX_DAYS.*$/PASS_MAX_DAYS\t90/' /etc/login.defs && \
  sed -i 's/^.*PASS_MIN_DAYS.*$/PASS_MIN_DAYS\t1/' /etc/login.defs && \
  sed -i 's/^.*PASS_MIN_LEN.*$/PASS_MIN_LEN\t#=\ 8/' /etc/login.defs && \
  sed -i 's/sha512/sha512 minlen=8/' /etc/pam.d/common-password && \
  touch /var/run/utmp /var/log/{btmp,lastlog,wtmp} && \
  chgrp -v utmp /var/run/utmp /var/log/lastlog && \
  chmod -v 664 /var/run/utmp /var/log/lastlog && \
  touch /etc/security/opasswd && \
  chown root:root /etc/security/opasswd && \
  chmod 600 /etc/security/opasswd && \
  grep -q '^net.ipv4.tcp_syncookies' /etc/sysctl.conf && sed -i 's/^net.ipv4.tcp_syncookies.*/net.ipv4.tcp_syncookies = 1/' /etc/sysctl.conf || echo 'net.ipv4.tcp_syncookies = 1' >> /etc/sysctl.conf && \
  grep -q '^net.ipv4.ip_forward' /etc/sysctl.conf && sed -i 's/^net.ipv4.ip_forward.*/net.ipv4.ip_forward = 0/' /etc/sysctl.conf || echo 'net.ipv4.ip_forward = 0' >> /etc/sysctl.conf && \
  grep -q '^net.ipv4.icmp_echo_ignore_broadcasts' /etc/sysctl.conf && sed -i 's/^net.ipv4.icmp_echo_ignore_broadcasts.*/net.ipv4.icmp_echo_ignore_broadcasts = 1/' /etc/sysctl.conf || echo 'net.ipv4.icmp_echo_ignore_broadcasts = 1' >> /etc/sysctl.conf
  

USER root

#RUN apt-get dist-upgrade -y
RUN apt-get -qq update
RUN apt-get -y update
  
#RUN apt-get -y install libicu-dev
#RUN apt-get -y install libcurl4-openssl-dev
#RUN apt-get -y install wget
RUN apt-get -y install openssl
RUN apt-get -y install curl
#RUN apt-get -y install default-jre default-jdk
#RUN apt-get -y install ruby-full
RUN apt-get -y install unzip
RUN apt-get -y install python libpython2.7 

RUN curl -sL swift.vapor.sh/ubuntu | bash

RUN curl -sL check.vapor.sh | bash
RUN curl -sL toolbox.vapor.sh | bash
RUN vapor self update

CMD /bin/bash
FROM swiftdocker/swift:3.1

MAINTAINER manGoweb.cz (rafaj@mangoweb.cz)
LABEL Description="Ubuntu 16.04 image + Swift + Java & Ruby & Python"


USER root

RUN apt-get -y update
RUN apt-get -y install apt-utils
  
RUN apt-get -y install libcurl4-openssl-dev openssl
RUN apt-get -y install wget curl
RUN apt-get -y install default-jre default-jdk
RUN apt-get -y install ruby-full
RUN apt-get -y install unzip git
RUN apt-get -y install libpq-dev
RUN apt-get -y install libxml2-dev

RUN curl -sL check.vapor.sh | bash
RUN curl -sL toolbox.vapor.sh | bash

CMD /bin/bash
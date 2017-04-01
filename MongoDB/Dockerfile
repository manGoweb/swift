FROM mangoweb/swift:latest

MAINTAINER manGoweb.cz (rafaj@mangoweb.cz)

LABEL Description="Ubuntu 14.04 image + manGoSwift + MongoDB"

USER root

RUN apt-get -y install unzip

# Install MongoBD
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/ubuntu $(cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d= -f2)/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
RUN apt-get -y update && apt-get install -y mongodb-org
CMD mkdir /data/db
VOLUME /data/db


CMD /bin/bash
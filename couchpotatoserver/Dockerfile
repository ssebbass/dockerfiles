FROM multiarch/alpine:x86-latest-stable
MAINTAINER sSeBBaSs <https://github.com/ssebbass>

# Install some basic packages
RUN apk update && \
    apk add --update \
    git \
    python \
    py-lxml \
    py-openssl \
    py-pip \
    libffi-dev \
    openssl-dev \
    python-dev \
    sqlite \
    sqlite-dev \
    tzdata \
    build-base

# Set timezone to America/Buenos_Aires
RUN cp -v /usr/share/zoneinfo/America/Buenos_Aires /etc/localtime &&\
  echo "America/Buenos_Aires" >  /etc/timezone

# Install pyopenssl
RUN pip install -U pip &&\
    pip install -U pyopenssl

# Some apk cleaning
RUN apk del \
  tzdata \
  libffi-dev \
  openssl-dev \
  python-dev \
  sqlite-dev \
  build-base &&\
  rm -rf /var/cache/apk/*

# Install CouchPotato Server
RUN mkdir /opt &&\
    cd /opt &&\
    git clone https://github.com/RuudBurger/CouchPotatoServer.git

# Create Service user and set permissions
RUN adduser -h /opt/CouchPotatoServer -s /bin/sh -D -u 1000 couchpotato couchpotato &&\
  chown -R couchpotato:couchpotato /opt/CouchPotatoServer

EXPOSE 5050
VOLUME /opt/CouchPotatoServer
WORKDIR /opt/CouchPotatoServer
USER couchpotato
ADD run.sh /
CMD /run.sh


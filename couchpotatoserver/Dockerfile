FROM multiarch/alpine:x86-latest-stable
MAINTAINER sSeBBaSs <https://github.com/ssebbass>

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
    build-base

RUN pip install -U pip &&\
    pip install -U pyopenssl

# Create Service User & Install CouchPotato Server
RUN mkdir /opt &&\
    cd /opt &&\
    git clone https://github.com/RuudBurger/CouchPotatoServer.git

# Create Service user and set permissions
RUN adduser -h /opt/CouchPotatoServer -s /bin/sh -D -u 1000 couchpotato couchpotato &&\
  chown -R couchpotato:couchpotato /opt/CouchPotatoServer

EXPOSE 5050
VOLUME /opt/CouchPotatoServer
WORKDIR /opt/CouchPotatoServer
ADD run.sh /
CMD /run.sh


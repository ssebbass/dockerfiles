FROM multiarch/alpine:x86-latest-stable

MAINTAINER sSeBBaSs <https://github.com/ssebbass>

RUN apk update && \
    apk upgrade &&\
    apk add --update git python py-pip py-lxml py-openssl && \
    rm -rf /var/cache/apk/*

# Create Service User & Install CouchPotato Server
RUN mkdir -m 755 /opt && \
  cd /opt && \
  git clone https://github.com/RuudBurger/CouchPotatoServer.git &&\
  adduser -h /opt/CouchPotatoServer -g "CouchPotato Server" -s /bin/sh -D -u 1000 couchpotato couchpotato &&\
  mkdir -m 700 /opt/CouchPotatoServer/.couchpotato &&\
  chown -R couchpotato:couchpotato /opt/CouchPotatoServer

# VOLUME /opt/CouchPotatoServer/.couchpotato
EXPOSE 5050
WORKDIR /opt/CouchPotatoServer
ADD run.sh /
CMD /run.sh


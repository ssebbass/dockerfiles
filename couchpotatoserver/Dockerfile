FROM multiarch/alpine:x86-latest-stable
MAINTAINER sSeBBaSs <https://github.com/ssebbass>

RUN apk update && \
    apk upgrade &&\
    apk add --update git python py-lxml py-openssl && \
    rm -rf /var/cache/apk/*

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


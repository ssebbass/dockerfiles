FROM ssebbass/ubuntu32:trusty
MAINTAINER sSeBBaSs <https://github.com/ssebbass>

# Install some basic packages
RUN set -xe ;\
  apt-get update -qy ;\
  apt-get upgrade -qy ;\
  apt-get install -qy\
    git \
    python-openssl \
    python-lxml \
    sqlite \
    python-cheetah \
    ca-certificates ;\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
# Install CouchPotato Server
RUN set -xe ;\
    cd /opt ;\
    git clone https://github.com/RuudBurger/CouchPotatoServer.git

# Create Service user and set permissions
RUN set -xe ;\
  useradd -c plexmediaserver \
    -d /opt/CouchPotatoServer \
    -m \
    -s /bin/sh \
    couchpotato ;\
  chown -R couchpotato:couchpotato /opt/CouchPotatoServer

EXPOSE 5050
VOLUME /opt/CouchPotatoServer
WORKDIR /opt/CouchPotatoServer
USER couchpotato
ADD run.sh /
CMD /run.sh


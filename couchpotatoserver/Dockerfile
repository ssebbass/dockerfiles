FROM ubuntu:trusty
MAINTAINER sSeBBaSs <https://github.com/ssebbass>

# Install some basic packages
RUN set -xe \
  && apt-get update -qy \
  && apt-get install -qy \
    build-essential \
    ca-certificates \
    git \
    libffi-dev \
    libssl-dev \
    python-cheetah \
    python-dev \
    python-lxml \
    python-openssl \
    python-pip \
    sqlite \
  && pip install pyopenssl --upgrade \
  && apt-get purge -qy \
    python-dev \
    build-essential \
    libffi-dev \
    libssl-dev \
  && apt-get autoremove -qy \
  && apt-get clean all \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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

# Locales POSIX to en_US.UTF-8
RUN set -xe ;\
  locale-gen en_US.UTF-8 ;\
  echo 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\nLC_MESSAGES=POSIX' > /etc/default/locale ;\
  update-locale ;\
  locale-gen
ENV LANG=en_US.UTF-8 \
  LANGUAGE=en_US:en \
  LC_CTYPE=en_US.UTF-8 \
  LC_NUMERIC=en_US.UTF-8 \
  LC_TIME=en_US.UTF-8 \
  LC_COLLATE=en_US.UTF-8 \
  LC_MONETARY=en_US.UTF-8 \
  LC_MESSAGES=en_US.UTF-8 \
  LC_PAPER=en_US.UTF-8 \
  LC_NAME=en_US.UTF-8 \
  LC_ADDRESS=en_US.UTF-8 \
  LC_TELEPHONE=en_US.UTF-8 \
  LC_MEASUREMENT=en_US.UTF-8 \
  LC_IDENTIFICATION=en_US.UTF-8 \
  LC_ALL=en_US.UTF-8

EXPOSE 5050
VOLUME /opt/CouchPotatoServer
WORKDIR /opt/CouchPotatoServer
USER couchpotato
ADD run.sh /
CMD /run.sh


FROM ssebbass/ubuntu32:trusty
MAINTAINER sSeBBaSs <https://github.com/ssebbass>

# Install some basic packages
RUN apt-get update -q \
  && apt-get upgrade -qy \
  && apt-get install -qy wget ca-certificates \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set time zone to BA
RUN echo 'America/Argentina/Buenos_Aires' > /etc/timezone && \
  dpkg-reconfigure --frontend noninteractive tzdata

# Get Plex & install
RUN wget -O plex.deb "https://plex.tv/downloads/latest/1?channel=8&build=linux-ubuntu-i686&distro=ubuntu" \
  && dpkg -i plex.deb \
  && apt-get -f install

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

# Service
RUN useradd -c plexmediaserver -m -s /bin/bash plexmediaserver
USER plexmediaserver
WORKDIR /usr/lib/plexmediaserver
EXPOSE 32400
CMD ./start.sh

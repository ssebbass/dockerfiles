FROM multiarch/ubuntu-debootstrap:i386-trusty
MAINTAINER sSeBBaSs <https://github.com/ssebbass>

# Install some basic packages
RUN apt-get update -q \
  && apt-get upgrade -qy \
  && apt-get install -qy wget ca-certificates \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Get Plex & install
RUN wget -O plex.deb "https://plex.tv/downloads/latest/1?channel=8&build=linux-ubuntu-i686&distro=ubuntu" \
  && dpkg -i plex.deb \
  && apt-get -f install

# Service
RUN useradd -c plexmediaserver -m -s /bin/bash plexmediaserver
USER plexmediaserver
WORKDIR /usr/lib/plexmediaserver
EXPOSE 32400
CMD ./start.sh

FROM ubuntu:trusty
MAINTAINER sSeBBaSs <https://github.com/ssebbass>

# Install some basic packages
RUN set -ex \
  apt-get update ;\
  apt-get install -yq software-properties-common ;\
  add-apt-repository -y ppa:openjdk-r/ppa ;\
  apt-get update -qy ;\
  apt-get install -qy openjdk-8-jre-headless wget ;\
  apt-get clean ;\
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Get & install subsonic
RUN set -xe ;\
  mkdir /var/subsonic ;\
  cd /var/subsonic ;\
  wget "https://sourceforge.net/projects/subsonic/files/latest/download?source=files" -O subsonic.tgz ;\
  tar xvzf subsonic.tgz ;\
  useradd -c subsonic -m -s /bin/bash subsonic

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
USER subsonic
EXPOSE 4040
RUN mkdir $HOME/music $HOME/subsonic $HOME/playlists $HOME/podcast
WORKDIR /var/subsonic
CMD set -x ;\
  java -Xmx256m \
  -Dsubsonic.home=/home/subsonic/subsonic \
  -Dsubsonic.host=0.0.0.0 \
  -Dsubsonic.port=4040 \
  -Dsubsonic.httpsPort=0 \
  -Dsubsonic.contextPath=/ \
  -Dsubsonic.defaultMusicFolder=/home/subsonic/music \
  -Dsubsonic.defaultPodcastFolder=/home/subsonic/podcast \
  -Dsubsonic.defaultPlaylistFolder=/home/subsonic/playlists \
  -Djava.awt.headless=true \
  -verbose:gc \
  -jar subsonic-booter-jar-with-dependencies.jar

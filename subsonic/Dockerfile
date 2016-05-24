FROM ssebbass/ubuntu32:trusty
MAINTAINER sSeBBaSs <https://github.com/ssebbass>

# Install some basic packages
RUN set -x \
  && apt-get update -q \
  && apt-get upgrade -qy \
  && apt-get install -qy default-jre-headless wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Get & install subsonic
RUN set -x \
  && mkdir /var/subsonic \
  && cd /var/subsonic \
  && wget "https://sourceforge.net/projects/subsonic/files/latest/download?source=files" -O subsonic.tgz \
  && tar xvzf subsonic.tgz \
  && useradd -c subsonic -m -s /bin/bash subsonic

# Service
USER subsonic
EXPOSE 4040
RUN mkdir $HOME/music $HOME/subsonic $HOME/playlists $HOME/podcast
WORKDIR /var/subsonic
CMD set -x ;\
  java -Xmx150m \
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

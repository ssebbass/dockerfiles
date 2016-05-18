FROM multiarch/ubuntu-debootstrap:i386-xenial
MAINTAINER sSeBBaSs <https://github.com/ssebbass>

# Install some basic packages
RUN apt-get update -q \
  && apt-get upgrade -qy \
  && apt-get install -qy openjdk-8-jre \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Get & install subsonic
RUN mkdir /var/subsonic \
  && cd /var/subsonic \
  && wget "https://sourceforge.net/projects/subsonic/files/latest/download?source=files" -O subsonic.tgz \
  && tar xvzf subsonic.tgz \
  && useradd -c subsonic -m -s /bin/bash subsonic \
  && mkdir $HOME/music $HOME/subsonic $HOME/playlists $HOME/podcast

# Service
USER subsonic
EXPOSE 4040
WORKDIR /var/subsonic
CMD java -Xmx150m \
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

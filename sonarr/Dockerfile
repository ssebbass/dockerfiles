FROM multiarch/ubuntu-debootstrap:i386-trusty
MAINTAINER sSeBBaSs <https://github.com/ssebbass>

# Install some basic packages
RUN sed -i 's/main/main\ universe/g' /etc/apt/sources.list \
  && echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC \
  && echo "deb http://apt.sonarr.tv/ master main" >> /etc/apt/sources.list \
  && apt-get update -q \
  && apt-get upgrade -qy \
  && apt-get install -qy nzbdrone mediainfo \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set time zone to BA
RUN echo 'America/Argentina/Buenos_Aires' > /etc/timezone && \
  dpkg-reconfigure --frontend noninteractive tzdata

RUN useradd -c sonarr -m -s /bin/bash sonarr
USER sonarr
RUN mkdir ~/data
ADD runme.sh /home/sonarr/
EXPOSE 8989
WORKDIR /home/sonarr
CMD ./runme.sh

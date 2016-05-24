FROM ssebbass/ubuntu32:trusty
MAINTAINER sSeBBaSs <https://github.com/ssebbass>

# Install some basic packages
RUN apt-get update -q \
  && apt-get upgrade -qy \
  && apt-get install -qy transmission-daemon \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set time zone to BA
RUN echo 'America/Argentina/Buenos_Aires' > /etc/timezone && \
  dpkg-reconfigure --frontend noninteractive tzdata

# Service
RUN useradd -c transmission -m -s /bin/bash transmission
USER transmission
WORKDIR /home/transmission
EXPOSE 9091
CMD /usr/bin/transmission-daemon -f

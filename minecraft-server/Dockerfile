FROM java:jre

MAINTAINER sSeBBaSs

RUN useradd -M -s /bin/false --uid 1000 minecraft \
  && mkdir /data \
  && chown minecraft:minecraft /data

EXPOSE 25565

COPY minecraft.sh /minecraft.sh

VOLUME ["/srv"]
COPY server.properties /tmp/server.properties
WORKDIR /srv

CMD [ "/minecraft.sh" ]

# Special marker ENV used by MCCY management tool
ENV MC_IMAGE=YES

ENV UID=1000
ENV MOTD A Minecraft Server Powered by Docker
ENV JVM_OPTS -Xmx1024M -Xms1024M
ENV TYPE=VANILLA VERSION=LATEST FORGEVERSION=RECOMMENDED LEVEL=world PVP=true DIFFICULTY=easy \
  LEVEL_TYPE=DEFAULT GENERATOR_SETTINGS=

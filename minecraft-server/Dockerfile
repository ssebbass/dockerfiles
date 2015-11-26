FROM java:jre

MAINTAINER sSeBBaSs

RUN wget -O /usr/bin/jsawk https://github.com/micha/jsawk/raw/master/jsawk
RUN chmod +x /usr/bin/jsawk
RUN useradd -M -s /bin/false --uid 1000 minecraft \
  && mkdir /data \
  && chown minecraft:minecraft /data

EXPOSE 25565

COPY start.sh /start
COPY start-minecraft.sh /start-minecraft

VOLUME ["/data"]
COPY server.properties /tmp/server.properties
WORKDIR /data

CMD [ "/start" ]

# Special marker ENV used by MCCY management tool
ENV MC_IMAGE=YES

ENV UID=1000
ENV MOTD A Minecraft Server Powered by Docker
ENV JVM_OPTS -Xmx1024M -Xms1024M
ENV TYPE=VANILLA VERSION=LATEST FORGEVERSION=RECOMMENDED LEVEL=world PVP=true DIFFICULTY=easy \
  LEVEL_TYPE=DEFAULT GENERATOR_SETTINGS=

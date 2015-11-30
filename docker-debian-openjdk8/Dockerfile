# Base debian-stable with backports and openjdk8

FROM debian:stable-backports

MAINTAINER sSeBBaSs

RUN apt update && apt install -y \
  openjdk-8-jre \
  screen \
  wget \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

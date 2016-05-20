FROM ubuntu:trusty

MAINTAINER Sebastian Juarez <ssebbass@gmail.com>

# Service Ports
EXPOSE 43110
EXPOSE 15441

# Install some basic OS pkgs and tor repos
RUN set -x &&\
  echo 'deb http://deb.torproject.org/torproject.org trusty main' >> /etc/apt/sources.list.d/tor.list &&\
  echo 'deb-src http://deb.torproject.org/torproject.org trusty main' >> /etc/apt/sources.list.d/tor.list &&\
  gpg --keyserver keys.gnupg.net --recv 886DDD89 &&\
  gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add - &&\
  apt-get update &&\
  apt-get install -y \
    msgpack-python \
    python-gevent \
    python-pip \
    python-dev \
    git \
    tor \
    deb.torproject.org-keyring &&\
  apt-get clean -y &&\
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set time zone to BA
RUN echo 'America/Argentina/Buenos_Aires' > /etc/timezone && \
  dpkg-reconfigure --frontend noninteractive tzdata

# Get ZeroNet repo
RUN \
  git clone https://github.com/HelloZeroNet/ZeroNet.git &&\
  mkdir /ZeroNet/data

# Set workdir
WORKDIR /ZeroNet

# Install ZeroNet Python reqs
RUN  pip install -U -r requirements.txt

# TOR configuration
RUN \
  sed -i 's/\#ControlPort\ 9051/ControlPort\ 9051/' /etc/tor/torrc &&\
  sed -i 's/\#CookieAuthentication 1/CookieAuthentication\ 1/' /etc/tor/torrc

# Data directory
VOLUME ["/ZeroNet/data"]

# Run Commands
CMD \
  tor 2>&1 &\
  git pull ;\
  python zeronet.py --ui_ip 0.0.0.0


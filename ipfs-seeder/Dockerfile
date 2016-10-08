FROM ubuntu
MAINTAINER sSeBBaSs <https://github.com/ssebbass>

# Install some basic packages
RUN set -xe \
  && apt-get update -q \
  && apt-get install -qy curl dnsutils \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# IPFS
RUN set -xe \
  && VERSION="$(curl -s "https://dist.ipfs.io/go-ipfs/versions" | tail -1)" \
  && curl -O "https://dist.ipfs.io/go-ipfs/${VERSION}/go-ipfs_${VERSION}_linux-amd64.tar.gz" \
  && tar xvzf go-ipfs_${VERSION}_linux-amd64.tar.gz \
  && cd go-ipfs && ./install.sh

RUN useradd -c ipfs -m -s /bin/bash ipfs
USER ipfs
ADD run.sh /
EXPOSE 4001
WORKDIR /home/ipfs
CMD /run.sh

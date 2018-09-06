FROM alpine

RUN set -xe \
  && apk -U --no-cache add curl bash

VOLUME /curlloop

COPY curlloop.sh /curlloop/
CMD ["/curlloop/curlloop.sh"]

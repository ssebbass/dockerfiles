FROM alpine

ENV SLEEP="0.5"

RUN set -xe \
  && apk update \
  && apk add curl

ADD curlloop.sh /
CMD /curlloop.sh


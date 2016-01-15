FROM ruby:2.2.2
MAINTAINER Sebastian Juarez

RUN apt-get update \
        && apt-get install -y --no-install-recommends \
               rsync

RUN gem install nanoc \
                kramdown \
                nokogiri \
                sass \
                adsf
                w3c_validators

RUN useradd nanoc 
RUN mkdir /data
RUN chown nanoc /data
USER nanoc
WORKDIR /data
ENTRYPOINT ["nanoc"]

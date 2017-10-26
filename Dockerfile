FROM node:6.11.5-alpine

MAINTAINER Jarrod

RUN sed -i -e 's/v3\.4/v3\.6/g' /etc/apk/repositories && apk upgrade --update-cache --available ;

RUN apk update \
    && apk add python bash make g++ libressl librdkafka-dev

ADD ./ /src
RUN rm -rf /src/node_modules

# To compile node-rdkafka without SASL
ENV WITH_SASL=0

# Links to librdkafka on host instead of compiling it, letting us use librdkafka-dev —  https://github.com/Blizzard/node-rdkafka/pull/14
ENV BUILD_LIBRDKAFKA=0

ADD package.json /tmp/package.json

RUN cd /tmp && npm install

#!/usr/bin/env bash

set -e
set -E

tag=$1

docker build -t rpi-statsd .

docker tag -f rpi-statsd  wsrak/rpi-statsd:$tag
docker push wsrak/rpi-statsd:$tag

if [ $tag != "dev" ]; then
  docker tag -f rpi-statsd  wsrak/rpi-statsd
  docker push wsrak/rpi-statsd
fi

#!/usr/bin/env bash

tag="dev"
rpi_ip="172.31.255.93"

if [ ! -d app ]; then
    git clone https://github.com/etsy/statsd.git app
fi

cd $(dirname $0)/app
git pull origin master
git checkout $tag

ssh root@$rpi_ip "mkdir -p /opt/docker-statsd/app"

cd ../
rsync -av --delete ./ root@$rpi_ip:/opt/docker-statsd/

#/build-on-rpi.sh && cd /opt/docker-statsd/ && ./build-on-rpi.sh $tag"

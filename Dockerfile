FROM hypriot/rpi-node

RUN mkdir -p /opt/statsd

ADD app /opt/statsd

COPY config.json /opt/statsd/config.json

WORKDIR /opt/statsd

ADD config.json /opt/statsd/config.json

EXPOSE 8125/udp 8126

ENTRYPOINT ["node", "bin/statsd", "/opt/statsd/config.json"]


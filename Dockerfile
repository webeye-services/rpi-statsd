FROM hypriot/rpi-node

RUN mkdir -p /opt/statsd

COPY app/ /opt/statsd

WORKDIR /opt/statsd

ADD config.json /opt/statsd/config.json

EXPOSE 8125/udp 8126

#ENTRYPOINT ["node", "stats.js", "/opt/statsd/config.json"]
CMD ["bash"]
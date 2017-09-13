#
FROM debian:jessie
LABEL maintainer "https://github.com/muccg"

RUN apt-get update && apt-get install -y --no-install-recommends \
  bind9 \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

VOLUME ["/data"]

EXPOSE 53/udp

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bind"]

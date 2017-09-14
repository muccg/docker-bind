#
FROM debian:stretch-slim
LABEL maintainer "https://github.com/muccg"

RUN addgroup --gid 1000 bind \
    && adduser --disabled-password --home /data --no-create-home --system -q --uid 1000 --ingroup bind bind \
    && mkdir /data \
    && chown bind:bind /data

RUN apt-get update && apt-get install -y --no-install-recommends \
  bind9 \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

VOLUME ["/data"]

EXPOSE 53/udp

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bind"]

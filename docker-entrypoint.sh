#!/bin/bash

# bind entrypoint
if [ "$1" = 'bind' ]; then
    exec /usr/sbin/named -u bind -g -t /data
fi

exec "$@"

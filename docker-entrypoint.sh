#!/bin/bash

# bind entrypoint
if [ "$1" = 'bind' ]; then
    exec /usr/sbin/named -u ccg-user -g -t /data
fi

exec "$@"

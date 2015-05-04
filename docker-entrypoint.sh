#!/bin/bash

# bind entrypoint
if [ "$1" = 'bind' ]; then
    /usr/sbin/named -u ccg-user -g -t /data
    exit $?
fi

exec "$@"

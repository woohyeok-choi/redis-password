#!/bin/sh

SECRETS_FILE="/run/secrets/${SECRETS}"

if [ -f ${SECRETS_FILE} ]; then
    REDIS_PASSWORD=$(crudini --get ${SECRETS_FILE} redis password)
fi

if [ -n ${REDIS_PASSWORD} ]; then
cat<<EOF >> /etc/redis/conf.d/redis-server.conf
requirepass ${REDIS_PASSWORD}
logfile /var/log/redis/redis.log
EOF
fi

cat<<EOF >> /etc/redis/conf.d/redis-server.conf
tcp-backlog $(cat /proc/sys/net/core/somaxconn)
EOF

redis-server /etc/redis/conf.d/redis-server.conf

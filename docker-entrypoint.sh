#!/bin/sh

SECRET_FILE="/run/secrets/${SECRET_NAME}"

if [ -z ${INI_SECTION} ]; then
    INI_SECTION=''
fi
if [ -f ${SECRET_FILE} ]; then
    REDIS_PASSWORD=$(crudini --get ${SECRET_FILE} "${INI_SECTION}" password)
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

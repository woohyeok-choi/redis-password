FROM redis:alpine
LABEL MAINTAINER="Woohyeok Choi <woohyeok.choi@kaist.ac.kr>"

RUN apk update \
    && apk add python2 py2-pip \
    && pip2 install --upgrade pip \
    && pip2 install --no-cache-dir crudini

RUN mkdir -p /etc/redis/conf.d \
    && mkdir -p /var/log/redis \
    && mkdir -p /scripts

RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

EXPOSE 6379

COPY ./docker-entrypoint.sh /scripts

VOLUME [ "/var/log/redis" ]

CMD ["/bin/sh", "/scripts/docker-entrypoint.sh"]
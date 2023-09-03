FROM php:8.2-fpm-alpine3.17

RUN apk update && apk add supervisor

COPY supervisord.conf /etc/supervisord.conf
COPY supervisord-entrypoint.sh /etc/supervisord-entrypoint.sh

ENTRYPOINT ["/bin/sh", "/etc/supervisord-entrypoint.sh"]
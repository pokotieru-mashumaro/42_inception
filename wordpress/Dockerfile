FROM debian:buster

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    php-curl \
    php-gd \
    php-intl \
    php-mbstring \
    php-soap \
    php-xml \
    php-xmlrpc \
    php-zip \
    wget \
    mariadb-client \
    vim

RUN mkdir -p /run/php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/setup.sh /tmp/

RUN chmod +x /tmp/setup.sh

# EXPOSE  9000

ENTRYPOINT [ "sh", "/tmp/setup.sh" ]
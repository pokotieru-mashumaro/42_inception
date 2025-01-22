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
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php
RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# COPY ./conf/wp-config.php /var/www/html
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/setup.sh ./

RUN chmod +x /setup.sh

EXPOSE 9000

ENTRYPOINT [ "sh", "/setup.sh" ]
#!/bin/bash

sleep 10

if [ ! -f "/var/www/html/wp-config.php" ]; then
    cd /var/www/html
    
    wp core download --allow-root

    wp config create --dbhost=mariadb:3306 \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --path='/var/www/html' \
        --allow-root

    wp core install --url=$DOMAIN_NAME/ \
        --title=Wordpress \
        --admin_user=$WP_USER \
        --admin_password=$WP_USER_PASSWORD \
        --admin_email=$WP_USER_EMAIL \
        --skip-email --allow-root
    
    wp user create $WP_USER $WP_USER_EMAIL \
        --role=author \
        --user_pass=$WP_USER_PASSWORD \
        --path='/var/www/html' \
        --allow-root
fi

/usr/sbin/php-fpm8.2 -F

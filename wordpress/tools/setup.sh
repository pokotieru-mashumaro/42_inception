#!/bin/bash

# mkdir -p "$WP_PATH"

if [ ! -f /var/www/html/wp-config.php ]; then
   # sed -i "s/^;phar.readonly.*$/phar.readonly = Off/g" /etc/php/7.3/cli/php.ini
   # sed -i "s/^;phar.readonly.*$/phar.readonly = Off/g" /etc/php/7.3/fpm/php.ini

   wp core download --path=$WP_PATH --allow-root

   wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER \
      --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST \
      --path=$WP_PATH --skip-check --allow-root

   wp core install --path=$WP_PATH --url=$DOMAIN_NAME --title="Inception"\
      --admin_user=$WP_SUPERUSER --admin_password=$WP_SUPERUSER_PASSWORD \
      --admin_email=$WP_SUPERUSER_EMAIL --skip-email --allow-root
   
   wp user create $WP_USER $WP_USER_EMAIL --role=author \
      --path=$WP_PATH --user_pass=$WP_USER_PASSWORD --allow-root

fi

/usr/sbin/php-fpm7.3 -F


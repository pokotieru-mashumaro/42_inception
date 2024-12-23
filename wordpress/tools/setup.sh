#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then
   wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
   chmod +x wp-cli.phar
   mv wp-cli.phar /usr/local/bin/wp

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

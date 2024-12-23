#!/bin/bash

# Wait for MariaDB to be ready
while ! mariadb -h$MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE >/dev/null 2>&1; do
    echo "Waiting for MariaDB to be ready..."
    sleep 5
done

if [ ! -f "$WP_PATH/wp-config.php" ]; then
    wp core download --path=$WP_PATH --allow-root
    wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --path=$WP_PATH --skip-check --allow-root
    wp core install --path=$WP_PATH --url=$DOMAIN_NAME --title="WordPress Site" --admin_user=$WP_SUPERUSER --admin_password=$WP_SUPERUSER_PASSWORD --admin_email=$WP_SUPERUSER_EMAIL --skip-email --allow-root
    wp user create $WP_USER $WP_USER_EMAIL --role=author --path=$WP_PATH --user_pass=$WP_USER_PASSWORD --allow-root
fi

exec php-fpm8.2 -F

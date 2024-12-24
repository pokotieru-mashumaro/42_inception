#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then
    # Configure PHP
    sed -i "s/^;phar.readonly.*$/phar.readonly = Off/g" /etc/php/7.3/cli/php.ini
    sed -i "s/^;phar.readonly.*$/phar.readonly = Off/g" /etc/php/7.3/fpm/php.ini

    # Download WordPress
    wp core download --path=$WP_PATH --allow-root

    # Create wp-config.php manually
    cat > $WP_PATH/wp-config.php << EOF
<?php
define( 'DB_NAME', '$MYSQL_DATABASE' );
define( 'DB_USER', '$MYSQL_USER' );
define( 'DB_PASSWORD', '$MYSQL_PASSWORD' );
define( 'DB_HOST', '$MYSQL_HOST' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

define('AUTH_KEY',         '$AUTH_KEY');
define('SECURE_AUTH_KEY',  '$SECURE_AUTH_KEY');
define('LOGGED_IN_KEY',    '$LOGGED_IN_KEY');
define('NONCE_KEY',        '$NONCE_KEY');
define('AUTH_SALT',        '$AUTH_SALT');
define('SECURE_AUTH_SALT', '$SECURE_AUTH_SALT');
define('LOGGED_IN_SALT',   '$LOGGED_IN_SALT');
define('NONCE_SALT',       '$NONCE_SALT');

\$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
EOF

    chown -R www-data:www-data $WP_PATH
    chmod -R 755 $WP_PATH

    wp core install --path=$WP_PATH --url=$DOMAIN_NAME --title="Inception" \
        --admin_user=$WP_SUPERUSER --admin_password=$WP_SUPERUSER_PASSWORD \
        --admin_email=$WP_SUPERUSER_EMAIL --skip-email --allow-root
    
    wp user create $WP_USER $WP_USER_EMAIL --role=author \
        --path=$WP_PATH --user_pass=$WP_USER_PASSWORD --allow-root
fi

/usr/sbin/php-fpm7.3 -F


#!/bin/bash

# データディレクトリのクリーンアップ
rm -rf /var/lib/mysql/*

sed -i 's|MYSQL_DATABASE|'${MYSQL_DATABASE}'|g' /tmp/init.sql
sed -i 's|MYSQL_USER|'${MYSQL_USER}'|g' /tmp/init.sql
sed -i 's|MYSQL_PASSWORD|'${MYSQL_PASSWORD}'|g' /tmp/init.sql
sed -i 's|MYSQL_ROOT_PASSWORD|'${MYSQL_ROOT_PASSWORD}'|g' /tmp/init.sql

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
    mysqld --user=mysql --bootstrap < /tmp/init.sql
fi

exec mysqld --user=mysql

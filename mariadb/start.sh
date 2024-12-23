#!/bin/bash

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    mysqld --user=mysql --bootstrap < /docker-entrypoint-initdb.d/init.sql
fi

exec mysqld --user=mysql

# if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]

# then
#   echo "Database already exists."
#   mysqld_safe

# else
#   mysql_install_db
#   mysqld --init-file="/tmp/init.sql"

# fi

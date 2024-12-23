#!/bin/bash

sed -i 's|MYSQL_DATABASE|'${MYSQL_DATABASE}'|g' /tmp/init.sql
sed -i 's|MYSQL_USER|'${MYSQL_USER}'|g' /tmp/init.sql
sed -i 's|MYSQL_PASSWORD|'${MYSQL_PASSWORD}'|g' /tmp/init.sql
sed -i 's|MYSQL_ROOT_PASSWORD|'${MYSQL_ROOT_PASSWORD}'|g' /tmp/init.sql

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
  mysqld_safe
else
  mysql_install_db
  mysqld --init-file="/tmp/init.sql"
fi

exec "$@"

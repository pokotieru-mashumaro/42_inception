FROM debian:11

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld \
    && mkdir -p /var/lib/mysql \
    && chown -R mysql:mysql /var/lib/mysql

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/init.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/init.sh

EXPOSE 3306

# USER mysql
ENTRYPOINT ["init.sh"]

# mariadb    | Starting MariaDB database server: mariadbd
# mariadb    | .
# mariadb    | ERROR 1130 (HY000): Host 'ead5ed9778ac' is not allowed to connect to this MariaDB server
# mariadb    | ERROR 1130 (HY000): Host 'ead5ed9778ac' is not allowed to connect to this MariaDB server
# mariadb    | ERROR 1130 (HY000): Host 'ead5ed9778ac' is not allowed to connect to this MariaDB server
# mariadb    | ERROR 1130 (HY000): Host 'ead5ed9778ac' is not allowed to connect to this MariaDB server
# mariadb    | ERROR 1130 (HY000): Host 'ead5ed9778ac' is not allowed to connect to this MariaDB server
# mariadb    | 250125 07:00:45 mysqld_safe Logging to syslog.
# mariadb    | 250125 07:00:45 mysqld_safe Starting mariadbd daemon with databases from /var/lib/mysql
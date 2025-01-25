FROM debian:11

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld \
    && mkdir -p /var/lib/mysql \
    && mkdir -p /var/log/mysql \
    && chown -R mysql:mysql /var/run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql \
    && chown -R mysql:mysql /var/log/mysql \
    && chmod 777 /var/run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/init.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/init.sh

EXPOSE 3306

ENTRYPOINT ["init.sh"]
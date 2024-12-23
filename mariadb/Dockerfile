FROM debian:stable-slim

RUN apt-get update && apt-get install -y mariadb-server vim \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
    && mkdir -p /var/lib/mysql \
    && chown -R mysql:mysql /var/run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql

COPY ./init.sql /docker-entrypoint-initdb.d/
COPY ./my.cnf /etc/mysql
COPY ./start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 3306

CMD ["/start.sh"]

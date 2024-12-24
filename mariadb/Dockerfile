FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server mariadb-client vim \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

COPY ./tools/start.sh /tmp/
COPY ./conf/init.sql /tmp/
COPY ./conf/my.cnf /etc/mysql/my.cnf

RUN chmod 644 /etc/mysql/my.cnf && \
    chmod +x /tmp/start.sh && \
    chown -R mysql:mysql /var/lib/mysql /tmp/

EXPOSE 3306

USER mysql

ENTRYPOINT ["/tmp/start.sh"]
FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server mariadb-client vim \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chown -R mysql:mysql /etc/mysql/

COPY ./tools/start.sh /tmp/
COPY ./conf/init.sql /tmp/
COPY ./conf/my.cnf /etc/mysql

RUN chown -R mysql:mysql /tmp/ && \
    chown -R mysql:mysql /etc/mysql

RUN chmod +x /tmp/start.sh

# EXPOSE 3306
USER mysql

ENTRYPOINT ["sh", "/tmp/start.sh"]
FROM debian:11

RUN apt-get update && apt-get install -y mariadb-server mariadb-client vim 

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chown -R mysql:mysql /etc/mysql/ && \
    mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld && \
    mkdir -p /var/log/mysql && \
    chown -R mysql:mysql /var/log/mysql

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/init.sh ./

RUN chmod +x ./init.sh

EXPOSE 3306

ENTRYPOINT ["sh", "./init.sh"]
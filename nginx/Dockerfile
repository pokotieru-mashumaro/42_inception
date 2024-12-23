FROM debian:buster

#nginx imageのdockerfile
#https://github.com/nginxinc/docker-nginx/blob/d21b4f2d90a1abb712a610678872e804267f4815/mainline/debian/Dockerfile

RUN apt-get update && apt-get install -y openssl nginx curl vim sudo
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=JP/ST=Tokyo/L=Oyama/O=42/OU='${MYSQL_USER}'/CN='${DOMAIN_NAME}'" -newkey rsa:2048

RUN mkdir -p /var/www/html
RUN chown -R www-data /var/www/html

COPY ./conf/default.conf /etc/nginx/sites-available/default.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

EXPOSE 443

#https://qiita.com/Syy12345-Unity/items/c887fa0e62822abbd435
CMD ["nginx", "-g", "daemon off;"]
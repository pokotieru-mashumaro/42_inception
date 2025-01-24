FROM debian:11

RUN apt-get update && apt-get install -y openssl nginx curl vim sudo

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=JP/ST=Tokyo/L=Shinjuku/O=42/OU='kkomatsu'/CN=kkomatsu.42.fr'" \
    -newkey rsa:2048

RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

#https://qiita.com/Syy12345-Unity/items/c887fa0e62822abbd435
CMD ["nginx", "-g", "daemon off;"]
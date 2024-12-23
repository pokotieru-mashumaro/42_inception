FROM debian:stable-slim

#nginx imageのdockerfile
#https://github.com/nginxinc/docker-nginx/blob/d21b4f2d90a1abb712a610678872e804267f4815/mainline/debian/Dockerfile

RUN apt-get update && apt-get install -y openssl nginx curl vim sudo
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=JP/ST=Tokyo/L=Oyama/O=42/OU=42/CN=kkomatsu.42.fr/UID=kkomatsu"

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

#https://qiita.com/Syy12345-Unity/items/c887fa0e62822abbd435
CMD ["nginx", "-g", "daemon off;"]
all: up

up: 
	mkdir -p ~/data/html
	mkdir -p ~/data/mariadb
	chmod -R 755 ~/data/html
	chmod -R 755 ~/data/mariadb
	docker compose -f srcs/docker-compose.yml up

build:
	docker compose -f srcs/docker-compose.yml build --no-cache

down:
	docker compose -f srcs/docker-compose.yml down

stop:
	docker compose -f srcs/docker-compose.yml stop

clean:
	docker rmi wordpress mariadb nginx
	rm -rf ~/data/html
	rm -rf ~/data/mariadb
ifeq ($(wildcard ./*/.env),)

else
	include ./.env
	include ./srcs/requirements/mariadb/.env
	include ./srcs/requirements/wordpress/.env
	include ./srcs/requirements/nginx/.env
endif

DOCKER_COMPOSE_YML = ./srcs/docker-compose.yml
MARIADB_PATH = ./srcs/requirements/mariadb
NGINX_PATH = ./srcs/requirements/nginx
WORDPRESS_PATH = ./srcs/requirements/wordpress

all: up

up :
	docker-compose -f $(DOCKER_COMPOSE_YML) up -d

stop :
	docker-compose -f $(DOCKER_COMPOSE_YML) stop

down :
	docker-compose -f $(DOCKER_COMPOSE_YML) down

re : down up

# container stop -> container rm -> image rm -> volume rm -> network rm
clean :

env:
	cp .env.example .env
	cp $(MARIADB_PATH)/.env.example $(MARIADB_PATH)/.env
	cp $(NGINX_PATH)/.env.example $(NGINX_PATH)/.env
	cp $(WORDPRESS_PATH)/.env.example $(WORDPRESS_PATH)/.env

env-clean:
	rm -rf .env
	rm -rf $(MARIADB_PATH)/.env
	rm -rf $(NGINX_PATH)/.env
	rm -rf $(WORDPRESS_PATH)/.env

.PHONY: all up down re clean env env-clean

# docker image build -t mariadb:v42 .
# docker container run -it --name mariadb42  mariadb:v42

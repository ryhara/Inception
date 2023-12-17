ifeq ($(wildcard ./*/.env),)

else
	include ./srcs/.env
endif

DOCKER_COMPOSE_YML = ./srcs/docker-compose.yml
SRCS_PATH = ./srcs
MARIADB_PATH = ./srcs/requirements/mariadb
NGINX_PATH = ./srcs/requirements/nginx
WORDPRESS_PATH = ./srcs/requirements/wordpress

all: build up

hosts:
	@sudo cp /etc/hosts /etc/hosts.backup
	@sudo echo "127.0.0.1 ryhara.42.fr" >> /etc/hosts

build :
	docker-compose -f $(DOCKER_COMPOSE_YML) build --no-cache

up :
	@mkdir -p $(MARIADB_VOLUME_PATH)
	@mkdir -p $(WORDPRESS_VOLUME_PATH)
	docker-compose -f $(DOCKER_COMPOSE_YML) up -d --build

stop :
	docker-compose -f $(DOCKER_COMPOSE_YML) stop

down :
	docker-compose -f $(DOCKER_COMPOSE_YML) down
	make image-rm
	make volume-rm
	make volume-clean

re : down up

ps :
	docker container ls -a
	@echo "----------------------------------------"
	docker image ls -a
	@echo "----------------------------------------"
	docker volume ls
	@echo "----------------------------------------"
	docker network ls

mariadb :
	docker exec -it mariadb /bin/bash

wordpress :
	docker exec -it wordpress /bin/bash

nginx :
	docker exec -it nginx /bin/bash

adminer :
	docker exec -it adminer /bin/bash

net-inspect :
	docker network inspect inception-network

image-rm :
	docker image rm mariadb:v42 wordpress:v42 nginx:v42 adminer:v42

volume-rm :
	docker volume rm mariadb wordpress

volume-clean :
	rm -rf $(MARIADB_VOLUME_PATH) $(WORDPRESS_VOLUME_PATH)

clean :
	docker stop $(docker ps -qa);
	docker rm $(docker ps -qa);
	docker rmi -f $(docker images -qa);
	docker volume rm $(docker volume ls -q);
	docker network rm $(docker network ls -q) 2>/dev/null

env:
	cp $(SRCS_PATH)/.env.example $(SRCS_PATH)/.env
	cp $(MARIADB_PATH)/.env.example $(MARIADB_PATH)/.env
	cp $(NGINX_PATH)/.env.example $(NGINX_PATH)/.env
	cp $(WORDPRESS_PATH)/.env.example $(WORDPRESS_PATH)/.env

env-clean:
	rm -rf $(SRCS_PATH)/.env
	rm -rf $(MARIADB_PATH)/.env
	rm -rf $(NGINX_PATH)/.env
	rm -rf $(WORDPRESS_PATH)/.env

.PHONY: all build stop up down ps re clean env env-clean mariadb net-inspect wordpress image-rm volume-rm

# docker image build -t mariadb:v42 .
# docker container run -it --name mariadb42  mariadb:v42

# docker logs mariadb

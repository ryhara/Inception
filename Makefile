include .env
DOCKER_COMPOSE_YML = ./srcs/docker-compose.yml

all: up

up :
	docker-compose -f $(DOCKER_COMPOSE_YML) up -d

down :
	docker-compose -f $(DOCKER_COMPOSE_YML) down

re : down up

# container stop -> container rm -> image rm -> volume rm -> network rm
clean :

env:
	cp .env.example .env

.PHONY: all up down re clean env
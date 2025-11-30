MAKEFLAGS += --silent

ifndef ENV
	ENV=dev
endif

ifneq (,$(wildcard .env))
	include .env
else
	include ./env/.env.$(ENV).dist
endif

# Executable
WORKSPACE:=$(shell pwd)

export WORKSPACE

DOCKER_COMPOSE_FILE=${WORKSPACE}/docker/compose/docker-compose.yml
CMD_DOCKER_COMPOSE=docker compose -f ${DOCKER_COMPOSE_FILE} --project-directory ${WORKSPACE} ## Point docker to directory's root to find env file


install: ## Install project dependencies
	$(info --> Install for ENV: ${ENV})
	cp ./env/.env.$(ENV).dist ./.env
ifeq ($(PROJECT_TYPE),web)
	make generate-certificate
	make nginx-config
endif
	make up
	make install-symfony

generate-certificate: ## generate certificate SSL for $(HOST) domain
	sh ./docker/scripts/install/generate-certificate.sh $(HOST)

nginx-config: ## generate nginx config file
	sh ./docker/scripts/install/generate-nginx-config.sh $(HOST)

install-symfony: ## install symfony
	$(CORE_CLI) sh ./docker/scripts/install/install-symfony.sh $(FULL_WEB)

up: ## docker-compose up -d with good env variables
	$(CMD_DOCKER_COMPOSE) up -d

build: ## docker-compose build
	$(CMD_DOCKER_COMPOSE) build --no-cache

stop: ## docker-compose stop
	$(CMD_DOCKER_COMPOSE) --profile debug --profile build stop

ssh-php: ## Ssh into php container
	$(CMD_DOCKER_COMPOSE) exec php sh

<h1 align="center">
  🚀 A Docker Starter Kit for Symfony
</h1>

<p align="center">
    <a href="#"><img src="https://img.shields.io/badge/php-^8.2-purple.svg?logo=php" alt="PHP version"/></a>
    <a href="#"><img src="https://img.shields.io/badge/composer-latest-blue.svg?logo=composer" alt="PHP version"/></a>
    <a href="#"><img src="https://img.shields.io/github/license/Naereen/StrapDown.js.svg"/></a>
</p>

<p align="center">
    A Starter Kit to create new web or console Symfony Project quickly, with docker structure implementation
    <br />
    Using nginx for webserver with SSL autoconfiguration, and Mysql for database
</p>

## 🔧 Environment Setup

Some tools are required to install a project : 

### 🐳 Needed tools

1. [Docker](https://docs.docker.com/engine/install/)
2. [Docker Compose](https://docs.docker.com/compose/install/)
3. make
4. mkcert <small>(Tools to generate a certificate for SSL)</small>

### 1- Environment configuration

Change your custom variable value in the dist file `env/.env.dev.dist`, according your project application and your environment (``dev|stage|prod``).

```dotenv
# in env/.env.dev.dist

##### Custom Environnement Variable #####
ENV=dev
DEBUG=true

## Install env var
SCRIPTS_DIR=/var/www/html/docker/scripts/entrypoint
PROJECT_NAME=starter-kit-symfony
SYMFONY_VERSION=6.3.*
PROJECT_TYPE=web
FULL_WEB=false
HOST=dev-starter-kit-symfony.mg

## Database
ROOT_PASSWORD=root
MYSQL_DB_HOST=database
MYSQL_DB_NAME=dbname
MYSQL_USERNAME=dbuser
MYSQL_PASSWORD=dbpassword
```

- ``SCRIPTS_DIR`` : Script to be run when starting container
- ``PROJECT_NAME`` : your project name
- ``SYMFONY_VERSION`` : The version of symfony that will be installed
- ``PROJECT_TYPE`` : a `web` or `console` project
- ``FULL_WEB`` : require weapp on symfony install if value is true
- ``HOST`` : A host if your project type is a `web` symfony project

Database configurations
- ``ROOT_PASSWORD`` : the root password
- ``MYSQL_DB_HOST`` : the database container name or external database host
- ``MYSQL_DB_NAME`` : name of the database
- ``MYSQL_USERNAME`` : username to access database
- ``MYSQL_PASSWORD`` : user password to access database

### 2- Project Installation
After creating and configure the `.env` file, run install with a `make install` command  

```shell
make install
```

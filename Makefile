NAME = dw/collections-api
VERSION = $(TRAVIS_BUILD_ID)
ME = $(USER)

all: build up
clean: stop rm

build:
	sudo chown -R $(ME) mysql-datadir
	docker build --no-cache . 
#	docker build --no-cache -t $(NAME):$(VERSION) . 

up:
	echo "start db and load data, please be patient ... a couple of minutes ..."
	docker-compose up -d dina-mysql
	docker inspect --format '{{ .NetworkSettings.IPAddress }}:3306' dwcollections_dina-mysql_1 | xargs wget --retry-connrefused --tries=5 -q --waitretry=3 
	./populate_dina_web_db.sh
	./populate_keycloak_db.sh

	echo "bringing up the SSO service"
	docker-compose up -d dina-keycloak
	wget --retry-connrefused --tries=5 --waitretry=3 -q "http://localhost:8080/auth"

	echo "bringing up application server, takes approx 30-40 s"
	docker-compose up -d dina-wildfly
	wget --retry-connrefused --tries=15 --waitretry=3 -q "http://localhost:8181/test-client"

	echo "bringing up web server / proxy"
	docker-compose up -d dina-proxy

stop:
	docker-compose stop

rm:
	docker-compose rm -vf 


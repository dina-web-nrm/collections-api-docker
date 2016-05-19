ME = $(USER)

all: build up
clean: stop rm

build:
	sudo chown -R $(ME) mysql-datadir

keycloak-data-dump:
	@echo "Dumping mysql database from KeyCloak server"
	docker exec -it dwcollections_db_1 sh -c "mysqldump -u keycloak -pkeycloak keycloak > /shr/keycloak.sql"

up:
	echo "start db and load data, please be patient ... a couple of minutes ..."
	docker-compose up -d db
	sleep 5
	./populate_dina_web_db.sh
	./populate_keycloak_db.sh

	echo "bringing up the SSO service"
	docker-compose up -d sso
	sleep 20

	echo "bringing up application server, takes approx 30-50 s"
	docker-compose up -d as
	sleep 50

	echo "bringing up web server / proxy"
	docker-compose up -d ws-api

stop:
	docker-compose stop

rm:
	docker-compose rm -vf


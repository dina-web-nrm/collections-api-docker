ME = $(USER)

all: chown init up

chown:
	sudo chown -R $(ME):$(ME) mysql-datadir

init:
	@echo "Initial start - populating data"
	echo "start db and load data, please be patient ... a couple of minutes ..."
	docker-compose up -d db
	sleep 5
	./populate_dina_web_db.sh
	./populate_keycloak_db.sh

up:
	@echo "Starting services, please be patient ... a couple of minutes ..."
	docker-compose up -d db
	sleep 5

	@echo "bringing up the SSO service"
	docker-compose up -d sso
	sleep 20

	@echo "bringing up application server, takes approx 30-50 s"
	docker-compose up -d as
	sleep 50

	@echo "bringing up web server / proxy"
	docker-compose up -d ws-api

keycloak-data-dump:
	@echo "Dumping mysql database from KeyCloak server"
	docker exec -it dwcollections_db_1 sh -c "mysqldump -u keycloak -pkeycloak keycloak > /shr/keycloak.sql"

test:
	./demo.sh

clean: stop rm

stop:
	docker-compose stop

rm:
	docker-compose rm -vf

ME = $(USER)

all: init build up
clean: stop rm

init: start-db collections-import sso-import

start-db:

	@echo "Initializing data"
	docker-compose up -d db
	sleep 15

build:

up: start-db

	@echo "Starting SSO"
	docker-compose up -d sso
	sleep 20

	@echo "Starting application server, takes approx 30-50 s"
	docker-compose up -d as
	sleep 50

	@echo "Bringing up web service API proxy"
	docker-compose up -d ws-api

sso-export:

	@echo "Exporting KeyCloak data from mysql"
	docker exec -it dwcollections_db_1 sh -c \
		"mysqldump -u keycloak -pkeycloak keycloak > /shr/keycloak.sql"

sso-import:

	@echo "Importing KeyCloak data into mysql"
	docker exec -i dwcollections_db_1 mysql -u root -ppassword12 \
		-D keycloak < mysql-shr/keycloak.sql

reporter-import:

	@echo "Importing KeyCloak data into mysql"
	docker exec -i dwcollections_db_1 mysql -u root -ppassword12 \
		-D keycloak < mysql-shr/kc_reporter.sql

reporter-test:

	@echo "Getting data from API using reporter"
	./demo.sh

collections-import:

	@echo "Importing sample Collections data"
	curl --progress-bar -L http://archive.org/download/dw-collectionsdata/dina_web.sql.gz -o dina_web.sql.gz
	gunzip dina_web.sql.gz
	mv dina_web.sql mysql-shr

	@echo "Loading image sample data into database container"
	docker exec -i dwcollections_db_1 mysql -u root -ppassword12 \
		-e "create database if not exists dina_web;"
	docker exec -i dwcollections_db_1 mysql -u root -ppassword12 \
		-D dina_web < mysql-shr/dina_web.sql

images-import:

	@echo "Getting Specify sample dataset w images"
	curl -L --progress-bar https://github.com/DINA-Web/datasets/raw/master/specify/DemoDatawImages.sql.gz \
		-o ./DemoDatawImages.sql.gz 
	gunzip DemoDatawImages.sql.gz
	mv DemoDatawImages.sql mysql-shr

	@echo "Loading image sample data into database container"
	docker exec -i dwcollections_db_1 mysql -u root -ppassword12 \
		-e "create database if not exists dina_web;"
	docker exec -i dwcollections_db_1 mysql -u root -ppassword12 \
		-D dina_web < mysql-shr/DemoDatawImages.sql

stop:

	docker-compose stop

rm:

	docker-compose rm -vf
	sudo chown -R $(ME) mysql-datadir
	rm -rf mysql-datadir


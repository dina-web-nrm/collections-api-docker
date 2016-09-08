ME = $(USER)
PWD = $(shell pwd)

all: cache init build up
clean: stop rm

init: start-db collections-import sso-import

start-db:

	@echo "Initializing data"
	docker-compose up -d db
	sleep 15

cache:
	@echo "Getting deps for CLI tool for batch upload of user data"
	test -f KeycloakAdmin.one-jar.jar || \
		wget https://github.com/DINA-Web/collections-api/releases/download/v0.2.13/KeycloakAdmin.one-jar.jar
#	test -f univocity-parsers-2.0.2.jar || \
		wget http://central.maven.org/maven2/com/univocity/univocity-parsers/2.0.2/univocity-parsers-2.0.2.jar

build:
	docker build --tag dina/keycloak-cli .

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
	docker exec -it collectionsapidocker_db_1 sh -c \
		"mysqldump -u keycloak -pkeycloak keycloak > /shr/keycloak.sql"

sso-import:

	@echo "Importing KeyCloak data into mysql"
	docker exec -i collectionsapidocker_db_1 mysql -u root -ppassword12 \
		-D keycloak < mysql-shr/keycloak.sql

sso-import-csv:
	
	@echo "Importing userdata into KeyCloak from tab separated text file"
	#docker run --rm -it dina/keycloak-cli
	docker run --rm -it \
		-v $(PWD)/users.tsv:/tmp/users.tsv \
		dina/keycloak-cli java -jar KeycloakAdmin.one-jar.jar https://beta-sso.dina-web.net/auth /tmp/users.tsv


reporter-import:

	@echo "Importing KeyCloak data into mysql"
	docker exec -i collectionsapidocker_db_1 mysql -u root -ppassword12 \
		-D keycloak < mysql-shr/kc_reporter.sql

reporter-test:

	@echo "Getting data from API using reporter"
	./demo.sh

collections-import:

	@echo "Importing sample Collections data"
	test -f ./mysql-shr/dina_web.sql || \
		(curl -o dina_web.sql.gz --progress-bar -L \
			http://archive.org/download/dw-collectionsdata/dina_web.sql.gz && \
		gunzip dina_web.sql.gz && mv dina_web.sql mysql-shr)

	@echo "Loading image sample data into database container"
	docker exec -i collectionsapidocker_db_1 mysql -u root -ppassword12 \
		-e "create database if not exists dina_web;"
	docker exec -i collectionsapidocker_db_1 mysql -u root -ppassword12 \
		-D dina_web < mysql-shr/dina_web.sql

images-import:

	@echo "Getting Specify sample dataset w images"
	curl -L --progress-bar https://github.com/DINA-Web/datasets/raw/master/specify/DemoDatawImages.sql.gz \
		-o ./DemoDatawImages.sql.gz 
	gunzip DemoDatawImages.sql.gz
	mv DemoDatawImages.sql mysql-shr

	@echo "Loading image sample data into database container"
	docker exec -i collectionsapidocker_db_1 mysql -u root -ppassword12 \
		-e "create database if not exists dina_web;"
	docker exec -i collectionsapidocker_db_1 mysql -u root -ppassword12 \
		-D dina_web < mysql-shr/DemoDatawImages.sql

stop:

	docker-compose stop

rm:

	docker-compose rm -vf
	sudo chown -R $(ME) mysql-datadir
	rm -rf mysql-datadir


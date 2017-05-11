DB := docker exec -i collectionsapidocker_db_1 mysql \
	-u root -ppassword12

DW := $(DB) -D dina_web
KC := $(DB) -D keycloak
PWD := $(shell pwd)

all: download-ia load-empty-collections load-accounts-keycloak

load-may19:
	$(DW) < dina-labb-dump-05-19.sql

load-may20:
	$(DW) < Dump20160520-3.sql

load-users:
	$(DW) < sprint-users.sql

load-empty-collections:
	docker exec -i collectionsapidocker_db_1 \
		mysql -u root -ppassword12 -e "create database dina_web;"
	$(DW) < Dump20160520-3.sql

load-accounts-keycloak:
	$(KC) < ../mysql-shr/keycloak.sql

load-tsv:
	docker run --rm -it --network host \
		-v $(PWD)/sprint-users.tsv:/tmp/users.tsv \
		dina/keycloak-cli java -jar KeycloakAdmin.one-jar.jar https://beta-sso.dina-web.net/auth /tmp/users.tsv

show-collections-users:
	$(DW) -e "select * from agent;"

show-keycloak-users:
	$(KC) -e "select * from USER_ENTITY"

debug:
	docker exec -it collectionsapidocker_db_1 mysql \
		-u root -ppassword12

upload-ia:
	@echo "Packaging and uploading data to Internet Archive"
	tar cvfz betadata.tgz Dump20160520-3.sql
	ia upload dw-betadata betadata.tgz --metadata="title:DINA-Web Data (Beta)"
	rm betadata.tgz
	firefox https://archive.org/details/dw-betadata &

download-ia:
	@echo "Downloading DINA-Web Data (Beta) using wget"
	test -f Dump20160520-3.sql || (wget http://archive.org/download/dw-betadata/betadata.tgz -O betadata.tgz && tar xvfz betadata.tgz && rm betadata.tgz)



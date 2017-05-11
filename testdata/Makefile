DB := docker exec -i collectionsapidocker_db_1 mysql \
	-u root -ppassword12

DW := $(DB) -D dina_web
KC := $(DB) -D keycloak
PWD := $(shell pwd)

all: upload-empty-collections upload-accounts-keycloak

upload-may19:
	$(DW) < dina-labb-dump-05-19.sql

upload-may20:
	$(DW) < Dump20160520-3.sql

upload-users:
	$(DW) < sprint-users.sql

upload-empty-collections:
	$(DW) < Dump20160520-3.sql

upload-accounts-keycloak:
	$(KC) < ../mysql-shr/keycloak.sql

upload-tsv:
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

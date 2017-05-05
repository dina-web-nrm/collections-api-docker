#!/bin/bash

echo "Loading keycloak data into db container, make sure you have first run make keycloak-data-dump"
docker-compose stop db
docker-compose start db
sleep 35

docker exec -i collectionsapidocker_db_1 mysql -u root -ppassword12 -D keycloak < mysql-shr/keycloak.sql

echo "Done loading user data. TODO: load data from CSV!!!"

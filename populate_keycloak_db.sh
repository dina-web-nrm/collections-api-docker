#!/bin/bash

gunzip keycloakdump.sql.gz

echo "Loading keycloak data into dina-mysql container"
docker-compose stop dina-mysql
docker-compose start dina-mysql
sleep 5

echo "Fix issue with Mac OS X nulls in mysql dumpfile"
cat keycloakdump.sql | tr "\001" -d > users.sql

docker exec -i dwcollections_dina-mysql_1 mysql -u root -ppassword12 -D keycloak < users.sql

echo "Done loading user data"

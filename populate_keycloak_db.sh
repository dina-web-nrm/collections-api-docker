#!/bin/bash

echo "Loading keycloak data into db container"
docker-compose stop db
docker-compose start db
sleep 35

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	echo "Fix issue with Mac OS X nulls in mysql dumpfile"
	cat keycloakdump.sql | tr "\001" -d > users.sql
	docker exec -i dwcollections_db_1 mysql -u root -ppassword12 -D keycloak < users.sql	
elif [[ "$OSTYPE" == "darwin"* ]]; then
	echo "Loading data from mysql keycloakdump"
	docker exec -i dwcollections_db_1 mysql -u root -ppassword12 -D keycloak < keycloakdump.sql	
else
        echo "This OS is not supported by this script."
fi

echo "Done loading user data. TODO: load data from CSV!!!"

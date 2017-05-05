#!/bin/bash

#IP=$(docker-machine env dev-nfs && docker-machine ip)
IP=127.0.0.1

RESULT=$(curl --data "grant_type=password&client_id=dina-rest-endpoint&username=reporter&password=reporter" http://$IP:8080/auth/realms/dina/tokens/grants/access)
#<http://192.168.99.100:8080/auth/realms/dina/tokens/grants/access%60>

TOKEN=$(echo $RESULT | sed 's/.*access_token":"//g' | sed 's/".*//g')

curl -v -H "Authorization: bearer $TOKEN" \
http://$IP:8181/dina-service/dina/v0/Collectionobject | json_pp

# NOTE: to test authentication integration in a web UI, the test-client.war is used
#firefox http://$IP:8181/test-client

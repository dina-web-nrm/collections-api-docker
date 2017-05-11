#!/bin/bash

SSO_API="https://beta-sso.dina-web.net/auth/realms/dina/protocol/openid-connect/token"
DW_API="https://beta-api.dina-web.net/collections/v0"

RESULT=$(curl -s --cacert /tmp/certs/ca.pem --data "grant_type=password&client_id=dina-rest&username=johnny&password=passw0rd12" \
	$SSO_API)

echo "Got result $RESULT"

TOKEN=$(echo $RESULT | sed 's/.*access_token":"//g' | sed 's/".*//g')

echo "Got token:"
echo $TOKEN

echo "Getting data from API:"
curl -s --cacert /tmp/certs/ca.pem -H "Authorization: Bearer $TOKEN" \
	$DW_API/agent | json_pp

#!/bin/bash

SSO_API="https://beta-sso.dina-web.net/auth/realms/dina/tokens/grants/access"
DW_API="https://beta-api.dina-web.net/collections/v0"

RESULT=$(curl -s --data "grant_type=password&client_id=dina-rest&username=reporter&password=markus" \
	$SSO_API)

TOKEN=$(echo $RESULT | sed 's/.*access_token":"//g' | sed 's/".*//g')

echo "Got token:"
echo $TOKEN

echo "Getting data from API:"
curl -s -H "Authorization: Bearer $TOKEN" \
	$DW_API/agent/1 | json_pp

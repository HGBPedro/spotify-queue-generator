#!/bin/bash
set -a
source .env
set + a
#    -H "Authorization=Basic $BASIC_TOKEN" \

BASIC_TOKEN=$(echo -n "$CLIENT_ID:$CLIENT_SECRET" | base64 -w 0)

RESPONSE=$(curl -X POST --url "https://accounts.spotify.com/api/token" \
     -H "Content-Type=application/x-www-form-urlencoded" \
     -d "grant_type=authorization_code" \
     -d "code=$AUTH_CODE" \
     -d "redirect_uri=http://localhost:8888/callback" \
     -d "client_id=$CLIENT_ID" \
     -d "client_secret=$CLIENT_SECRET")
echo $RESPONSE
ACCESS_TOKEN=$(echo "$RESPONSE" | jq -r '.access_token')
echo "Writing access token $ACCESS_TOKEN to .env"
sed -i "s/^AUTH_TOKEN=.*/AUTH_TOKEN=${ACCESS_TOKEN}/" ".env"

return 0

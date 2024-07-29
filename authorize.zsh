#!/bin/bash
set -a
source .env
set + a

echo "Fetching access token from Spotify API..."
RESPONSE=$(curl -s -X POST --url "https://accounts.spotify.com/api/token" \
     -H "Content-Type=application/x-www-form-urlencoded" \
     -d "grant_type=authorization_code" \
     -d "code=$AUTH_CODE" \
     -d "redirect_uri=http://localhost:8888/callback" \
     -d "client_id=$CLIENT_ID" \
     -d "client_secret=$CLIENT_SECRET")

ACCESS_TOKEN=$(echo "$RESPONSE" | jq -r '.access_token')

if [ "$ACCESS_TOKEN" = "null" ]; then
	echo "An error occurred while fetching the token"
	echo $RESPONSE
	exit 1
fi

echo "Writing access token to .env..."
sed -i "s/^AUTH_TOKEN=.*/AUTH_TOKEN=${ACCESS_TOKEN}/" ".env"
echo "Access token written to .env."

return 0

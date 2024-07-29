#!/bin/bash
set -a
source .env
set +a

SCOPE="user-read-playback-position app-remote-control streaming user-modify-playback-state playlist-read-private user-read-playback-state" 
RESPONSETYPE="code"
REDIRECT_URI="http://localhost:8888/callback"

xdg-open "https://accounts.spotify.com/authorize?response_type=code&client_id=$CLIENT_ID&scope=$SCOPE&redirect_uri=$REDIRECT_URI"

echo "Waiting for Spotify authorization callback..."
RESPONSE=$(nc -l -p 8888)
CODE=$(echo "$RESPONSE" | grep "GET /callback?code=" | sed -n 's/.*code=\([^& ]*\).*/\1/p')

if [ -z "$CODE" ]; then
    echo "Authorization code not received."
    exit 1
fi

echo "Writing code $CODE to .env"
sed -i "s/^AUTH_CODE=.*/AUTH_CODE=$CODE/" ".env"

return 0

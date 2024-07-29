#!/usr/bin/env bash
set -a # automatically export all variables
source .env
set +a

COUNTER=0
LIMIT=50
START=$(date +%s)

while [[ $COUNTER -lt ($LIMIT + 1) ]] 
do
	RANDOM_NUMBER=$((1 + RANDOM % 1039))
	echo "Random number generated: $RANDOM_NUMBER"
	echo "Fetching playlist item based on random number..."
	PLAYLIST_ITEM=$(curl -s -X GET \
		--url "https://api.spotify.com/v1/playlists/${PLAYLIST_ID}/tracks?fields=items%28track%28name%2Curi%29%29&limit=1&offset=${RANDOM_NUMBER}" \
  		--header "Authorization: Bearer ${AUTH_TOKEN}")
	URI=$(jq -r '.items[0].track.uri' <<< "$PLAYLIST_ITEM")
	echo "Adding to queue ($COUNTER/$LIMIT)"
	PLAYBACK_ITEM=$(curl -X POST \
		--url "https://api.spotify.com/v1/me/player/queue?uri=${URI}&device_id=$DEVICE_ID" \
		--header "Authorization: Bearer ${AUTH_TOKEN}")
  	$((COUNTER++))
done

FINISH=$(date +%s)
echo "Queue assembled in $(expr $FINISH - $START) seconds"
exit 1

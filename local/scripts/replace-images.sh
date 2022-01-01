#!/bin/bash

. ${0%/*}/vars.sh
. ${0%/*}/replace-image.sh

# prints the images that have the `$TAG` that is used while
# creating the images
echo_created_images() {
  docker images --filter "reference=*:$TAG"
}

replace_image "env-ic" 
replace_image "ethereum-dispatcher" "PORT=6000"
replace_image "kafka-consumer-ic"
replace_image "rest-gateway" "PORT=5000"
replace_image "websocket-gateway" "PORT=4000"
replace_image "web-dapp" "WS_URI=localhost PORT=3000"

echo_created_images

#!/bin/bash

. ${0%/*}/vars.sh
. ${0%/*}/remove-image.sh

REPO_NAMES=$(docker images --format "{{ .Repository }}" --filter "reference=*:$TAG")

while IFS= read -r REPO  
do 
  remove_repo_image $REPO
done <<< "$REPO_NAMES"

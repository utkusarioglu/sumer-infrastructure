#!/bin/bash

. ${0%/*}/vars.sh

# Removes images that have the given tag
# @param repo and tag of the image to remove. Ex: <image>:<tag>
# @dev
# 1- This function walks a fine line between being very buggy and  
#    being just fine. Docker can return multiple image ids for a `ls`
#    And this code is does not care about that. It's relying on the fact
#    that repo:tag pattern can only return a single result. It's 
#    possible that this piece of code may result in some errors sometime.
remove_repo_image() {
  REPO="$1"
  EXISTING_IMAGE=$(docker image ls --filter "reference=$REPO:$TAG" -q) #1
  if [ ! -z "$EXISTING_IMAGE" ]
  then
    echo "Removing: $REPO:$TAG"
    docker rmi "$REPO:$TAG" --force
  fi
}

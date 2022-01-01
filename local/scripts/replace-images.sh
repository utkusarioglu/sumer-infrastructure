#!/bin/bash

PROJECT_ROOT="${0%/*}/../../.."
# Terraform and aliases.sh expect this value to be 'tf'
TAG="tf"

# Removes images that have the given tag
# @param repo and tag of the image to remove. Ex: <image>:<tag>
remove_existing_images() {
  REPO="$1"
  EXISTING_IMAGES=$(docker image ls --filter "reference=$REPO:$TAG" -q)
  if [ ! -z "$EXISTING_IMAGES" ]
  then
    echo "Removing: $REPO:$TAG"
    docker rmi "$REPO:$TAG" --force
  fi
}

# Converts space separated build args into docker style build arg params
# @param string sparated args. Ex: "PORT=4000 WS_URI=localhost"
# @dev
#   1- TODO this has to be a bash script solely because of this line
prepare_build_args() {
  BUILD_ARGS_RAW="$1"
  if [ ! -z "$BUILD_ARGS_RAW" ]
  then
    while IFS=' ' read -ra ARG_ARR; do
      for ARG in "${ARG_ARR[@]}"; do
        BUILD_ARG_PARAMS="--build-arg \"$ARG\" $BUILD_ARGS"
      done
    done <<< "$BUILD_ARGS_RAW" #1
  fi
  echo $BUILD_ARG_PARAMS
}

# Replaces the image that has the given name and tag
# @param name: name of the image to replace
# @param tag: tag of the image to replace
# @param build args: args to use for building the image. See `prepare_build_args`
#   method for details on the format
replace_image() {
  REPO="$1"
  BUILD_ARGS_RAW="$2"

  remove_existing_images $REPO
  BUILD_ARG_PARAMS=$(prepare_build_args "$BUILD_ARGS_RAW")

  echo "Building: $REPO:$TAG"
  docker build \
    -f "$PROJECT_ROOT/$REPO/Dockerfile.local" \
    -t "$REPO:$TAG" \
    $BUILD_ARG_PARAMS \
    $PROJECT_ROOT
}

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

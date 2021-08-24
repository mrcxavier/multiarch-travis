#!/bin/bash

export DOCKER_CLI_EXPERIMENTAL=enabled

docker manifest create quay.io/marcioas/multiarch-travis:latest 
quay.io/marcioas/multiarch-travis:x86_64 \ 
quay.io/marcioas/multiarch-travis:ppc64le

docker manifest inspect --verbose quay.io/marcioas/multiarch-travis 

docker login quay.io -u "$bot_user" -p $bot_pass

docker manifest push quay.io/marcioas/multiarch-travis:latest

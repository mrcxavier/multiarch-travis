#!/bin/bash

export DOCKER_CLI_EXPERIMENTAL=enabled

docker manifest create quay.io/marcioas/multiarch-travis:v3 \

buildah manifest add --override-arch=x86_84 --os=linux --arch=x86_64 quay.io/marcioas/multiarch-travis:v2 quay.io/marcioas/multiarch-travis:latest

buildah manifest add --override-arch=ppc64le --os=linux --arch=ppc64le quay.io/marcioas/multiarch-travis:v2 quay.io/marcioas/multiarch-travis:latest
#quay.io/marcioas/multiarch-travis:x86_64 \ 
#quay.io/marcioas/multiarch-travis:ppc64le

docker manifest inspect  quay.io/marcioas/multiarch-travis:v2

docker login quay.io -u "$bot_user" -p $bot_pass

docker manifest push quay.io/marcioas/multiarch-travis:latest

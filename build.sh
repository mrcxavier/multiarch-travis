#!/bin/bash

ARCH=$(uname -a)

docker build -t container/$ARCH -f ./$ARCH/Dockerfile .
docker tag container/$ARCH quay.io/marcioas/multiarch-travis:$ARCH
docker login quay.io -u $bot_user -p $bot_pass
docker push quay.io/marcioas/multiarch-travis:$ARCH

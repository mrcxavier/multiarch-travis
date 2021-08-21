#!/bin/bash

ARCH=$(uname -m)

docker build -t $ARCH -f ./Dockerfile .
docker tag $ARCH quay.io/marcioas/multiarch-travis:$ARCH
docker login quay.io -u $bot_user -p $bot_pass
docker push quay.io/marcioas/multiarch-travis:$ARCH

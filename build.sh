#!/bin/bash

ARCH=$(uname -a)

docker build -t $ARCH -f ./$ARCH/Dockerfile .
docker tag $ARCH quay.io/marcioas/multiarch-travis:$ARCH
docker login quay.io -u $bot_user -p $bot_pass
docker push quay.io/marcioas/multiarch-travis:$ARCH

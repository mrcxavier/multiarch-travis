#!/bin/bash

ARCH=$(uname -m)

docker build $ARCH -t $ARCH -f ./Dockerfile .
docker tag directory/$ARCH quay.io/marcioas/multiarch-travis:$ARCH
docker login quay.io -u $bot_user -p $bot_pass
docker push quay.io/marcioas/multiarch-travis:$ARCH

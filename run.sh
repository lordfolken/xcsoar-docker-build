#!/bin/bash

source ./VERSION.txt
source ./VOLUMES.txt

mkdir /opt/xcsoar 2> /dev/null

docker run -it $VOLUMES xcsoar-build:$VERSION xcsoar-update
docker run -it $VOLUMES xcsoar-build:$VERSION xcsoar-compile-unix
docker run -it $VOLUMES xcsoar-build:$VERSION xcsoar-compile-android

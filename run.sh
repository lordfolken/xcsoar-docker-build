#!/bin/bash

source ./VERSION.txt

docker run -it -v /opt/xcsoar:/opt/xcsoar xcsoar-build:$VERSION xcsoar-update
docker run -it -v /opt/xcsoar:/opt/xcsoar xcsoar-build:$VERSION xcsoar-compile-unix
docker run -it -v /opt/xcsoar:/opt/xcsoar xcsoar-build:$VERSION xcsoar-compile-android

#!/bin/bash

docker run -it -v /opt/xcsoar:/opt/xcsoar xcsoar-build:latest xcsoar-update
docker run -it -v /opt/xcsoar:/opt/xcsoar xcsoar-build:latest xcsoar-compile-unix
docker run -it -v /opt/xcsoar:/opt/xcsoar xcsoar-build:latest xcsoar-compile-android

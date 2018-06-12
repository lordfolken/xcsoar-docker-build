#!/bin/bash

docker run -it -v /opt/xcsoar:/opt/xcsoar xcsoar:latest xcsoar-update
docker run -it -v /opt/xcsoar:/opt/xcsoar xcsoar:latest xcsoar-compile-unix
docker run -it -v /opt/xcsoar:/opt/xcsoar xcsoar:latest xcsoar-compile-android

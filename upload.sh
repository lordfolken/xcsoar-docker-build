#!/bin/bash

source ./VERSION.txt

docker login
docker tag xcsoar-build:$VERSION folken/xcsoar-build:$VERSION
docker push folken/xcsoar-build:$VERSION

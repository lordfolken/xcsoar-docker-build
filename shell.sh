#!/bin/bash

source ./VERSION.txt
source ./VOLUMES.txt

docker run -it $VOLUMES folken/xcsoar-build:$VERSION /bin/bash

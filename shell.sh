#!/bin/bash

source ./VERSION.txt
source ./VOLUMES.txt

docker run -it $VOLUMES xcsoar-build:$VERSION /bin/bash

#!/bin/bash

source ./VERSION.txt
source ./VOLUMES.txt

mkdir /opt/xcsoar 2> /dev/null

docker run -it ${VOLUMES} folken/xcsoar-build:"${VERSION}" xcsoar-update
docker run -it ${VOLUMES} folken/xcsoar-build:"${VERSION}" xcsoar-compile UNIX
docker run -it ${VOLUMES} folken/xcsoar-build:"${VERSION}" xcsoar-compile ANDROID
docker run -it ${VOLUMES} folken/xcsoar-build:"${VERSION}" xcsoar-compile PC
docker run -it ${VOLUMES} folken/xcsoar-build:"${VERSION}" xcsoar-compile KOBO

XCSoar Docker Image
===================

This Docker Image when built, will compile XCSoar for several targets in a clean room environment. The Image is reuseable and therefore will always provide a clean build. 

Currently Supported Targets: 
----------------------------
- UNIX (linux & co)
- PC
- KOBO (wip)

Instructions: 
-------------

docker build -t xcsoar-build - < xcsoarbuild/Dockerfile
mkdir /opt/xcsoar/
docker run -i -v /opt/xcsoar/:/opt/xcsoar/ -t xcsoar-build /bin/bash

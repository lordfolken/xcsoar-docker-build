XCSoar Docker Image
===================

This Docker Image when built, will compile XCSoar for several targets in a clean room environment. 

Currently Supported Targets: 
----------------------------
- UNIX (linux & co)
- Android 

Instructions: 
-------------

To build the container
`./build.sh`

For an interactive shell:
`./shell.sh`

Inside the docker container the following scripts are available:
`xcsoar-update` will pull latest git sources
`xcsoar-compile-unix` (will compile xcsoar for UNIX target)
`xcsoar-compile-android` (will compile xcsoar for UNIX target)

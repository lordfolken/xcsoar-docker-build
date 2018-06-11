XCSoar Docker Image
===================

This Docker Image when built, will compile XCSoar for several targets in a clean room environment. 

Currently Supported Targets: 
----------------------------
- UNIX (linux & co)

Instructions: 
-------------

To build the container
`./build.sh`

To run the container and start compiling XCSoar:
`mkdir /opt/xcsoar/`
`./run.sh`

For an interactive shell:
`./shell.sh`

Inside the docker container the following scripts are available:
`xcsoar-compile-unix` (will compile xcsoar for UNIX target)
`xcsoar-update` will pull latest git sources

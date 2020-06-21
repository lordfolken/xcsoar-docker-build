**Please note: This has since been integratied into the orginal code base: https://github.com/XCSoar/XCSoar/tree/master/ide/docker The Docker images on github have been switched to the xcsoar code base https://hub.docker.com/r/folken/xcsoar-build**

XCSoar Docker Image
===================

This Docker Image when built, will compile XCSoar for several targets in a clean room environment. 

Currently Supported Targets: 
----------------------------
- UNIX (linux & co)
- Android 
- PC
- Kobo

Instructions: 
-------------

The container itself is readonly. All output will be done to "/opt/xcsoar" on your host. 

To build the container
`./build.sh`

To run the container interactivly:
`mkdir /opt/xcsoar /opt/xcsoar-ccache`
`./shell.sh`

To run everything: 
`mkdir /opt/xcsoar /opt/xcsoar-ccache`
`./run.sh`

Inside the docker container the following scripts are available:
 * `xcsoar-update` will pull latest git sources and clean the tree
 * `xcsoar-compile UNIX` (will compile xcsoar for UNIX target)
 * `xcsoar-compile ANDROID` (will compile xcsoar for UNIX target)
 * `xcsoar-compile PC` (will compile xcsoar for PC target)
 * `xcsoar-compile KOBO` (will compile xcsoar for KOBO target)


Wishlist:
---------
This is currently experimental. Here are some thoughts and things still needed: 
 * build a container for master and one for v.6.8.X 
 * use gnu parallel to automatically scale according to processors 
 * proper build instructions
 * add a xcsoar-compile-release 
 * add support for building WIN64, OpenVario, PI
 * add support for tests
 * proper namingscheme
 * checksumming external resources
 * add editors and other tools for editing code
 * add support for other repos than xcsoar
 * deal with the immutability of the container

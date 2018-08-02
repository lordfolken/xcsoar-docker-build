XCSoar Docker Image
===================

This Docker Image when built, will compile XCSoar for several targets in a clean room environment. 

Currently Supported Targets: 
----------------------------
- UNIX (linux & co)
- Android 

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
 * `xcsoar-update` will pull latest git sources
 * `xcsoar-compile-unix` (will compile xcsoar for UNIX target)
 * `xcsoar-compile-android` (will compile xcsoar for UNIX target)

Wishlist:
---------
This is currently experimental. Here are some thoughts and things still needed: 
 * build a container for master and one for v.6.8.X 
 * use gnu parallel to automatically scale according to processors 
 * proper build instructions
 * add a xcsoar-compile-release 
 * add support for building documentation 
 * add support for building PC
 * add support for building WIN64, OpenVario, PI and Kobo
 * add support for tests
 * add a volume for the ccache
 * proper namingscheme
 * checksumming external resources
 * add editors and other tools for editing code
 * add support for other repos than xcsoar
 * deal with the immutability of the container

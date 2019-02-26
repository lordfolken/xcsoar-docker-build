#!/bin/bash

source ./VERSION.txt

docker build -t folken/xcsoar-build:"${VERSION}" ./


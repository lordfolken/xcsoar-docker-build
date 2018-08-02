#!/bin/bash

source ./VERSION.txt

docker build -t xcsoar-build:$VERSION ./

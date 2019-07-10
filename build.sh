#!/bin/bash

# set -x
set -e

docker build --no-cache -t imagemagick-heroku18 container

mkdir -p build

docker run --rm -t -v $PWD/build:/data imagemagick-heroku18 sh -c 'cp -f /usr/src/imagemagick/build/*.tar.gz /data/'

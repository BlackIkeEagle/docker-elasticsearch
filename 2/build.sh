#!/bin/sh
docker pull elasticsearch:2

docker build --no-cache -t dockerwest/elasticsearch:2 .

#!/bin/sh
docker pull elasticsearch:2-alpine

docker build --no-cache -t dockerwest/elasticsearch:2 .

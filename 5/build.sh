#!/bin/sh
docker pull elasticsearch:5-alpine

docker build --no-cache -t dockerwest/elasticsearch:5 .

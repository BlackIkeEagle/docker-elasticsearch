#!/bin/sh
docker pull docker.elastic.co/elasticsearch/elasticsearch:5.5.1

docker build --no-cache -t dockerwest/elasticsearch:5 .

#!/bin/sh
docker pull elasticsearch:2-alpine

docker build --no-cache -t blackikeeagle/elasticsearch:2 .

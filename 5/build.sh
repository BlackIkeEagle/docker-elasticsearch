#!/bin/sh
docker pull elasticsearch:5-alpine

docker build --no-cache -t blackikeeagle/elasticsearch:5 .

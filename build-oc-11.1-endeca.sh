#!/bin/sh

set -o pipefail

#docker build -t ets04uga/atg:latest ./base
#ID=$(docker build -t ets04uga/base:latest ./base)

IMAGE=ets04uga/oc-11.1-endeca
VERSION=latest

docker build -t ${IMAGE}:${VERSION} ./oc-11.1 | tee build.log || exit 1
ID=$(tail -1 build.log | awk '{print $3;}')

#echo $ID
#docker logs $ID


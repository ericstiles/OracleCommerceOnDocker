#!/bin/sh

set -o pipefail

IMAGE=ets04uga/oracle
VERSION=11.2.0.4

docker build -t ${IMAGE}:${VERSION} ./oracle-enterprise-11.2.0.4 | tee build.log || exit 1
ID=$(tail -1 build.log | awk '{print $3;}')

#echo $ID
#docker logs $ID


#!/bin/sh

set -o pipefail

IMAGE=ets04uga/jboss
VERSION=eap-5.1.2

docker build -t ${IMAGE}:${VERSION} ./jboss-eap-5.1.2 | tee build.log || exit 1
ID=$(tail -1 build.log | awk '{print $3;}')

#echo $ID
#docker logs $ID


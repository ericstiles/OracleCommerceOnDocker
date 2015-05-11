#!/bin/sh

set -o pipefail

FILE=endeca-3.1.2
IMAGE=ets04uga/endeca
VERSION=3.1.2

docker build -t ${IMAGE}:${VERSION} $FILE | tee build.log || exit 1
ID=$(tail -1 build.log | awk '{print $3;}')

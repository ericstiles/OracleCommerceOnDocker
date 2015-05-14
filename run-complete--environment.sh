#! /bin/sh

YML_FILE='./docker-compose.yml'

# Need to start existing containers, otherwise create new.

docker-compose -f $YML_FILE start


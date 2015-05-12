#! /bin/sh

YML_FILE='./docker-compose.yml'

docker-compose -f $YML_FILE --verbose up

#!/bin/sh

USER=svc_jboss

useradd -p $(openssl passwd -1 $USER) $USER

if [ ! -z "$1" ]; then
        echo "$USER    ALL=(ALL)       ALL" >> $1
else
        export EDITOR=$0
        visudo
fi
#!/bin/sh

if [ ! -z "$1" ]; then
        echo "endeca    ALL=(ALL)       ALL" >> $1
else
        export EDITOR=$0
        visudo
fi
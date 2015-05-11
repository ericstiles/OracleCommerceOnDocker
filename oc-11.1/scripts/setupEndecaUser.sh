#!/bin/sh

#echo 'Adding grpEndeca'

#groupadd grpEndeca

echo 'Adding endeca user'
#useradd endeca
#passwd endeca
useradd -p $(openssl passwd -1 endeca) -g grpEndeca endeca2


if [ ! -z "$1" ]; then
        echo "endeca    ALL=(ALL)       ALL" >> $1
else
        export EDITOR=$0
        visudo
fi
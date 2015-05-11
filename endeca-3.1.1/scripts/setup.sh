#!/bin/sh

echo 'Adding endeca user'
useradd -p $(openssl passwd -1 endeca) endeca

source ./modsudoers.sh
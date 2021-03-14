#! /bin/bash

# Script for creating the authentication file used by nginx for basic auth
# ARG 1: login
# ARG 2: password

set -e

SCRIPT_DIR=$(dirname "$(readlink -f $0)")

cd $SCRIPT_DIR

printf "$1:$(openssl passwd -crypt $2)\n" > .htpasswd
#!/bin/sh

#
# Source a .env file in the current directory and use the variables to write
# the traefik.yml template out.
#
# Requirements:
#  - GNU gettext
#

set -euo allexport

. ./.env || (echo 'You must create a .env file in this directory, see README.md' 2>&1 && exit 1)
envsubst < config/traefik-template.yml > config/traefik.yml

#!/bin/sh

set -e

DOCKER_ID=`cat /etc/hostname`
sed -i 's/docker_id/'$DOCKER_ID'/'  /var/mini_httpd/index.html

if [[ ! -z ${COLOUR} ]];then
  sed -i 's/docker_colour/'$COLOUR'/'  /var/mini_httpd/style.css
fi

exec "$@"

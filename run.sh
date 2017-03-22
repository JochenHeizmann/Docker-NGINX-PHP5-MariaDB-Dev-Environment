#!/bin/sh

IMAGE_NAME=nginx_php5_mariadb
INSTANCE_NAME=devenv

docker stop ${INSTANCE_NAME} 2&> /dev/null
docker rm ${INSTANCE_NAME} 2&> /dev/null
docker build -t ${IMAGE_NAME}:1.0 .

DIR=$(pwd)

docker                                                      \
    run                                                     \
    -d                                                      \
    --name ${INSTANCE_NAME}                                 \
    -p 80:80                                                \
    -p 3306:3306                                            \
    -v "${DIR}/docker/mysql/db":/var/lib/mysql              \
    -v "${DIR}/docker/nginx/sites":/etc/nginx/sites-enabled \
    -v "${DIR}/www":/var/www                                \
    ${IMAGE_NAME}:1.0

docker logs -f ${INSTANCE_NAME}
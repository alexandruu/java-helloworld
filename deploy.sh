#!/bin/bash

# deploy.sh vm1 0 1
REMOTE_HOST=$1
BUILD_APP=$2
BUILD_CONTAINER=$3

# Define variables
HOST_CURRENT_DIR="/home/alexandru/Java/helloworld"
REMOTE_CURRENT_DIR="/home/alexandru/Java/helloworld"
REMOTE_USER="alexandru"

REMOTE_COMMAND="ls -l /home/$REMOTE_USER"

cd ${HOST_CURRENT_DIR}
scp -r . ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_CURRENT_DIR} 2> deploy_errors

if [ "${BUILD_APP}" -eq 1 ]; then
	ssh ${REMOTE_USER}@${REMOTE_HOST} "cd ${REMOTE_CURRENT_DIR} & mvn clean install"
fi

if [ "${BUILD_CONTAINER}" -eq 1 ]; then
	echo "Building helloworld"
	ssh ${REMOTE_USER}@${REMOTE_HOST} "docker buildx build --load -t helloworld:0.0.4 ${REMOTE_CURRENT_DIR}"
	echo "Cleaning containers"
	ssh ${REMOTE_USER}@${REMOTE_HOST} "docker rm -f \$(docker ps -aq)"
	echo "Starting container"
	ssh ${REMOTE_USER}@${REMOTE_HOST} "docker run -d -p 8080:8080 --name helloworld helloworld:0.0.4"
fi

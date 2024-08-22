#!/bin/bash

IMAGE_NAME=matsuolab/xarm:humble
CONTAINER_NAME="${USER}_xarm_humble"
echo "$0: IMAGE=${IMAGE_NAME}"
echo "$0: CONTAINER=${CONTAINER_NAME}"

xhost +

EXISTING_CONTAINER_ID=`docker ps -aq -f name=${CONTAINER_NAME}`
if [ ! -z "${EXISTING_CONTAINER_ID}" ]; then
    RUNNING_CONTAINER_ID=`docker ps -aq -f name=${CONTAINER_NAME} -f status=running`
    if [ -z "${RUNNING_CONTAINER_ID}" ]; then
        docker container start ${CONTAINER_NAME}
    fi
    docker exec -it ${CONTAINER_NAME} bash
else
    docker run -it --rm \
        --privileged \
        --gpus all \
        --net host \
        --env DISPLAY=${DISPLAY} \
        --volume ${PWD}/xarm_launch/:/root/ros2_ws/src/xarm_launch/ \
        --volume ${PWD}/docker/.colcon_dirs/build/:/root/ros2_ws/build/ \
        --volume ${PWD}/docker/.colcon_dirs/install/:/root/ros2_ws/install/ \
        --volume ${PWD}/docker/.colcon_dirs/log/:/root/ros2_ws/log/ \
        --volume /dev/:/dev/ \
        --volume /tmp/.X11-unix:/tmp/.X11-unix \
        --name ${CONTAINER_NAME} \
        ${IMAGE_NAME} \
        bash
fi
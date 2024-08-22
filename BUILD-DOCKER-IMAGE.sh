#!/bin/bash

docker build . -f docker/Dockerfile.humble_cuda12 -t ros:humble-cuda12

docker build . --ssh defalut -f docker/Dockerfile.xarm_humble -t matsuolab/xarm:humble

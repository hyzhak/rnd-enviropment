#!/usr/bin/env bash

# the obsolete script
# which I have used to run docker directly
# now I'm using docker-compose

# from https://www.tensorflow.org/install/docker
docker run --runtime=nvidia -it --rm -v $PWD:/tmp -v /var/datasets:/var/datasets -w /tmp tensorflow/tensorflow:latest-gpu-py3 python ./script.py

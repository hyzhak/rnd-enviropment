#!/usr/bin/env bash

# the obsolete script
# which I have used to run docker directly
# now I'm using docker-compose

docker run --label ml --name ai --rm --runtime=nvidia -p 8888:8888 -v $(pwd):/notebooks -v /var/datasets:/var/datasets -it floydhub/pytorch:1.0.0-gpu.cuda9cudnn7-py3.37
# based on tensorflow
# docker run --runtime=nvidia -p 8888:8888 -v $(pwd):/notebooks -v /var/datasets:/var/datasets -it tensorflow/tensorflow:latest-gpu-py3

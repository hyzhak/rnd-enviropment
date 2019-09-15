#!/usr/bin/env bash

set -e

docker-compose down -v
docker-compose build
docker-compose up

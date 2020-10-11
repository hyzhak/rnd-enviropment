#!/usr/bin/env bash

set -ex

time docker-compose down -v || true
time docker-compose build
time docker-compose up

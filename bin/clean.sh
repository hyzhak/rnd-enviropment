#!/usr/bin/env bash

echo "remove all __pycache__ directories"
find . -name "__pycache__" -exec sudo rm -r "{}" \;

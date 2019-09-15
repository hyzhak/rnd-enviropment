#!/usr/bin/env bash


ARC_FILE=snap-5.0.9-64-3.0-centos6.5-x64-py3.6.tar.gz
wget http://snap.stanford.edu/snappy/release/beta/${ARC_FILE}

tar zxvf ${ARC_FILE}
cd snap-5.0.0-64-3.0-centos6.5-x64-py3.6
sudo python setup.py install

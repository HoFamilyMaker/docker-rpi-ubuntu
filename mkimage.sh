#!/bin/bash

set -eu

IMAGE=$1
UBUNTU_VERSION=$2

sudo apt-get update && apt-get install -y debootstrap
sudo ln -sf gutsy /usr/share/debootstrap/scripts/$UBUNTU_VERSION

git clone https://github.com/docker/docker
cd docker/contrib

sudo ./mkimage.sh -t $IMAGE debootstrap --verbose $UBUNTU_VERSION http://ports.ubuntu.com

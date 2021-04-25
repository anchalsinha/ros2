#!/bin/bash
set -eux

apt-get update
apt-get install -y wget
wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -

apt-get install -y python3-apt
pip3 install -u setuptools pip
pip3 install -U colcon-ros-bundle

colcon bundle \
  --build-base build_"${TARGET_ARCH}" \
  --install-base install_"${TARGET_ARCH}" \
  --bundle-base bundle_"${TARGET_ARCH}"
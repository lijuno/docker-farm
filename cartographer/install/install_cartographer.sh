#!/bin/bash

ROS_DISTRO=kinetic

# Default rosinstall file (release 1.0.0 as of May 2020)
CARTOGRAPHER_ROS_INSTALL=https://raw.githubusercontent.com/googlecartographer/cartographer_ros/master/cartographer_ros.rosinstall

while getopts w:i: option
do
    case "${option}"
    in
    w) CARTOGRAPHER_WS=${OPTARG};;  # Required: Cartographer workspace for installation
    i) CARTOGRAPHER_ROS_INSTALL=${OPTARG};;  # Optional: rosinstall file
    esac
done

if [[ -z $CARTOGRAPHER_WS ]]; then
    echo "Missing \"-w\": Cartographer installation workspace cannot be empty"
    exit 1
fi

source /opt/ros/$ROS_DISTRO/setup.bash

mkdir -p $CARTOGRAPHER_WS
cd $CARTOGRAPHER_WS
wstool init src

# Merge the cartographer_ros.rosinstall file and fetch code for dependencies.
wstool merge -t src $CARTOGRAPHER_ROS_INSTALL
wstool update -t src

# Install proto3.
src/cartographer/scripts/install_proto3.sh

# Install deb dependencies.
# The command 'sudo rosdep init' will print an error if you have already
# executed it since installing ROS. This error can be ignored.
rosdep init
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro $ROS_DISTRO -r -y

# Build and install.
catkin_make_isolated --install --use-ninja

# Clean up
rm -rf protobuf build_isolated

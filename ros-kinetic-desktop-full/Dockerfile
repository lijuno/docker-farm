FROM ubuntu:16.04

RUN echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list \
    && apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    jq wget curl unzip bc \
    python-pip python-tk \
    python-wstool python-rosdep ninja-build \
    python3-pip \
    ros-kinetic-desktop-full ros-kinetic-joint-state-publisher-gui \
    && apt-get clean && rm -rf /var/lib/apt/lists/*


FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    gnupg \
    dirmngr \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list' \
    && apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-melodic-desktop-full \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

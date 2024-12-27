#!/bin/bash
set -e

# Set the default build type
# BUILD_TYPE=RelWithDebInfo
BUILD_TYPE=Release
colcon build \
        --symlink-install \
        --cmake-args "-DCMAKE_BUILD_TYPE=$BUILD_TYPE" \
        -Wall -Wextra -Wpedantic
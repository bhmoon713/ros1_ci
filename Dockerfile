FROM osrf/ros:noetic-desktop-full-focal
SHELL ["/bin/bash", "-lc"]

RUN apt-get update && apt-get install -y \
    python3-rosdep python3-catkin-tools \
    ros-noetic-rostest ros-noetic-roslint \
    ros-noetic-gazebo-ros-pkgs ros-noetic-gazebo-ros-control \
    xvfb x11-apps wget git \
 && rm -rf /var/lib/apt/lists/*

# rosdep (safe if already inited on base image)
RUN rosdep init 2>/dev/null || true
RUN rosdep update

ENV CATKIN_WS=/catkin_ws
RUN mkdir -p ${CATKIN_WS}/src
WORKDIR ${CATKIN_WS}

# Copy your local TortoiseBot stack from the build context..
# (this folder sits next to ros1_ci/ in your screenshot)
COPY tortoisebot/ ./src/tortoisebot/

# Clone your waypoints package from GitHub
ARG WAYPOINTS_REF=main
RUN git clone --depth 1 --branch "${WAYPOINTS_REF}" \
    https://github.com/bhmoon713/tortoisebot_waypoints.git ./src/tortoisebot_waypoints

# Resolve deps & build
RUN source /opt/ros/noetic/setup.bash \
 && rosdep install --from-paths src --ignore-src -r -y \
 && catkin_make

ENV DISPLAY=:99
ENV GAZEBO_MODEL_PATH=${CATKIN_WS}/src:${GAZEBO_MODEL_PATH}
ENV GAZEBO_RESOURCE_PATH=${CATKIN_WS}/src:${GAZEBO_RESOURCE_PATH}

CMD ["bash"]

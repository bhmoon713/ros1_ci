FROM osrf/ros:noetic-desktop-full-focal
SHELL ["/bin/bash", "-lc"]
ENV DEBIAN_FRONTEND=noninteractive

# Consistent workspace path
ENV CATKIN_WS=/root/simulation_ws
WORKDIR ${CATKIN_WS}

RUN apt-get update && apt-get install -y --no-install-recommends \
      python3-rosdep build-essential git && \
    rm -rf /var/lib/apt/lists/*

RUN rosdep init || true && rosdep update

# Create ws; sources will be bind-mounted at runtime
RUN mkdir -p ${CATKIN_WS}/src

RUN source /opt/ros/noetic/setup.bash && \
    rosdep install --from-paths ${CATKIN_WS}/src --ignore-src -r -y || true && \
    cd ${CATKIN_WS} && catkin_make || true

RUN echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc && \
    echo "if [ -f ${CATKIN_WS}/devel/setup.bash ]; then source ${CATKIN_WS}/devel/setup.bash; fi" >> /root/.bashrc

ENV GAZEBO_MODEL_PATH=${CATKIN_WS}/src/tortoisebot_gazebo/models

# COPY relative to context=simulation_ws
COPY src/ros1_ci/ros_entrypoint.sh /ros_entrypoint.sh
RUN chmod +x /ros_entrypoint.sh

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["roslaunch", "tortoisebot_gazebo", "tortoisebot_playground.launch"]

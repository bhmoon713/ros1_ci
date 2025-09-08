#!/bin/bash
set -e

source /opt/ros/noetic/setup.bash

WS="${CATKIN_WS:-/root/simulation_ws}"

# If src exists but overlay doesn't (or user bind-mounted src), build it
if [ -d "$WS/src" ] && [ ! -f "$WS/devel/setup.bash" ] && [ ! -f "$WS/install/setup.bash" ]; then
  echo "[entrypoint] No overlay found; building workspace at $WS ..."
  cd "$WS"
  catkin_make
fi

# Source overlay if present
if [ -f "$WS/devel/setup.bash" ]; then
  source "$WS/devel/setup.bash"
elif [ -f "$WS/install/setup.bash" ]; then
  source "$WS/install/setup.bash"
else
  echo "[entrypoint] Warning: no overlay (devel/install) at $WS. Running with base ROS only."
fi

exec "$@"

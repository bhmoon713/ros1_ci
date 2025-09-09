# How it works
This is auto testing Jenkins implementation
- Related packages are installed at local computer and mounted to docker
  docker-compose.yaml: ${HOME}/simulation_ws/src:/root/simulation_ws/src:rw
- it launches simulation
- and launches tortoisebot_action_server
- and run test
- and shutdown docker-compose

## Install Docker, enable user permission and restart session, install X host for screen out
```bash
sudo apt-get update
sudo apt-get install -y docker.io docker-compose
sudo service docker start

sudo usermod -aG docker $USER
newgrp docker

sudo apt-get install -y x11-xserver-utils
```
## Install and Start Jenkins
```bash
cd webpage_ws
bash start_jenkins.sh
```
This will download and execute lastest version of Jenkins
See '/home/user/jenkins__pid__url.txt' for Jenkins PID and URL.

# log into Jenkins
```bash
userid : admin
password : 1234
```

# Run at Jenkins
Find "Checkpoint 23_ROS2_tortoisebot_waypoints Automation" item name 
and click "build now"



# Debug container : can try to move into docker and play it
more robot directly
```bash
sudo docker exec -it tortoisebot-ros1-gazebo bash
rostopic pub /cmd_vel geometry_msgs/Twist '{linear: {x: 0.0, y: 0.0, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.2}}'
```
start action server
```bash
docker exec -d tortoisebot-ros1-gazebo bash -c "
  source /opt/ros/noetic/setup.bash &&
  cd ~/simulation_ws &&
  catkin_make &&
  source devel/setup.bash &&
  rosrun tortoisebot_waypoints tortoisebot_action_server.py
"
```
run test program
```bash
docker exec tortoisebot-ros1-gazebo bash -c "
  source /opt/ros/noetic/setup.bash &&
  cd ~/simulation_ws &&
  catkin_make &&
  source devel/setup.bash &&
  rostest tortoisebot_waypoints waypoints_test.test --reuse-master
"
```

# You need this sometimes
docker kill $(docker ps -aq) &> /dev/null;
docker container prune -f
docker volume rm $(docker volume ls -q)
docker volume ls
docker rmi -f $(docker images -aq)



Testing 1
Testing 2

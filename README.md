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

# You need this sometimes
docker kill $(docker ps -aq) &> /dev/null;
docker container prune -f
docker volume rm $(docker volume ls -q)
docker volume ls
docker rmi -f $(docker images -aq)


# Testing on direct terminal
docker kill $(docker ps -aq) &> /dev/null;
docker container prune -f
docker volume rm $(docker volume ls -q)
docker volume ls
docker rmi -f $(docker images -aq)

# Debug container
sudo docker exec -it tortoisebot-ros1-gazebo bash
rostopic pub /cmd_vel geometry_msgs/Twist '{linear: {x: 0.0, y: 0.0, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.2}}'
# Install Docker, enable user permission and restart session
```
sudo apt-get update
sudo apt-get install -y docker.io docker-compose

sudo service docker start
sudo usermod -aG docker $USER
newgrp docker
sudo service docker restart
sudo systemctl start docker
sudo systemctl enable docker
```
# Install and Start Jenkins
```
cd webpage_ws
bash start_jenkins.sh
```
This will download and execute lastest version of Jenkins
See '/home/user/jenkins__pid__url.txt' for Jenkins PID and URL.

# log into Jenkins
userid : admin
password : 1234


# Run at Jenkins
Find "Checkpoint 23_ROS2_tortoisebot_waypoints Automation" item name 
and click "build now"
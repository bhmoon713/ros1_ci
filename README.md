# Install and Start Jenkins
user:~/webpage_ws$ bash start_jenkins.sh

This 
cd ~
JENKINS_FILE="$HOME/jenkins.war"
if [ ! -f "$JENKINS_FILE" ]; then
    wget https://updates.jenkins.io/download/war/latest/jenkins.war -O "$JENKINS_FILE"
fi

# Goto this page to view Jenkins
Jenkins URL: 
https://i-0ca859e25ea030b3d.robotigniteacademy.com/8f3b9566-5f24-43f3-8215-cbcdf6abcd30/jenkins/

Administrator password
9b98bdb338e54a8db58f901eeba4ba28

Jenkins URL:	
https://i-0ca859e25ea030b3d.robotigniteacademy.com/8f3b9566-5f24-43f3-8215-cbcdf6abcd30/jenkins/


echo "if [ ! -f /home/user/run_jenkins.sh ]; then
   wget -nc https://raw.githubusercontent.com/TheConstructAi/jenkins_demo/master/run_jenkins.sh && sleep 10s && bash run_jenkins.sh
fi" >> ~/.bashrc

# Install docker in CLI
sudo apt-get update
sudo apt-get install -y docker.io docker-compose
sudo service docker start
sudo usermod -aG docker $USER
newgrp docker
sudo service docker restart
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker
docker ps

VPS
Docker
Jun 02, 2025

Viktoras D.

4min Read
asdfasdf

##How to fix the permission denied error in Docker
https://www.hostinger.com/tutorials/how-to-fix-docker-permission-denied-error?utm_medium=ppc&utm_campaign=Generic-Tutorials-DSA-VPS|NT:Se|LO:Other-ASIA-t1&gad_source=1&gad_campaignid=22523926723&gbraid=0AAAAADMy-haV4bRWwxyDTEnxe4CinPXgT&gclid=Cj0KCQjwqqDFBhDhARIsAIHTlks4T6gG7W2i4CbDqZZLrnunWCiB0JwmVhyHcl2lObdNdNDfVwVaLTIaAjIdEALw_wcB


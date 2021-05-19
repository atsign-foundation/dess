#!/bin/bash
# The following are recommended but
# let's not cause issues for folks
# who do not keep up to date!
# sudo apt update
# sudo apt upgrade
sudo apt -y install curl
sudo apt -y install hashalot
sudo apt -y install qrencode
# This is the simple way to install docker for your distribution
# But if you prefer to run the latest version feel free to do so,
# and then install docker-compose as well
sudo apt -y install docker.io
sudo apt -y install docker-compose
tput setaf 2
echo Software Installed
echo Now enabling swarm mode
sudo docker swarm init
sudo docker network create -d overlay secondaries
sudo usermod -aG docker $USER
sudo -u $USER docker stack deploy -c base/shepherd.yaml
tput setaf 1
echo $USER now has docker permissions, but will need to start a new shell/login to use them
tput setaf 2
echo Next step is to setup the atsign user
tput setaf 9
read -r -p "Would you like to setup the atsign user? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
  tput setaf 9
  scripts/atsign.sh
else
  tput setaf 9
    exit 0
fi

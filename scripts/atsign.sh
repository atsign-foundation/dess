#!/bin/bash
tput setaf 2
echo "Adding new Linux user atsign"
tput setaf 9
sudo adduser -uid 1024 --disabled-password --disabled-login atsign
tput setaf 2
echo "Creating some base directories for atsign"
tput setaf 9
sudo -u atsign mkdir -p ~atsign/dess ~atsign/atsign/var ~atsign/atsign/etc ~atsign/atsign/logs
tput setaf 2
echo "Copying over the base config files"
tput setaf 9
sudo -u atsign cp dess/.env ~atsign/dess/
sudo -u atsign cp dess/docker-compose.yaml ~atsign/dess/
sudo -u atsign cp dess/setup.sh ~atsign/dess/
#sudo -u atsign cp dess/restart.sh ~atsign/dess/
tput setaf 2
echo "Allowing atsign to run docker containers"
tput setaf 9
sudo usermod -aG docker atsign
tput setaf 2
echo "Checking if atsign can run a docker container"
sleep 2
echo "OK let's try"
tput setaf 9
sudo -u atsign docker run hello-world
RESULT=$?
if [[ $RESULT == 0 ]]
then
  tput setaf 2
  echo "Docker setup correctly for atsign user"
else
  tput setaf 1
  echo "Please check docker install"
  tput setaf 9
    exit 0
fi
tput setaf 9



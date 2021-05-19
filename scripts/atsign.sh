#!/bin/bash
tput setaf 2
echo "Adding new Linux user atsign"
tput setaf 9
sudo adduser -uid 1024 --disabled-password --disabled-login atsign
tput setaf 2
echo "Creating some base directories for atsign"
tput setaf 9
sudo -u atsign mkdir -p ~atsign/dess ~atsign/base ~atsign/atsign/var ~atsign/atsign/etc ~atsign/atsign/logs
tput setaf 2
echo "Copying over the base config files"
tput setaf 9
sudo -u atsign cp base/.env ~atsign/base/
sudo -u atsign cp  base/renew_certs.yaml ~atsign/base
sudo -u atsign cp  base/atsign_crontab ~atsign/base
sudo -u atsign cp base/docker-compose.yaml ~atsign/base/
sudo -u atsign cp base/docker-swarm.yaml ~atsign/base/
sudo -u atsign cp base/setup.sh ~atsign/base/
tput setaf 2
echo "Setting up crontab to renew certs once a day"
sudo -u atsign crontab ~atsign/base/atsign_crontab
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
  tput setaf 9
  echo Next step create.sh
else
  tput setaf 1
  echo "Please check docker install, something went wrong"
  tput setaf 9
    exit 0
fi
tput setaf 9
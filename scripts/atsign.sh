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
tput setaf 2
echo "Allowing atsign to run docker containers"
tput setaf 9
sudo usermod -aG docker atsign
tput setaf 2
echo "Checking if atsign can run a docker container"
sleep 5
echo "OK let's try"
tput setaf 9
sudo -u atsign docker run hello-world
tput setaf 1
echo "."
sleep 1
echo "."
sleep 1
echo "If your saw hello-world run you are ready for the next step"
tput setaf 2
echo "editing the config files for your secondary"
echo "start by switching user to atsign, with the following command"
echo "sudo -s -u atsign"
echo "The change directory to dess and edit .env"
echo "cd dess"
echo "nano .env"
echo "Once that is complete get some certificates with"
echo "docker-compose up cert"
tput setaf 9



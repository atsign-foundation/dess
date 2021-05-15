#!/bin/bash
sudo adduser -uid 1024 --disabled-password --disabled-login atsign
sudo -u atsign mkdir -p ~atsign/dess ~atsign/atsign/var ~atsign/atsign/etc ~atsign/atsign/logs
sudo -u atsign cp dess/.env ~atsign/dess/
sudo -u atsign cp dess/docker-compose.yaml ~atsign/dess/
sudo usermod -aG docker atsign
sudo -u atsign docker run hello-world



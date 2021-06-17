#!/bin/bash

# Enable job control
set -m

# Dess installation

# Dependencies
# openssl, qrencode, curl
# docker, docker-compose, snapd
# certbot (via snap)

# Container Dependencies
# fuse squashfuse


preinstall () {
  # get user's release
  # get package manager
  # update package repos
}

install_dependencies () {
  # openssl, qrencode, curl
  # if container
  # install fuse squashfuse
}

install_certbot () {
  # install snapd
  # install snap core
  # enable and link snap
  # install certbot
}

install_docker () {
  # docker, docker compose
}

setup_atsign_user () {
  # add atsign user
  # link lets-encrypt folder
  # make ~atsign directories
  # curl the base files for atsign
}

setup_docker () {
  # curl the base/shepherd.yaml file to atsign
  # give atsign user docker permissions
  # setup and deploy the swarm as atsign
}

test_atsign_user () {
  # check if docker works for atsign user
}

get_dess_scripts () {
  # curl create and reshowqr from repo
  # to /usr/local/bin
}

do_install () {

}

do_install

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

# SCRIPT GLOBALS

# Supported distros by type
debian_releases='ubuntu debian'
redhat_releases='centos fedora'

# Required base packages
lxc_packages="fuse squashfuse"
packages="curl openssl qrencode"



command_exists () {
  command -v "$@" > /dev/null 2>&1
}

# Helper function to check if user's release matches the list
# $1 = list of valid releases
# $2 = release to check
is_release () { [[ $1 =~ (^|[[:space:]])$2($|[[:space:]]) ]]; }

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
  pre_install

  sh_c=''
  if [[ $EUID -ne 0 ]]; then
    if command_exists sudo; then
      sh_c='sudo -E sh -c'
    elif command_exists su; then
      sh_c='su -c'
    else
      echo 'Error: unable to perform root operations';
      echo 'Please run this script as root to complete installation.';
      exit 1
    fi
  fi

  FUNC=$(declare -f)
  $sh_c "
    $FUNC;
    install_dependencies
    install_certbot
    install_docker
    setup_atsign_user
    setup_docker
    test_atsign_user
    get_dess_scripts
  ";
}

do_install

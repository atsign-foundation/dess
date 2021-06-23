#!/bin/bash

# Enable job control
set -m

# Dess installation

# Dependencies
# openssl, qrencode, curl
# docker, docker-compose
# certbot

# Error Codes
# 1  - Not running with root priveleges
# 2  - Could not detect /etc/os-release ID
# 4  - certbot failed to install
# 50 - docker daemon did not start ( in time )
# 51 - docker-compose failed to install
# 52 - docker stack failed to deploy
# 6  - A dess script failed to install 

# SCRIPT GLOBALS

# Supported distros by type
debian_releases='ubuntu debian'
redhat_releases='centos fedora amzn rhel'

arch_support='x86_64 amd64 aarch64 arm64'

# Required base packages
packages="curl openssl qrencode"

# Docker compose link
compose_url="https://github.com/docker/compose/releases/download/latest"

# Atsign user info
user_info="atsign, secondaries account, atsign.com"

# Atsign directories
atsign_dirs="/home/atsign/dess /home/atsign/base /home/atsign/atsign/var /home/atsign/atsign/etc /home/atsign/atsign/logs"

# Repository files
repo_url="https://raw.githubusercontent.com/xavierchanth/dess/certbot-install-testing"
atsign_files="base/.env base/docker-swarm.yaml base/setup.sh base/shepherd.yaml base/restart.sh"
dess_scripts="create reshowqr"

# Original user
original_user=$USER

command_exists () {
  command -v "$@" > /dev/null 2>&1
}

# Helper function to check if user's release matches the list
# $1 = list of valid releases
# $2 = release to check
is_release () { [[ $1 =~ (^|[[:space:]])$2($|[[:space:]]) ]]; }

pre_install () {
  # Get the user's release
  os_release=$(awk -F= '/^ID=/{print $2}' /etc/os-release | sed 's/\"//g')
  os_id=$(awk -F= '/^VERSION_ID=/{print $2}' /etc/os-release | sed 's/\"//g')

  if [ -z "$os_release" ]
  then
      echo 'Error: Could not detect your distribution.'
      exit 2
  fi
  
  echo "Detected release id: $os_release, version: $os_id"
  echo "Detected architecture: $(uname -m)"
  
  if ! is_release "$arch_support" "$(uname -m)"; then
    echo "Your architecture ($(uname -m)) is currently unsupported by this script."
    exit 0
  fi

  # get package manager
  if is_release "$debian_releases" "$os_release"; then
    pkg_man='apt-get'
  elif is_release "$redhat_releases" "$os_release"; then
    #Use dnf if available, fallback to yum on older distros
    if [[ -n $(command -v 'dnf') ]]; then
      pkg_man='dnf'
    else
      pkg_man='yum'
    fi
  else
    echo 'Your distribution is currently unsupported by this script.'
    exit 0
  fi
  echo "Detected package manager: $pkg_man"
}

# Functions below are run as root via do_install

install_dependencies () {
  $pkg_man -y update
  for pkg in $packages; do
    if ! command_exists "$pkg"; then
      $pkg_man -y install "$pkg"
    fi
  done
}

install_certbot () {
  case "$os_release" in
    centos) echo y | $pkg_man -y install epel-release;;
    amzn) echo y | amazon-linux-extras install epel;;
    rhel) echo y | $pkg_man -y install "https://dl.fedoraproject.org/pub/epel/epel-release-latest-$($os_id | awk -F. '{print $1}').noarch.rpm";;
    *);;
  esac
  # Versions using this approach
  # Ubuntu 20.10 - 1.7.0
  # Debian 10 - 0.31.0
  # Fedora 34 - 1.14.0
  # Centos 7 - 1.11.0
  # Centos 8 - 1.14.0
  # Amazon Linux - 1.11.0
  # RHEL 8 - 1.14.0
  echo y | $pkg_man -y install certbot
  CERTBOT_RESULT=$?
  if [[ $CERTBOT_RESULT -gt 0 ]]; then
    echo 'Error: unable to install certbot'
    exit 4
  fi
}

install_docker () {
  # docker
  if ! command_exists docker; then
    case $os_release in
      amzn) amazon-linux-extras install docker docker-compose;;
      *) curl -fsSL https://get.docker.com | sh;;
    esac
  fi

  # docker-compose
  if ! command_exists docker-compose; then
    # Try the x86_64 installer first
    case $(uname -m) in
      x86_64|amd64) curl -fsSL "$compose_url/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;;
      aarch64|arm64) case "$os_release" in
          amzn) $pkg_man install -y libffi libffi-devel openssl-devel python3 python3-pip python3-devel;;
          ubuntu|debian) $pkg_man install -y python3-pip;;
        esac;
        pip3 install docker-compose;;
    esac
    COMPOSE_RESULT=$?
    echo "$COMPOSE_RESULT"
    # Try the containerized installer
    if [[ $COMPOSE_RESULT -gt 0 ]]; then
      echo 'Error: unable to install docker compose'
      exit 51
    fi
  fi
  chmod +x /usr/local/bin/docker-compose
  ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
  systemctl enable --now docker.service
}

mkdir_atsign () {
  mkdir -p "$1"
  echo "making $1"
  chown atsign "$1"
}

curl_atsign_file () {
  curl -fsSL "$repo_url/$1" -o "/home/atsign/$1"
  echo "curling $1"
  chown atsign "/home/atsign/$1"
}

setup_atsign_user () {
  # add atsign user
  if [[ $pkg_man == apt-get ]]; then
    adduser -uid 1024 --disabled-password --disabled-login --gecos "$user_info" atsign
  else
    adduser --uid 1024 --comment "$user_info" atsign
  fi

  # link lets-encrypt folder
  if [[ ! -d /home/atsign/atsign/etc ]]; then
    tput setaf 2
    echo "setting up certbot"
    rm /etc/letsencrypt/*
    rmdir /etc/letsencrypt/
    ln -s /home/atsign/atsign/etc /etc/letsencrypt
    tput setaf 9
  else
    tput setaf 1
    echo 'saved you from destroying letsencrypt by running the script again :-)'
    tput setaf 9
  fi

  # make ~atsign directories
  tput setaf 2
  echo "Creating some base directories for atsign"
  tput setaf 9
  for directory in $atsign_dirs; do
    mkdir_atsign "$directory"
  done

  # curl the base files for atsign
  for file in $atsign_files; do
    curl_atsign_file "$file"
  done

  chown atsign:atsign /home/atsign
}

setup_docker () {
  # wait for docker to startup
  SECONDS=0
  STATUS=1
  until [[ $STATUS -ne 0 ]]; do
    systemctl is-active --quiet docker.service
    STATUS=$?
    SECONDS=$SECONDS+1
    sleep 1
    if [[ $SECONDS -gt 120 ]]; then
      echo 'Error: Docker daemon is not starting...'
      echo 'Please check your docker installation before running again.'
      exit 50
    fi
  done

  # give atsign user docker permissions
  usermod -aG docker atsign

  # setup and deploy the swarm as atsign
  docker swarm init
  docker network create -d overlay secondaries
  docker stack deploy -c /home/atsign/base/shepherd.yaml secondaries
  STACK_RESULT=$?
  if [[ $STACK_RESULT -gt 0 ]]; then
    echo 'Error: Failed to deploy docker stack'
    exit 52
  fi
}

test_atsign_user () {
  # check if docker works for atsign user
  runuser -l atsign -c '/usr/bin/docker run hello-world'
  RESULT=$?
  if [[ $RESULT -eq 0 ]]; then
    echo "Docker setup correctly for atsign user"
  else
    echo "Please check docker install, something went wrong"
  fi
}

get_dess_scripts () {
  # curl create and reshowqr from repo
  # to /usr/local/bin
  for script in $dess_scripts; do
    curl -fsSL "$repo_url"/"$script".sh -o /usr/local/bin/dess-"$script"
    DESS_SCRIPT_RESULT=$?
    if [[ $DESS_SCRIPT_RESULT -gt 0 ]]; then
      echo "Error: failed to install dess-$script"
      exit 6
    fi
    chmod +x /usr/local/bin/dess-"$script"
    ln -s /usr/local/bin/dess-"$script" /usr/bin/dess-"$script"
  done
}

do_install () {
  pre_install

  if [[ $EUID -ne 0 ]]; then
    echo 'Error: unable to perform root operations';
    echo 'Please run this script as root to complete installation.';
    exit 1
  fi

  install_dependencies
  install_certbot
  install_docker
  setup_atsign_user
  setup_docker
  test_atsign_user
  get_dess_scripts
}

do_install

# Instructions v0.0.1

## Preparation
### You will need
- Freshly built Linux machine (Ubuntu/Debian)
- A static or Dynamic DNS address that points the machines IP interface
- A free port number that is accessible from the internet to your machine (1024-65535)
- An email address so you can get the SSL Certificate from LetsEncrypt.com 
- An @sign from atsign.com 

### What is missing right now
- We are working on the interface on atsign.com to enter your dns/port for your @sign, this is a blocker for the moment but you can install and test this environment in the meantime
- The intent is to provide this environment for AMD64/ARM32/ARM64 CPU architectures but 0.0.1 supports only AMD64
- We assume the machine we are installing on has no other software installed. SO carefully examine the scripts if for example you want to install a specific version of docker. Hints are in the scripts on how to do this

## Getting started
- Install this repo
  ```
  sudo apt update
  sudo apt install git
  cd
  git clone --branch dess-0.0-candidate.01 https://github.com/atsign-foundation/dess.git
  cd dess
  ```
- Make sure you have root access via sudo for your account
  ```
  sudo -s 
  # exit
  ```
- Install the software and follow the prompts to install the atsign user
  ```
  ./install_software.sh
  ```
- Create a secondary, using the create.sh script and follow the instructions
    ```
    ./create.sh
  ```
- Sign in to the atsign.com registrar and update your @signs DNS and port number information
- Fire up an @ app like @buzz or @wavi and pair your device to your secondary
- You are done !


## Example install

```root@localhost:~# git

Command 'git' not found, but can be installed with:

apt install git

root@localhost:~# sudo apt update
Get:1 http://security.ubuntu.com/ubuntu focal-security InRelease [114 kB]
Get:2 http://archive.ubuntu.com/ubuntu focal InRelease [265 kB]
Get:3 http://security.ubuntu.com/ubuntu focal-security/main amd64 c-n-f Metadata [7,668 B]
Get:4 http://security.ubuntu.com/ubuntu focal-security/universe amd64 c-n-f Metadata [11.3 kB]
Get:5 http://archive.ubuntu.com/ubuntu focal-updates InRelease [114 kB]
Get:6 http://archive.ubuntu.com/ubuntu focal-backports InRelease [101 kB]
Get:7 http://archive.ubuntu.com/ubuntu focal/main amd64 Packages [970 kB]
Get:8 http://archive.ubuntu.com/ubuntu focal/main i386 Packages [718 kB]
Get:9 http://archive.ubuntu.com/ubuntu focal/main Translation-en [506 kB]
Get:10 http://archive.ubuntu.com/ubuntu focal/main amd64 c-n-f Metadata [29.5 kB]
Get:11 http://archive.ubuntu.com/ubuntu focal/restricted i386 Packages [8,112 B]
Get:12 http://archive.ubuntu.com/ubuntu focal/restricted amd64 Packages [22.0 kB]
Get:13 http://archive.ubuntu.com/ubuntu focal/restricted Translation-en [6,212 B]
Get:14 http://archive.ubuntu.com/ubuntu focal/restricted amd64 c-n-f Metadata [392 B]
Get:15 http://archive.ubuntu.com/ubuntu focal/universe i386 Packages [4,642 kB]
Get:16 http://archive.ubuntu.com/ubuntu focal/universe amd64 Packages [8,628 kB]
Get:17 http://archive.ubuntu.com/ubuntu focal/universe Translation-en [5,124 kB]
Get:18 http://archive.ubuntu.com/ubuntu focal/universe amd64 c-n-f Metadata [265 kB]
Get:19 http://archive.ubuntu.com/ubuntu focal/multiverse amd64 Packages [144 kB]
Get:20 http://archive.ubuntu.com/ubuntu focal/multiverse i386 Packages [74.7 kB]
Get:21 http://archive.ubuntu.com/ubuntu focal/multiverse Translation-en [104 kB]
Get:22 http://archive.ubuntu.com/ubuntu focal/multiverse amd64 c-n-f Metadata [9,136 B]
Get:23 http://archive.ubuntu.com/ubuntu focal-updates/main i386 Packages [480 kB]
Get:24 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 Packages [988 kB]
Get:25 http://archive.ubuntu.com/ubuntu focal-updates/main Translation-en [224 kB]
Get:26 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 c-n-f Metadata [13.4 kB]
Get:27 http://archive.ubuntu.com/ubuntu focal-updates/restricted i386 Packages [16.3 kB]
Get:28 http://archive.ubuntu.com/ubuntu focal-updates/restricted amd64 Packages [226 kB]
Get:29 http://archive.ubuntu.com/ubuntu focal-updates/restricted Translation-en [33.3 kB]
Get:30 http://archive.ubuntu.com/ubuntu focal-updates/restricted amd64 c-n-f Metadata [436 B]
Get:31 http://archive.ubuntu.com/ubuntu focal-updates/universe i386 Packages [574 kB]
Get:32 http://archive.ubuntu.com/ubuntu focal-updates/universe amd64 Packages [777 kB]
Get:33 http://archive.ubuntu.com/ubuntu focal-updates/universe Translation-en [167 kB]
Get:34 http://archive.ubuntu.com/ubuntu focal-updates/universe amd64 c-n-f Metadata [17.5 kB]
Get:35 http://archive.ubuntu.com/ubuntu focal-updates/multiverse amd64 Packages [21.7 kB]
Get:36 http://archive.ubuntu.com/ubuntu focal-updates/multiverse i386 Packages [6,128 B]
Get:37 http://archive.ubuntu.com/ubuntu focal-updates/multiverse Translation-en [5,564 B]
Get:38 http://archive.ubuntu.com/ubuntu focal-updates/multiverse amd64 c-n-f Metadata [604 B]
Get:39 http://archive.ubuntu.com/ubuntu focal-backports/main amd64 c-n-f Metadata [112 B]
Get:40 http://archive.ubuntu.com/ubuntu focal-backports/restricted amd64 c-n-f Metadata [116 B]
Get:41 http://archive.ubuntu.com/ubuntu focal-backports/universe i386 Packages [2,932 B]
Get:42 http://archive.ubuntu.com/ubuntu focal-backports/universe amd64 Packages [4,032 B]
Get:43 http://archive.ubuntu.com/ubuntu focal-backports/universe Translation-en [1,448 B]
Get:44 http://archive.ubuntu.com/ubuntu focal-backports/universe amd64 c-n-f Metadata [224 B]
Get:45 http://archive.ubuntu.com/ubuntu focal-backports/multiverse amd64 c-n-f Metadata [116 B]
Fetched 25.4 MB in 6s (4,038 kB/s)
Reading package lists... Done
Building dependency tree
Reading state information... Done
All packages are up to date.
root@localhost:~# sudo install git
install: missing destination file operand after 'git'
Try 'install --help' for more information.
root@localhost:~# sudo apt install git
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
  git-man libcurl3-gnutls liberror-perl libgdbm-compat4 libperl5.30 patch perl perl-modules-5.30
Suggested packages:
  git-daemon-run | git-daemon-sysvinit git-doc git-el git-email git-gui gitk gitweb git-cvs git-mediawiki
  git-svn diffutils-doc perl-doc libterm-readline-gnu-perl | libterm-readline-perl-perl make libb-debug-perl
  liblocale-codes-perl
The following NEW packages will be installed:
  git git-man libcurl3-gnutls liberror-perl libgdbm-compat4 libperl5.30 patch perl perl-modules-5.30
0 upgraded, 9 newly installed, 0 to remove and 0 not upgraded.
Need to get 12.7 MB of archives.
After this operation, 85.5 MB of additional disk space will be used.
Do you want to continue? [Y/n]
Get:1 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 perl-modules-5.30 all 5.30.0-9ubuntu0.2 [2,738 kB]
Get:2 http://archive.ubuntu.com/ubuntu focal/main amd64 libgdbm-compat4 amd64 1.18.1-5 [6,244 B]
Get:3 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 libperl5.30 amd64 5.30.0-9ubuntu0.2 [3,952 kB]
Get:4 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 perl amd64 5.30.0-9ubuntu0.2 [224 kB]
Get:5 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 libcurl3-gnutls amd64 7.68.0-1ubuntu2.5 [232 kB]
Get:6 http://archive.ubuntu.com/ubuntu focal/main amd64 liberror-perl all 0.17029-1 [26.5 kB]
Get:7 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 git-man all 1:2.25.1-1ubuntu3.1 [884 kB]
Get:8 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 git amd64 1:2.25.1-1ubuntu3.1 [4,557 kB]
Get:9 http://archive.ubuntu.com/ubuntu focal/main amd64 patch amd64 2.7.6-6 [105 kB]
Fetched 12.7 MB in 2s (6,971 kB/s)
Selecting previously unselected package perl-modules-5.30.
(Reading database ... 101753 files and directories currently installed.)
Preparing to unpack .../0-perl-modules-5.30_5.30.0-9ubuntu0.2_all.deb ...
Unpacking perl-modules-5.30 (5.30.0-9ubuntu0.2) ...
Selecting previously unselected package libgdbm-compat4:amd64.
Preparing to unpack .../1-libgdbm-compat4_1.18.1-5_amd64.deb ...
Unpacking libgdbm-compat4:amd64 (1.18.1-5) ...
Selecting previously unselected package libperl5.30:amd64.
Preparing to unpack .../2-libperl5.30_5.30.0-9ubuntu0.2_amd64.deb ...
Unpacking libperl5.30:amd64 (5.30.0-9ubuntu0.2) ...
Selecting previously unselected package perl.
Preparing to unpack .../3-perl_5.30.0-9ubuntu0.2_amd64.deb ...
Unpacking perl (5.30.0-9ubuntu0.2) ...
Selecting previously unselected package libcurl3-gnutls:amd64.
Preparing to unpack .../4-libcurl3-gnutls_7.68.0-1ubuntu2.5_amd64.deb ...
Unpacking libcurl3-gnutls:amd64 (7.68.0-1ubuntu2.5) ...
Selecting previously unselected package liberror-perl.
Preparing to unpack .../5-liberror-perl_0.17029-1_all.deb ...
Unpacking liberror-perl (0.17029-1) ...
Selecting previously unselected package git-man.
Preparing to unpack .../6-git-man_1%3a2.25.1-1ubuntu3.1_all.deb ...
Unpacking git-man (1:2.25.1-1ubuntu3.1) ...
Selecting previously unselected package git.
Preparing to unpack .../7-git_1%3a2.25.1-1ubuntu3.1_amd64.deb ...
Unpacking git (1:2.25.1-1ubuntu3.1) ...
Selecting previously unselected package patch.
Preparing to unpack .../8-patch_2.7.6-6_amd64.deb ...
Unpacking patch (2.7.6-6) ...
Setting up perl-modules-5.30 (5.30.0-9ubuntu0.2) ...
Setting up libcurl3-gnutls:amd64 (7.68.0-1ubuntu2.5) ...
Setting up patch (2.7.6-6) ...
Setting up libgdbm-compat4:amd64 (1.18.1-5) ...
Setting up libperl5.30:amd64 (5.30.0-9ubuntu0.2) ...
Setting up git-man (1:2.25.1-1ubuntu3.1) ...
Setting up perl (5.30.0-9ubuntu0.2) ...
Setting up liberror-perl (0.17029-1) ...
Setting up git (1:2.25.1-1ubuntu3.1) ...
Processing triggers for man-db (2.9.1-1) ...
Processing triggers for libc-bin (2.31-0ubuntu9.2) ...
root@localhost:~# cd
root@localhost:~# git clone --branch dess-0.0-candidate.01 https://github.com/atsign-foundation/dess.git
Cloning into 'dess'...
remote: Enumerating objects: 346, done.
remote: Counting objects: 100% (346/346), done.
remote: Compressing objects: 100% (239/239), done.
remote: Total 346 (delta 204), reused 236 (delta 100), pack-reused 0
Receiving objects: 100% (346/346), 50.30 KiB | 1.73 MiB/s, done.
Resolving deltas: 100% (204/204), done.
root@localhost:~# cd dess
root@localhost:~/dess# ./install_software.sh
Reading package lists... Done
Building dependency tree
Reading state information... Done
curl is already the newest version (7.68.0-1ubuntu2.5).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
Reading package lists... Done
Building dependency tree
Reading state information... Done
Suggested packages:
  cryptsetup
The following NEW packages will be installed:
  hashalot
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 15.2 kB of archives.
After this operation, 50.2 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu focal/universe amd64 hashalot amd64 0.3-8 [15.2 kB]
Fetched 15.2 kB in 0s (49.9 kB/s)
Selecting previously unselected package hashalot.
(Reading database ... 104648 files and directories currently installed.)
Preparing to unpack .../hashalot_0.3-8_amd64.deb ...
Unpacking hashalot (0.3-8) ...
Setting up hashalot (0.3-8) ...
Processing triggers for man-db (2.9.1-1) ...
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
  libqrencode4
The following NEW packages will be installed:
  libqrencode4 qrencode
0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
Need to get 47.6 kB of archives.
After this operation, 133 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu focal/universe amd64 libqrencode4 amd64 4.0.2-2 [23.6 kB]
Get:2 http://archive.ubuntu.com/ubuntu focal/universe amd64 qrencode amd64 4.0.2-2 [24.0 kB]
Fetched 47.6 kB in 0s (108 kB/s)
Selecting previously unselected package libqrencode4:amd64.
(Reading database ... 104662 files and directories currently installed.)
Preparing to unpack .../libqrencode4_4.0.2-2_amd64.deb ...
Unpacking libqrencode4:amd64 (4.0.2-2) ...
Selecting previously unselected package qrencode.
Preparing to unpack .../qrencode_4.0.2-2_amd64.deb ...
Unpacking qrencode (4.0.2-2) ...
Setting up libqrencode4:amd64 (4.0.2-2) ...
Setting up qrencode (4.0.2-2) ...
Processing triggers for man-db (2.9.1-1) ...
Processing triggers for libc-bin (2.31-0ubuntu9.2) ...
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
  bridge-utils containerd dns-root-data dnsmasq-base libidn11 pigz runc ubuntu-fan
Suggested packages:
  aufs-tools btrfs-progs cgroupfs-mount | cgroup-lite debootstrap docker-doc rinse zfs-fuse | zfsutils
The following NEW packages will be installed:
  bridge-utils containerd dns-root-data dnsmasq-base docker.io libidn11 pigz runc ubuntu-fan
0 upgraded, 9 newly installed, 0 to remove and 0 not upgraded.
Need to get 69.2 MB of archives.
After this operation, 340 MB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu focal/universe amd64 pigz amd64 2.4-1 [57.4 kB]
Get:2 http://archive.ubuntu.com/ubuntu focal/main amd64 bridge-utils amd64 1.6-2ubuntu1 [30.5 kB]
Get:3 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 runc amd64 1.0.0~rc93-0ubuntu1~20.04.2 [4,018 kB]
Get:4 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 containerd amd64 1.3.3-0ubuntu2.3 [27.8 MB]
Get:5 http://archive.ubuntu.com/ubuntu focal/main amd64 dns-root-data all 2019052802 [5,300 B]
Get:6 http://archive.ubuntu.com/ubuntu focal/main amd64 libidn11 amd64 1.33-2.2ubuntu2 [46.2 kB]
Get:7 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 dnsmasq-base amd64 2.80-1.1ubuntu1.3 [314 kB]
Get:8 http://archive.ubuntu.com/ubuntu focal-updates/universe amd64 docker.io amd64 20.10.2-0ubuntu1~20.04.2 [36.9 MB]
Get:9 http://archive.ubuntu.com/ubuntu focal/main amd64 ubuntu-fan all 0.12.13 [34.5 kB]
Fetched 69.2 MB in 5s (13.3 MB/s)
Preconfiguring packages ...
Selecting previously unselected package pigz.
(Reading database ... 104675 files and directories currently installed.)
Preparing to unpack .../0-pigz_2.4-1_amd64.deb ...
Unpacking pigz (2.4-1) ...
Selecting previously unselected package bridge-utils.
Preparing to unpack .../1-bridge-utils_1.6-2ubuntu1_amd64.deb ...
Unpacking bridge-utils (1.6-2ubuntu1) ...
Selecting previously unselected package runc.
Preparing to unpack .../2-runc_1.0.0~rc93-0ubuntu1~20.04.2_amd64.deb ...
Unpacking runc (1.0.0~rc93-0ubuntu1~20.04.2) ...
Selecting previously unselected package containerd.
Preparing to unpack .../3-containerd_1.3.3-0ubuntu2.3_amd64.deb ...
Unpacking containerd (1.3.3-0ubuntu2.3) ...
Selecting previously unselected package dns-root-data.
Preparing to unpack .../4-dns-root-data_2019052802_all.deb ...
Unpacking dns-root-data (2019052802) ...
Selecting previously unselected package libidn11:amd64.
Preparing to unpack .../5-libidn11_1.33-2.2ubuntu2_amd64.deb ...
Unpacking libidn11:amd64 (1.33-2.2ubuntu2) ...
Selecting previously unselected package dnsmasq-base.
Preparing to unpack .../6-dnsmasq-base_2.80-1.1ubuntu1.3_amd64.deb ...
Unpacking dnsmasq-base (2.80-1.1ubuntu1.3) ...
Selecting previously unselected package docker.io.
Preparing to unpack .../7-docker.io_20.10.2-0ubuntu1~20.04.2_amd64.deb ...
Unpacking docker.io (20.10.2-0ubuntu1~20.04.2) ...
Selecting previously unselected package ubuntu-fan.
Preparing to unpack .../8-ubuntu-fan_0.12.13_all.deb ...
Unpacking ubuntu-fan (0.12.13) ...
Setting up runc (1.0.0~rc93-0ubuntu1~20.04.2) ...
Setting up dns-root-data (2019052802) ...
Setting up libidn11:amd64 (1.33-2.2ubuntu2) ...
Setting up bridge-utils (1.6-2ubuntu1) ...
Setting up pigz (2.4-1) ...
Setting up containerd (1.3.3-0ubuntu2.3) ...
Created symlink /etc/systemd/system/multi-user.target.wants/containerd.service → /lib/systemd/system/containerd.service.
Setting up docker.io (20.10.2-0ubuntu1~20.04.2) ...
Adding group `docker' (GID 115) ...
Done.
Created symlink /etc/systemd/system/multi-user.target.wants/docker.service → /lib/systemd/system/docker.service.
Created symlink /etc/systemd/system/sockets.target.wants/docker.socket → /lib/systemd/system/docker.socket.
Setting up dnsmasq-base (2.80-1.1ubuntu1.3) ...
Setting up ubuntu-fan (0.12.13) ...
Created symlink /etc/systemd/system/multi-user.target.wants/ubuntu-fan.service → /lib/systemd/system/ubuntu-fan.service.
Processing triggers for systemd (245.4-4ubuntu3.6) ...
Processing triggers for man-db (2.9.1-1) ...
Processing triggers for dbus (1.12.16-2ubuntu2.1) ...
Processing triggers for libc-bin (2.31-0ubuntu9.2) ...
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
  python3-cached-property python3-docker python3-dockerpty python3-docopt python3-texttable python3-websocket
The following NEW packages will be installed:
  docker-compose python3-cached-property python3-docker python3-dockerpty python3-docopt python3-texttable
  python3-websocket
0 upgraded, 7 newly installed, 0 to remove and 0 not upgraded.
Need to get 262 kB of archives.
After this operation, 1,616 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu focal/universe amd64 python3-cached-property all 1.5.1-4 [10.9 kB]
Get:2 http://archive.ubuntu.com/ubuntu focal/universe amd64 python3-websocket all 0.53.0-2ubuntu1 [32.3 kB]
Get:3 http://archive.ubuntu.com/ubuntu focal/universe amd64 python3-docker all 4.1.0-1 [83.8 kB]
Get:4 http://archive.ubuntu.com/ubuntu focal/universe amd64 python3-dockerpty all 0.4.1-2 [11.1 kB]
Get:5 http://archive.ubuntu.com/ubuntu focal/universe amd64 python3-docopt all 0.6.2-2.2ubuntu1 [19.7 kB]
Get:6 http://archive.ubuntu.com/ubuntu focal/universe amd64 python3-texttable all 1.6.2-2 [11.0 kB]
Get:7 http://archive.ubuntu.com/ubuntu focal/universe amd64 docker-compose all 1.25.0-1 [92.7 kB]
Fetched 262 kB in 1s (375 kB/s)
Selecting previously unselected package python3-cached-property.
(Reading database ... 105021 files and directories currently installed.)
Preparing to unpack .../0-python3-cached-property_1.5.1-4_all.deb ...
Unpacking python3-cached-property (1.5.1-4) ...
Selecting previously unselected package python3-websocket.
Preparing to unpack .../1-python3-websocket_0.53.0-2ubuntu1_all.deb ...
Unpacking python3-websocket (0.53.0-2ubuntu1) ...
Selecting previously unselected package python3-docker.
Preparing to unpack .../2-python3-docker_4.1.0-1_all.deb ...
Unpacking python3-docker (4.1.0-1) ...
Selecting previously unselected package python3-dockerpty.
Preparing to unpack .../3-python3-dockerpty_0.4.1-2_all.deb ...
Unpacking python3-dockerpty (0.4.1-2) ...
Selecting previously unselected package python3-docopt.
Preparing to unpack .../4-python3-docopt_0.6.2-2.2ubuntu1_all.deb ...
Unpacking python3-docopt (0.6.2-2.2ubuntu1) ...
Selecting previously unselected package python3-texttable.
Preparing to unpack .../5-python3-texttable_1.6.2-2_all.deb ...
Unpacking python3-texttable (1.6.2-2) ...
Selecting previously unselected package docker-compose.
Preparing to unpack .../6-docker-compose_1.25.0-1_all.deb ...
Unpacking docker-compose (1.25.0-1) ...
Setting up python3-cached-property (1.5.1-4) ...
Setting up python3-texttable (1.6.2-2) ...
Setting up python3-docopt (0.6.2-2.2ubuntu1) ...
Setting up python3-websocket (0.53.0-2ubuntu1) ...
update-alternatives: using /usr/bin/python3-wsdump to provide /usr/bin/wsdump (wsdump) in auto mode
Setting up python3-dockerpty (0.4.1-2) ...
Setting up python3-docker (4.1.0-1) ...
Setting up docker-compose (1.25.0-1) ...
Processing triggers for man-db (2.9.1-1) ...
Software Installed
Now enabling swarm mode
Swarm initialized: current node (l4ihtcc6cfwe3afbntvuc5asc) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-51wtzyezeu0tfiskf29uh01cqlb2vc8nnq5palr7w256jtip5p-9wjs6t4s4urd3a5jbi58bv4jl 216.250.126.215:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

ovmcc4ea54x2m8zem4y3s9ti2
Creating network secondaries_default
Creating service secondaries_shepherd
root now has docker permissions, but will need to start a new shell/login to use them
Next step is to setup the atsign user
Would you like to setup the atsign user? [y/N] y
Adding new Linux user atsign
Adding user `atsign' ...
Adding new group `atsign' (1024) ...
Adding new user `atsign' (1024) with group `atsign' ...
Creating home directory `/home/atsign' ...
Copying files from `/etc/skel' ...
Changing the user information for atsign
Enter the new value, or press ENTER for the default
        Full Name []: atsign
        Room Number []:
        Work Phone []:
        Home Phone []:
        Other []:
Is the information correct? [Y/n]
Creating some base directories for atsign
Copying over the base config files
Setting up crontab to renew certs once a day
Allowing atsign to run docker containers
Checking if atsign can run a docker container
OK let's try
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
b8dfde127a29: Pull complete
Digest: sha256:5122f6204b6a3596e048758cabba3c46b1c937a46b5be6225b835d091b90e46c
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

Docker setup correctly for atsign user
Next step create.sh
root@localhost:~/dess# ./create.sh
Usage create.sh <@sign> <fqdn> <port> <email>i <service>
Example create.sh @bob bob.example.com 6464 bob@example.com bob
root@localhost:~/dess# ./create.sh @testatsign ionossecondary.shaduf.com 6464 colin@constable.cc testatsign
Creating @testatsign with ionossecondary.shaduf.com:6464 with email colin@constable.cc with docker service name of testatsign
ATSIGN=@testatsign
DOMAIN=ionossecondary.shaduf.com
PORT=6464
EMAIL=colin@constable.cc
SECRET=7aba0421ceccbf92a1e7bfeaed7c741c8b2446b15f82ba5d2320ea7252daa10d10cf2e2f81bfcf10d8d9b57bb84d5d49ea5a1e877e2e0927d1958c942927c2b3
Getting certificates
Creating network "testatsign_default" with the default driver
Pulling cert (certbot/certbot:)...
latest: Pulling from certbot/certbot
339de151aab4: Pull complete
a860e27ad689: Pull complete
910a9a405b4b: Pull complete
bde2ad12a253: Pull complete
584dc3c8e951: Pull complete
ee0b6a5fc80b: Pull complete
3441ac9951cc: Pull complete
4665ef123f62: Pull complete
5bedd499466f: Pull complete
dec3eef9e94a: Pull complete
4f1c29d810f9: Pull complete
5eb6418594da: Pull complete
5da8c5eff620: Pull complete
Digest: sha256:c62b7ca0d8a064a9a260ee331adbe25abb1802ed104abe85a3e02062bbcf9d60
Status: Downloaded newer image for certbot/certbot:latest
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator standalone, Installer None
Account registered.
Requesting a certificate for ionossecondary.shaduf.com
Performing the following challenges:
http-01 challenge for ionossecondary.shaduf.com
Waiting for verification...
Cleaning up challenges

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/ionossecondary.shaduf.com/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/ionossecondary.shaduf.com/privkey.pem
   Your certificate will expire on 2021-08-18. To obtain a new or
   tweaked version of this certificate in the future, simply run
   certbot again. To non-interactively renew *all* of your
   certificates, run "certbot renew"
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  202k  100  202k    0     0  1224k      0 --:--:-- --:--:-- --:--:-- 1232k
Starting secondary for @testatsign at ionossecondary.shaduf.com on port 6464 as on Docker
Creating service testatsign_secondary
Your QR-Code for @testatsign
█████████████████████████████████████████████████████
█████████████████████████████████████████████████████
████ ▄▄▄▄▄ █▀▄█▀▄ █▄█▄ ██▄▄▄▀▀▀▀▄▀▄▄█▄█▀▄█ ▄▄▄▄▄ ████
████ █   █ █▀  ▀█▄█▄▀▄ █▀▄▀▀  █▄▄▄ ▄▄▄█ ▀█ █   █ ████
████ █▄▄▄█ █▀▀█▀▄   ▀▄▀▄ ▄▄▄ ▀▀█▄▀▄▀█▀▄▄▄█ █▄▄▄█ ████
████▄▄▄▄▄▄▄█▄█ ▀ █ ▀▄▀ █ █▄█ ▀▄▀ █ █ ▀▄█▄█▄▄▄▄▄▄▄████
████▄ ▄▄▄█▄ ▄▀▀ ▀▄▄▄▀█▀▄▄▄▄ ▄▄▄█▀  ▄▀ ▄▄▀▄█ ▀▄▀ ▀████
████ ▄▄▄ █▄█ ▄▀▄▄█▀▄    ▀▄▄▀ ▄▄█▀███▀▀▄▀ ▄▄▀ ▀▀ █████
████▄ ▀▀██▄▄█ ▄█ ▄▀▀▄▄▄ ▄▄▄▀▄▀▄▄▀   █ ▄▄▀ ▄▀▀█▀ ▀████
████▀ ▄▄ ▄▄ ▄ ▄▀█▀██▄▄▀▀▄▀██ ▀▄█▀▀▀ ▀▀▄▀ █ ▀▀ ▀█▀████
████    ▄▄▄▄▀█▄▄▄▀█▀█▄▀█▄▀▄ ▄██ █▄ ▀███▄▀█▄█▀ ▀▄▀████
████▄▀▄  █▄▀█████▄█▀█▄ ▀  ▄█  ▄█▀ ▀▀ ▄▄█  ▄▀▀▄ ▄█████
████▀█▄▀ ▄▄▄ █▀ █▄▀▀▄▀▄▀ ▄▄▄ ▄█ █  ██▀█▀ ▄▄▄  ▀▄▀████
████ ██▀ █▄█  ▀▄ ▄ ▀█▀▀  █▄█ ▄▄  ▀▀ ▀▀▄▄ █▄█ ▀  ▀████
██████▄▀▄▄▄ ▄█▀▄ ▄▄▄▀█▀ ▄▄    ███ ▀█▀█▄█ ▄ ▄▄█▀▀▀████
████ █▄█▄█▄▀▀▀▄▄ ▀█▄ █▄██ ▄▄▀█▄█▀█▀▄▀▄▄ ▀▀▀ ▄▀▀▄█████
████ ▀ ▀ ▀▄ ▄█▀▄▀▄▀▄▄▀▄ █▀▀█▀██▄█▄ ▄██▄█▀ ▀▄▄█▀█▀████
████▀█ ▀▀█▄█▀█▀▀ ▀████▀ ▄▄█▀▀▄▄▀▀▄▀▄▀▄▄▀▀▄▀▀▀  ▄█████
████▀█ ▀ █▄██▄▄▀▄▀█▀█▄▀ ▄▄▀ ▀▄▄██▀▀▄▀███▄▀█▄▄ ▀██████
█████▀▀▀ █▄▀▄█▀▀█▀█▀█▀▄▀▀▄▀▄▀▄  ▀▀▀▀▀ ▄▀▄▀▀▀██▀▄▀████
████▄██▄▄█▄█ █ ▀▀▀▀▄▄▀▄▀ ▄▄▄ ▄███  ██▄▄█ ▄▄▄  ▀▀▀████
████ ▄▄▄▄▄ █▄  █ ▄  █▄▀█ █▄█ ▄  ▀▀▀█  ▄▄ █▄█ ▀ ▀█████
████ █   █ █ █▄▄ ▄▄▄▀█ █▄ ▄▄▄▀███▀▀ ▀█▄█▄▄▄  ▄███████
████ █▄▄▄█ █ ▀█▄ ▀█▄ █▄█▀██▀▄█▄█▀█▀▀▀ ▄▄  ██▀█ █▄████
████▄▄▄▄▄▄▄█▄██▄████▄█▄▄████▄█▄▄█▄▄██▄▄█▄█▄▄█▄█▄█████
█████████████████████████████████████████████████████
█████████████████████████████████████████████████████
root@localhost:~/dess# openssl s_client 0:6464
140284142933312:error:0200206F:system library:connect:Connection refused:../crypto/bio/b_sock2.c:110:
140284142933312:error:2008A067:BIO routines:BIO_connect:connect error:../crypto/bio/b_sock2.c:111:
connect:errno=111
root@localhost:~/dess# openssl s_client 0:6464
CONNECTED(00000003)
Can't use SSL_get_servername
depth=2 C = US, O = Internet Security Research Group, CN = ISRG Root X1
verify return:1
depth=1 C = US, O = Let's Encrypt, CN = R3
verify return:1
depth=0 CN = ionossecondary.shaduf.com
verify return:1
---
Certificate chain
 0 s:CN = ionossecondary.shaduf.com
   i:C = US, O = Let's Encrypt, CN = R3
 1 s:C = US, O = Let's Encrypt, CN = R3
   i:C = US, O = Internet Security Research Group, CN = ISRG Root X1
 2 s:C = US, O = Internet Security Research Group, CN = ISRG Root X1
   i:O = Digital Signature Trust Co., CN = DST Root CA X3
---
Server certificate
-----BEGIN CERTIFICATE-----
MIIFODCCBCCgAwIBAgISA6pWVbZjToP/KJjv5zto6nRJMA0GCSqGSIb3DQEBCwUA
MDIxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1MZXQncyBFbmNyeXB0MQswCQYDVQQD
EwJSMzAeFw0yMTA1MjAxNjA0MjFaFw0yMTA4MTgxNjA0MjFaMCQxIjAgBgNVBAMT
GWlvbm9zc2Vjb25kYXJ5LnNoYWR1Zi5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IB
DwAwggEKAoIBAQDeuP83WkGRjnc4orsRZcIj43Cr67/snc4c9DfMxA5E4iGZB6HM
UmyRjgzKf57bNwYnYm7CsCR4IbBOzBOc50iP0WktVWf27NbUlpwIgQNsuDIeTG1Y
ImtnPzw9sW2rT24XCeRsMY94+JlURZGpeoVF00drm8L9MYTliEL4GgDcuzLJV/jP
xZC4YbQ4Pqa8lbcnzATv7uYLMNQ5/I9qRSg/f/LzIPizXWwjhi7uzoy8vocvKt1D
w/A6PqKvIzIXz0GSgsQfdzZpilNuwPcAV/anEMRqvC86dUcZX05yYUpXM6hNe3SO
Xk+dp/VfwAdIf42oHItDGUrmJ/XAoQ4xIiUZAgMBAAGjggJUMIICUDAOBgNVHQ8B
Af8EBAMCBaAwHQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMCMAwGA1UdEwEB
/wQCMAAwHQYDVR0OBBYEFJ/lSgOxrcQThCRljGje311MDc3KMB8GA1UdIwQYMBaA
FBQusxe3WFbLrlAJQOYfr52LFMLGMFUGCCsGAQUFBwEBBEkwRzAhBggrBgEFBQcw
AYYVaHR0cDovL3IzLm8ubGVuY3Iub3JnMCIGCCsGAQUFBzAChhZodHRwOi8vcjMu
aS5sZW5jci5vcmcvMCQGA1UdEQQdMBuCGWlvbm9zc2Vjb25kYXJ5LnNoYWR1Zi5j
b20wTAYDVR0gBEUwQzAIBgZngQwBAgEwNwYLKwYBBAGC3xMBAQEwKDAmBggrBgEF
BQcCARYaaHR0cDovL2Nwcy5sZXRzZW5jcnlwdC5vcmcwggEEBgorBgEEAdZ5AgQC
BIH1BIHyAPAAdgBc3EOS/uarRUSxXprUVuYQN/vV+kfcoXOUsl7m9scOygAAAXmK
vDa0AAAEAwBHMEUCIQDHuWirdgN70UGNLFoLTKr9Qi1Vt3Q9diFPgdXqr6j2rAIg
fx9jm9sSvFG2suc+wuuiSJThbyHldswgl8SgUu/pW2oAdgD2XJQv0XcwIhRUGAgw
lFaO400TGTO/3wwvIAvMTvFk4wAAAXmKvDa/AAAEAwBHMEUCIETZmQm4Koq/dqfl
OXrqssBjwYp92r/RHEo+skEOVrChAiEAnO4F879996Ul4cUTi3h5beMM5429yJhA
/NocymAj9oowDQYJKoZIhvcNAQELBQADggEBAJ9b3rJc2FSajUWQmtzkESi7KQ1t
BF6YhRxzrxY6OHNRZx56cDubzstqhOnxFCgJdm6lueuPaEA2uBvvqps98dBrTybf
4jV/ja3RfTQ38HVB3t5LTad8G+k0Oe1H2sO0rlMDDLn/BD6msDcvm/8BCWsO3o7D
INl+Vv74JFlzPIMg1rzYf12kMDGTTr6ySrjNtUb77ZBbOE9ralQsGo1QUliBE6v4
HKQ0CF13djOQQFZI0KYu+diZDo0+7G2vP1hGqJjeoXPDXft+Oq8cweUnOwQvBGDa
0uNYlbSIf1jXUmkkZ7Q7UfPaXofWWvDxbW+h8rJkI1bmpFQxnNztWBNceXA=
-----END CERTIFICATE-----
subject=CN = ionossecondary.shaduf.com

issuer=C = US, O = Let's Encrypt, CN = R3

---
No client certificate CA names sent
Client Certificate Types: RSA sign, ECDSA sign
Requested Signature Algorithms: ECDSA+SHA256:RSA-PSS+SHA256:RSA+SHA256:ECDSA+SHA384:RSA-PSS+SHA384:RSA+SHA384:RSA-PSS+SHA512:RSA+SHA512:RSA+SHA1
Shared Requested Signature Algorithms: ECDSA+SHA256:RSA-PSS+SHA256:RSA+SHA256:ECDSA+SHA384:RSA-PSS+SHA384:RSA+SHA384:RSA-PSS+SHA512:RSA+SHA512
Peer signing digest: SHA256
Peer signature type: RSA-PSS
Server Temp Key: X25519, 253 bits
---
SSL handshake has read 4689 bytes and written 388 bytes
Verification: OK
---
New, TLSv1.2, Cipher is ECDHE-RSA-AES256-GCM-SHA384
Server public key is 2048 bit
Secure Renegotiation IS supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
SSL-Session:
    Protocol  : TLSv1.2
    Cipher    : ECDHE-RSA-AES256-GCM-SHA384
    Session-ID: 3D6D9A83801BFEB10629EFA436CFF13B55995161E5C3D1A316ED2E3106561A1F
    Session-ID-ctx:
    Master-Key: 4BA1E1F71EE782FB6A00D5139627CBCBAA0DDD16015F480606203F7A03C837FE79C6D36FABFE8E3BDAB21B9401674908
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 7200 (seconds)
    TLS session ticket:
    0000 - 32 4d 9e 2a 04 be 77 09-de 10 43 37 4e 77 8d 8c   2M.*..w...C7Nw..
    0010 - 65 93 91 7b 65 25 93 8b-98 c7 c2 79 4e 95 8f b9   e..{e%.....yN...
    0020 - d6 45 24 ef 5f 27 12 13-63 41 a5 6b c2 46 09 82   .E$._'..cA.k.F..
    0030 - d6 ba 00 a6 88 64 63 2d-dd 31 a6 65 e8 4f 1b 17   .....dc-.1.e.O..
    0040 - a2 7f 5c ba 81 4f 53 fa-80 73 e1 b3 54 f9 c0 43   ..\..OS..s..T..C
    0050 - fe 16 db 72 1a 3c 8b f8-c8 c4 77 16 c4 15 51 8b   ...r.<....w...Q.
    0060 - ee db 39 cc de ba 34 5c-cc 94 0c 38 f4 60 ae 8a   ..9...4\...8.`..
    0070 - 10 f0 5e 20 35 b5 76 d1-a5 93 ec a1 a1 2b 29 00   ..^ 5.v......+).
    0080 - 1a b1 65 3b a7 d7 c8 1e-ec 6e f7 7a 59 5c 06 c4   ..e;.....n.zY\..
    0090 - 4c f4 f2 64 a3 38 18 44-60 6f ba fd 58 c9 1c e8   L..d.8.D`o..X...

    Start Time: 1621530302
    Timeout   : 7200 (sec)
    Verify return code: 0 (ok)
    Extended master secret: yes
---
@scan
data:["signing_publickey@testatsign"]
@lookup:signing_publickey@testatsign
data:MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiOJU5SRnxLLxY4anDtq8OT9miM8FmZseHTWvG00IaZgCmgt5RJvCpNdxxn/CF+0o7Kcyo8OgezllggrBbt0mZq5OYnfqOOYu8mlkzIvt4pdkGfGppjk9R+g2Yd6DI1las6jKC3pfY3rR+iRmS/FUN9EVyDuTXKbdx5Sy1S6+eO2TGMMaMjIRuD+Lpe0wGujrf27AASM9aLwbkvhAIgDAFsfZiSpZyhWcAoLTr6rO7GTIdnIeEr8tz32EKOubXDsoyhav4uHotDU2jcYfsRTN2M4jTMGnDW7wyyjJpunK/UDLneVA73+zrYUPtYcZcfhNsaD+FFLkiBSAGGaA7wp7OQIDAQAB
@exit
error:AT0003-Invalid syntax : invalid command
@read:errno=0
root@localhost:~/dess# docker service ls
ID             NAME                   MODE         REPLICAS   IMAGE                       PORTS
nvuf1h6jeal7   secondaries_shepherd   replicated   1/1        mazzolino/shepherd:latest
ixnnacw4jlv4   testatsign_secondary   replicated   1/1        cconstab/secondary:latest   *:6464->6464/tcp
root@localhost:~/dess#
```
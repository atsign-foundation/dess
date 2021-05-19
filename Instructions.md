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
  git clone https://github.com/atsign-foundation/dess.git
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
- Create a secondary
    ```
    ./create.sh
  ```
- Sign in to the atsign.com registrar and update your @signs DNS and port number information
- Fire up an @ app like @buzz or @wavi and pair your device to your secondary
- You are done !


## What does this look like ?
```aidl
root@localhost:~# apt update
Get:1 http://security.ubuntu.com/ubuntu focal-security InRelease [114 kB]
Get:2 http://archive.ubuntu.com/ubuntu focal InRelease [265 kB]
Get:3 http://security.ubuntu.com/ubuntu focal-security/main i386 Packages [236 kB]
Get:4 http://security.ubuntu.com/ubuntu focal-security/main amd64 Packages [664 kB]
Get:5 http://security.ubuntu.com/ubuntu focal-security/main Translation-en [134 kB]
Get:6 http://security.ubuntu.com/ubuntu focal-security/main amd64 c-n-f Metadata [7,648 B]
Get:7 http://security.ubuntu.com/ubuntu focal-security/restricted amd64 Packages [207 kB]
Get:8 http://security.ubuntu.com/ubuntu focal-security/restricted Translation-en [30.7 kB]
Get:9 http://security.ubuntu.com/ubuntu focal-security/restricted amd64 c-n-f Metadata [440 B]
Get:10 http://security.ubuntu.com/ubuntu focal-security/universe i386 Packages [456 kB]
Get:11 http://security.ubuntu.com/ubuntu focal-security/universe amd64 Packages [578 kB]
Get:12 http://security.ubuntu.com/ubuntu focal-security/universe Translation-en [89.9 kB]
Get:13 http://security.ubuntu.com/ubuntu focal-security/universe amd64 c-n-f Metadata [11.3 kB]
Get:14 http://security.ubuntu.com/ubuntu focal-security/multiverse i386 Packages [5,380 B]
Get:15 http://security.ubuntu.com/ubuntu focal-security/multiverse amd64 Packages [19.9 kB]
Get:16 http://security.ubuntu.com/ubuntu focal-security/multiverse Translation-en [4,316 B]
Get:17 http://security.ubuntu.com/ubuntu focal-security/multiverse amd64 c-n-f Metadata [528 B]
Get:18 http://archive.ubuntu.com/ubuntu focal-updates InRelease [114 kB]
Get:19 http://archive.ubuntu.com/ubuntu focal-backports InRelease [101 kB]
Get:20 http://archive.ubuntu.com/ubuntu focal/main i386 Packages [718 kB]
Get:21 http://archive.ubuntu.com/ubuntu focal/main amd64 Packages [970 kB]
Get:22 http://archive.ubuntu.com/ubuntu focal/main Translation-en [506 kB]
Get:23 http://archive.ubuntu.com/ubuntu focal/main amd64 c-n-f Metadata [29.5 kB]
Get:24 http://archive.ubuntu.com/ubuntu focal/restricted i386 Packages [8,112 B]
Get:25 http://archive.ubuntu.com/ubuntu focal/restricted amd64 Packages [22.0 kB]
Get:26 http://archive.ubuntu.com/ubuntu focal/restricted Translation-en [6,212 B]
Get:27 http://archive.ubuntu.com/ubuntu focal/restricted amd64 c-n-f Metadata [392 B]
Get:28 http://archive.ubuntu.com/ubuntu focal/universe i386 Packages [4,642 kB]
Get:29 http://archive.ubuntu.com/ubuntu focal/universe amd64 Packages [8,628 kB]
Get:30 http://archive.ubuntu.com/ubuntu focal/universe Translation-en [5,124 kB]
Get:31 http://archive.ubuntu.com/ubuntu focal/universe amd64 c-n-f Metadata [265 kB]
Get:32 http://archive.ubuntu.com/ubuntu focal/multiverse amd64 Packages [144 kB]
Get:33 http://archive.ubuntu.com/ubuntu focal/multiverse i386 Packages [74.7 kB]
Get:34 http://archive.ubuntu.com/ubuntu focal/multiverse Translation-en [104 kB]
Get:35 http://archive.ubuntu.com/ubuntu focal/multiverse amd64 c-n-f Metadata [9,136 B]
Get:36 http://archive.ubuntu.com/ubuntu focal-updates/main i386 Packages [480 kB]
Get:37 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 Packages [988 kB]
Get:38 http://archive.ubuntu.com/ubuntu focal-updates/main Translation-en [224 kB]
Get:39 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 c-n-f Metadata [13.4 kB]
Get:40 http://archive.ubuntu.com/ubuntu focal-updates/restricted amd64 Packages [226 kB]
Get:41 http://archive.ubuntu.com/ubuntu focal-updates/restricted i386 Packages [16.3 kB]
Get:42 http://archive.ubuntu.com/ubuntu focal-updates/restricted Translation-en [33.3 kB]
Get:43 http://archive.ubuntu.com/ubuntu focal-updates/restricted amd64 c-n-f Metadata [436 B]
Get:44 http://archive.ubuntu.com/ubuntu focal-updates/universe amd64 Packages [777 kB]
Get:45 http://archive.ubuntu.com/ubuntu focal-updates/universe i386 Packages [574 kB]
Get:46 http://archive.ubuntu.com/ubuntu focal-updates/universe Translation-en [167 kB]
Get:47 http://archive.ubuntu.com/ubuntu focal-updates/universe amd64 c-n-f Metadata [17.5 kB]
Get:48 http://archive.ubuntu.com/ubuntu focal-updates/multiverse i386 Packages [6,128 B]
Get:49 http://archive.ubuntu.com/ubuntu focal-updates/multiverse amd64 Packages [21.7 kB]
Get:50 http://archive.ubuntu.com/ubuntu focal-updates/multiverse Translation-en [5,508 B]
Get:51 http://archive.ubuntu.com/ubuntu focal-updates/multiverse amd64 c-n-f Metadata [604 B]
Get:52 http://archive.ubuntu.com/ubuntu focal-backports/main amd64 c-n-f Metadata [112 B]
Get:53 http://archive.ubuntu.com/ubuntu focal-backports/restricted amd64 c-n-f Metadata [116 B]
Get:54 http://archive.ubuntu.com/ubuntu focal-backports/universe i386 Packages [2,932 B]
Get:55 http://archive.ubuntu.com/ubuntu focal-backports/universe amd64 Packages [4,032 B]
Get:56 http://archive.ubuntu.com/ubuntu focal-backports/universe Translation-en [1,448 B]
Get:57 http://archive.ubuntu.com/ubuntu focal-backports/universe amd64 c-n-f Metadata [224 B]
Get:58 http://archive.ubuntu.com/ubuntu focal-backports/multiverse amd64 c-n-f Metadata [116 B]
Fetched 27.8 MB in 7s (4,227 kB/s)
Reading package lists... Done
Building dependency tree
Reading state information... Done
5 packages can be upgraded. Run 'apt list --upgradable' to see them.
root@localhost:~# apt install git
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
  git-man libcurl3-gnutls liberror-perl libgdbm-compat4 libperl5.30 patch perl perl-modules-5.30
Suggested packages:
  git-daemon-run | git-daemon-sysvinit git-doc git-el git-email git-gui gitk gitweb git-cvs git-mediawiki git-svn
  diffutils-doc perl-doc libterm-readline-gnu-perl | libterm-readline-perl-perl make libb-debug-perl liblocale-codes-perl
The following NEW packages will be installed:
  git git-man libcurl3-gnutls liberror-perl libgdbm-compat4 libperl5.30 patch perl perl-modules-5.30
0 upgraded, 9 newly installed, 0 to remove and 5 not upgraded.
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
Fetched 12.7 MB in 2s (7,632 kB/s)
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
root@localhost:~# git clone https://github.com/atsign-foundation/dess.git
Cloning into 'dess'...
remote: Enumerating objects: 298, done.
remote: Counting objects: 100% (298/298), done.
remote: Compressing objects: 100% (212/212), done.
remote: Total 298 (delta 175), reused 198 (delta 81), pack-reused 0
Receiving objects: 100% (298/298), 38.48 KiB | 1.07 MiB/s, done.
Resolving deltas: 100% (175/175), done.
root@localhost:~# cd dess
root@localhost:~/dess# ls
base  code_of_conduct.md  CONTRIBUTING.md  create.sh  install_software.sh  LICENSE  README.md  scripts
root@localhost:~/dess# ./install_software.sh
Reading package lists... Done
Building dependency tree
Reading state information... Done
curl is already the newest version (7.68.0-1ubuntu2.5).
0 upgraded, 0 newly installed, 0 to remove and 5 not upgraded.
Reading package lists... Done
Building dependency tree
Reading state information... Done
Suggested packages:
  cryptsetup
The following NEW packages will be installed:
  hashalot
0 upgraded, 1 newly installed, 0 to remove and 5 not upgraded.
Need to get 15.2 kB of archives.
After this operation, 50.2 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu focal/universe amd64 hashalot amd64 0.3-8 [15.2 kB]
Fetched 15.2 kB in 0s (37.2 kB/s)
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
0 upgraded, 2 newly installed, 0 to remove and 5 not upgraded.
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
0 upgraded, 9 newly installed, 0 to remove and 5 not upgraded.
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
Fetched 69.2 MB in 5s (13.4 MB/s)
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
0 upgraded, 7 newly installed, 0 to remove and 5 not upgraded.
Need to get 262 kB of archives.
After this operation, 1,616 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu focal/universe amd64 python3-cached-property all 1.5.1-4 [10.9 kB]
Get:2 http://archive.ubuntu.com/ubuntu focal/universe amd64 python3-websocket all 0.53.0-2ubuntu1 [32.3 kB]
Get:3 http://archive.ubuntu.com/ubuntu focal/universe amd64 python3-docker all 4.1.0-1 [83.8 kB]
Get:4 http://archive.ubuntu.com/ubuntu focal/universe amd64 python3-dockerpty all 0.4.1-2 [11.1 kB]
Get:5 http://archive.ubuntu.com/ubuntu focal/universe amd64 python3-docopt all 0.6.2-2.2ubuntu1 [19.7 kB]
Get:6 http://archive.ubuntu.com/ubuntu focal/universe amd64 python3-texttable all 1.6.2-2 [11.0 kB]
Get:7 http://archive.ubuntu.com/ubuntu focal/universe amd64 docker-compose all 1.25.0-1 [92.7 kB]
Fetched 262 kB in 1s (411 kB/s)
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
Swarm initialized: current node (rql5pm26mdkpq8v8r469uh30a) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-4xcxtm59lzvq8ls5twcrj0jlim5up929vg7q3kf3dmew70b0x1-09cx8xaka7oyh18rvyl8y5whf 216.250.1                                                26.215:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

cwlnxpkdjgazg6xm11hyu96vp
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
root@localhost:~/dess#
root@localhost:~/dess#
root@localhost:~/dess# create.sh
create.sh: command not found
root@localhost:~/dess# ./create.sh
Usage create.sh <@sign> <fqdn> <port> <email>
Example create.sh @bob bob.example.com 6464 bob@example.com
root@localhost:~/dess# ./create.sh @bob  ionossecondary.shaduf.com 6464 colin@constable
Invalid email address
root@localhost:~/dess# ./create.sh @bob  ionossecondary.shaduf.com 6464 colin@constable.cc
Creating @bob with ionossecondary.shaduf.com:6464 with email colin@constable.cc
ATSIGN=@bob
DOMAIN=ionossecondary.shaduf.com
PORT=6464
EMAIL=colin@constable.cc
SECRET=83f710b11931912d57f23bab101e479394af411b71838d98a51a1b0b13d1179afcc7e0d2b0c4c084ea2e4bfd5b3669746759c36c418f0fa9d1aaf5                                                124d4321ea
Getting certificates
Creating network "bob_default" with the default driver
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
   Your certificate will expire on 2021-08-17. To obtain a new or
   tweaked version of this certificate in the future, simply run
   certbot again. To non-interactively renew *all* of your
   certificates, run "certbot renew"
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  202k  100  202k    0     0  3424k      0 --:--:-- --:--:-- --:--:-- 3483k
Starting secondary for @bob at ionossecondary.shaduf.com on port 6464 as ionossecondary on Docker
Creating service ionossecondary_secondary
Your QR-Code for @bob
█████████████████████████████████████████████████
█████████████████████████████████████████████████
████ ▄▄▄▄▄ █▀▄██▄█▀ █▀ █▀▀█▄ ▄▀▄▀▀▄▄▄█ ▄▄▄▄▄ ████
████ █   █ █▀█  ▀▀▀▀▄▄▄▄▄▄▀▀▀▄  ██▄███ █   █ ████
████ █▄▄▄█ █▀███ ▄▀▀▄▄▄▀▄▀▀▄▀▄▄▀▀  ▄██ █▄▄▄█ ████
████▄▄▄▄▄▄▄█▄█ █▄█▄█ ▀ ▀▄█▄▀▄▀ ▀ █▄█ █▄▄▄▄▄▄▄████
████▄▄▄▄▄▀▄ ▄█▄▀ █▄ ▀█ ▀▀ ▄█ ▀█ ▄   █▄▀▄▀ ▀ ▀████
████ █▄ █ ▄▄█▀▄▀▄ █ ▀  ▀▀▀█▀█▄▄▄▄▀▀▀▀▀▄▄  ▄▀█████
████▄█▀ ▄█▄▀▄██▄▄█▄█▀█▀▀▀▀ █▄▄ ▀█▄ ▀█▀▀█ ▀▄▀ ████
████████▀▀▄█▀▄▄ ▄▄▄ █▄████▄▄▄▀▀▄█▀▄▄▀ █▀▀▀ ▀▀████
████ ▄▀▄██▄▄█ ▀   ███  ▄█ █▄ ██ █▄ ▄▀▀▀▄▀█▄ ▀████
████   ▀ ▄▄ █  ▀█ █▄▀█▀▀ ▄█▄▄█ ▄▄ ▀  ▀▀ ▀█▄▀█████
████▀▀▀▄█▀▄█▀ ▀█▀█▄▄▀▄▀█▀ ▄▀▄▀▄ ▀▀ ▄█ ▄▀   ▀ ████
████▄▄▄█▀▄▄▀▄▀ █▀▄▄ █▄█ █▀▄▀▄▄▀ ▀▀▄ ▀ ▀▀▄█▀▀█████
████ █▀█▄▀▄▀███▀▄▄▄██▀ ▀████▀▄█▀▄ ▄█▀▄█▄▀█  █████
████▀ ▄▄█ ▄ ██▄ ▄▄█ ▀▄ ▀▀ ▄▀▀▄ ▄▄█▀▀ ▀▄▀▀█▄▀▄████
████▀ ▄ █▀▄  ▀▄█▄▀█▀▀ ▀▀ ▀▄ ▄ ███▀▀██▀▀▀  ▄▀▄████
████ █    ▄▀▀ ▄ ▄▀▄▀██▀▀█▀▄▀▄▀██▀▄▄▀  █▀▀█▄▀█████
████▄████▄▄▄ ▄▄  ▀███▄ ▀▀▀█▀█▀█ ▄ ▄▀ ▄▄▄ █▀▀ ████
████ ▄▄▄▄▄ █▄▄█▀▄ ▄▄▀▄  ▀▄█ ▄██▀▄▀▀  █▄█ ██ █████
████ █   █ █ ███▀█▄▄▀▄▀█▀▄▄▄▄▄▀ ██▀█▄ ▄▄▄  ▀▄████
████ █▄▄▄█ █ ▀▄█▀▄▄ ▀ ▀▄▀ ▄▄ ▀█▀▀▀▄██▄▄ ▄█▀ █████
████▄▄▄▄▄▄▄█▄█▄█▄▄█▄█▄▄▄█▄▄▄▄█▄█▄█▄██▄▄█▄████████
█████████████████████████████████████████████████
█████████████████████████████████████████████████
root@localhost:~/dess#
```

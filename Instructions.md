# Instructions v0.1.2+1

## Preparation
### You will need
- Freshly built Linux (virtual) machine
  - Arm v7, Arm64 or x86_64 architecture
  - Running Ubuntu, Debian, Raspberry Pi OS, CentOS, Fedora, RHEL, Rocky or
   Amazon Linux
- A static or Dynamic DNS address that points the machines IP interface
- A free port number that is accessible from the internet to your machine 
(1024-65535)
- An email address so you can get the SSL Certificate from LetsEncrypt.com
- An atSign from atsign.com

### Assumption
- We assume the machine we are installing on has no other software installed.
So carefully examine the scripts if for example you want to install a
specific version of docker. Hints are in the scripts on how to do this.

## Getting started
- Make sure you have root access via sudo for your account
  ```
  sudo -s
  # exit
  ```
- Debian and Ubuntu users may need to install curl first:
  ```
  sudo apt install curl
  ```
- Install the software and follow the prompts to install the atsign user
  ```
  curl -fsSL https://getdess.atsign.com | sudo bash
  ```
- Create a atServer, using the dess-create script and follow the instructions
  ```
  sudo dess-create
  ```
- If you need to see the QR code again for an atSign then run:
  ```
  dess-reshowqr @youratsign
  ```
- Sign in to the [atsign.com registrar](https://my.atsign.com) and update
your atSign DNS and port number
- Fire up an @ app like @buzz or @wavi and pair your device to your atServer
- You are done !

## If you want to start over

To completely delete the data from a atServer so that a new set of keys will
be generated:

- Go to the [atsign.com registrar](https://my.atsign.com) and:
  - Select `My atSigns`
  - Click on the atSign you'd like to reset then press the `Manage` button
  - Select `Reset`
  - Confirm the atSign and press `Yes, delete all data`
  - Click on `Manage` again then `Advanced Settings`
  - Enter Domain and Port information then press `Activate`
- On the dess machine
  - `sudo docker service scale [youratsign]_atServer=0`
  - `sudo -u atsign rm -rf ~atsign/atsign/@[youratsign]/*`
  - `sudo docker service scale [youratsign]_atServer=1`
  - `dess-reshowqr @[youratsign]`
- Re-pair the atSign with a mobile app
  - You may need to reset the atsign on the app first

## Moving a dess instance

It's possible to move a dess instance to another (virtual) machine.
Just `tar` up the contents of /home/atsign and extract the archive
onto a new machine with dess installed.

The respective services can then be regenerated:

```bash
ATSIGN=@[youratsign]
SERVICE=[youratsign]
sudo docker stack deploy -c /home/atsign/dess/$ATSIGN/docker-compose.yaml $SERVICE
```

The /home/atsign directory contains the following subdirectories:

### base

- `docker-swarm.yaml` Docker swarm template configuration
- `restart.sh` restart script for secondaries used when certs are refreshed
- `setup.sh` creates custom configs from template
- `shepherd.yaml` Docker swarm config for shepherd service that keeps
seondary images up to date

### dess

Holds customised atSign directories that contain:

- `.env` takes input from `create-dess` script for use as environment variables
- `docker-compose.yaml` customised Docker swarm config for atServer
- `docker-swarm.yaml` Docker swarm template configuration

### atSign

- `etc` Used for LetsEncrypt certificates

Also holds customised atSign directories that contain logs, and persistence for
the hive datastore.

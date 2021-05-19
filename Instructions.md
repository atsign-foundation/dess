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
- Create a secondary, using the create.sh script and follow the instructions
    ```
    ./create.sh
  ```
- Sign in to the atsign.com registrar and update your @signs DNS and port number information
- Fire up an @ app like @buzz or @wavi and pair your device to your secondary
- You are done !



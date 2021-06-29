# Instructions v0.1.1+1

## Preparation
### You will need
- Freshly built Linux machine (Ubuntu/Debian/CentOS)
- A static or Dynamic DNS address that points the machines IP interface
- A free port number that is accessible from the internet to your machine (1024-65535)
- An email address so you can get the SSL Certificate from LetsEncrypt.com
- An @sign from atsign.com

### What is missing right now
- The intent is to provide this environment for AMD64/ARM32/ARM64 CPU architectures but 0.1.1 supports only AMD64/ARM64
- We assume the machine we are installing on has no other software installed. So carefully examine the scripts if for example you want to install a specific version of docker. Hints are in the scripts on how to do this

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
  curl -fsSL https://raw.githubusercontent.com/atsign-foundation/dess/trunk/getdess.sh | sudo bash
  ```
- Create a secondary, using the create.sh script and follow the instructions
  ```
  dess-create
  ```
- If you need to see the QR code again for an @sign then run:
  ```
  dess-reshowqr @youratsign
  ```
- Sign in to the atsign.com registrar and update your @signs DNS and port number information
- Fire up an @ app like @buzz or @wavi and pair your device to your secondary
- You are done !



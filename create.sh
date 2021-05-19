#!/bin/bash
if [[ $# -eq 0 || $# -gt 4 ]] ; then
    echo 'Usage create.sh <@sign> <fqdn> <port> <email>'
    echo "Example create.sh @bob bob.example.com 6464 bob@example.com"
    exit 0
fi

export env ATSIGN=$1
export env FQDN=$2
export env PORT=$3
export env EMAIL=$4

# Let's make a secret whilst we are here !
# hashalot should have been installed by now
export env SECRET=`head -30 /dev/urandom |hashalot -x sha512`

# Check that we have an @ in the @sign
if [[ ! $ATSIGN  =~ ^@.*$ ]]
then
    tput setaf 1
    echo "include @ in @sign"
    tput setaf 9
    exit 1
fi
# Check that we have at least one . in the FQDN
if [[ ! $FQDN  =~  ^.*\..*$ ]]
then
    tput setaf 1
    echo "include . in fqdn"
    tput setaf 9
    exit 1
fi

# Check we have a port number over 1024 and less that 65535
if [[ ! (($PORT -gt 1024) && ($PORT -lt 65535)) ]]
then
    tput setaf 1
    echo "Port number not in range 1024-65535"
    tput setaf 9
    exit 1
fi

# Check if port number is in use
ss -tulwn | grep LISTEN |grep ":$PORT " > /dev/null 2>&1
OPEN=$?
if [[ $OPEN -eq 0 ]]
then
    tput setaf 1
    echo "Port number is in use"
    tput setaf 9
    exit 1
fi

# Check to make sure we have a valid email
if [[ ! "$EMAIL" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$ ]]
then
    tput setaf 1
    echo "Invalid email address"
    tput setaf 9
    exit 1
fi

# Confirm arguments look valid
    tput setaf 2
    echo "Creating $ATSIGN with $FQDN:$PORT with email $EMAIL"
    tput setaf 9


# Copy files in from base
sudo -u atsign mkdir -p ~atsign/dess/$ATSIGN
sudo -u atsign cp  base/.env ~atsign/dess/$ATSIGN
sudo -u atsign cp  base/docker-compose.yaml ~atsign/dess/$ATSIGN
sudo -u atsign cp  base/docker-swarm.yaml ~atsign/dess/$ATSIGN
# Make the directories in atsign
sudo ls -la ~atsign/atsign
sudo -u atsign mkdir -p ~atsign/atsign/$ATSIGN/storage
sudo ls -la ~atsign/atsign
# Make the edits to the .env file
# First comment out everything
sudo -u atsign sed -i 's/^\([^#].*\)/# \1/g' ~atsign/dess/$ATSIGN/.env
# Add the environment variables we need
echo "ATSIGN=$ATSIGN" |sudo -u atsign tee -a  ~atsign/dess/$ATSIGN/.env
echo "_ATSIGN=$_ATSIGN" |sudo -u atsign tee -a  ~atsign/dess/$ATSIGN/.env
echo "DOMAIN=$FQDN" |sudo -u atsign tee -a ~atsign/dess/$ATSIGN/.env
echo "PORT=$PORT" |sudo -u atsign tee -a  ~atsign/dess/$ATSIGN/.env
echo "EMAIL=$EMAIL" |sudo -u atsign tee -a  ~atsign/dess/$ATSIGN/.env
echo "SECRET=$SECRET" |sudo -u atsign tee -a  ~atsign/dess/$ATSIGN/.env

# Get the certificate for the @sign
    tput setaf 2
    echo "Getting certificates"
    tput setaf 9

     sudo -u atsign docker-compose --env-file ~atsign/dess/$ATSIGN/.env -f ~atsign/dess/$ATSIGN/docker-compose.yaml run  --service-ports cert

# Last task to put in place the restart script and regenerate the ssl root CA file (as root)
# Root CA
sudo curl -L -o  ~atsign/atsign/etc/live/$FQDN/cacert.pem https://curl.se/ca/cacert.pem
# Put some ownership in place so atsign can read the certs
sudo chown -R atsign:atsign ~atsign/atsign/$ATSIGN
sudo chown -R atsign:atsign ~atsign/atsign/etc/live/$FQDN
sudo chown -R atsign:atsign ~atsign/atsign/etc/archive/$FQDN
# Copy over restart script
sudo cp base/restart.sh ~atsign/atsign/etc/renewal-hooks/deploy
#
#
# We are now ready to start the secondary !
    tput setaf 2
# It would be nice to use the @sign for the name but
# Docker insists on a name that is DNS compliant and so emojis and @ signs are out
# So instead we can use well known name derived from the DNS host name
DNAME=${FQDN/.*/}
    echo Starting secondary for $ATSIGN at $FQDN on port $PORT as $DNAME on Docker
sudo -u atsign docker-compose --env-file ~atsign/dess/$ATSIGN/.env -f ~atsign/dess/$ATSIGN/docker-swarm.yaml config > /tmp/$ATSIGN
sudo -u atsign docker stack deploy -c /tmp/$ATSIGN $DNAME
sudo -u atsign rm /tmp/$ATSIGN
     echo Your QR-Code for $ATSIGN
     tput setaf 9
qrencode -t ANSIUTF8 "${ATSIGN}:${SECRET}"


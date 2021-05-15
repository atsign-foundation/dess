#!/bin/bash
# Source the environment
source .env
if [[ "${ATSIGN}" == "<@sign>" ]]
        then
        tput setaf 1
        echo Please edit the .env file before running setup.sh
        tput setaf 9
        exit 1
fi
# Put a directory in place for the secondary
mkdir ~/atsign/$ATSIGN
# Pu the root SSL certs in place
curl -L -o  /etc/letsencrypt/live/$ATSIGN/cacert.pem https://curl.se/ca/cacert.pem
# Put the restart script in place
cp ./restart.sh  ~/atsign/etc/renewal-hooks/deploy
# Finally get the certificate in place
docker-compose up cert

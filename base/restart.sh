#!/bin/sh
# Get the latest root certs
curl -L -o  /etc/letsencrypt/live/$RENEWED_DOMAINS/cacert.pem https://curl.se/ca/cacert.pem
#
# Touch the restart file to notify the Secondary that it has a new SSL certificate to install
# It will do this when it has time and is not busy with other work
touch /etc/letsencrypt/live/$RENEWED_DOMAINS/restart
# Get the ownership correct for atsign
sudo chown -R atsign:atsign ~atsign/atsign/etc/live/$FQDN
sudo chown -R atsign:atsign ~atsign/atsign/etc/archive/$FQDN


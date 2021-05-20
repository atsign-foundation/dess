#!/bin/sh
echo updating $RENEWED_DOMAINS certificates
# Get the latest root certs (if they have changed)
curl --time-cond  -L -o  ~atsign/atsign/etc//live/$RENEWED_DOMAINS/cacert.pem https://curl.se/ca/cacert.pem
#
# Touch the restart file to notify the Secondary that it has a new SSL certificate to install
# It will do this when it has time and is not busy with other work
# Get the ownership correct for atsign
touch ~atsign/atsign/etc//live/$RENEWED_DOMAINS/restart
chown -R atsign:atsign ~atsign/atsign/etc/live/$RENEWED_DOMAINS
chown -R atsign:atsign ~atsign/atsign/etc/archive/$RENEWED_DOMAINS


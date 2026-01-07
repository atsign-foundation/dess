#!/bin/sh
echo "Updating ${RENEWED_DOMAINS} certificates"
LIVEDIR="~atsign/atsign/etc/live/${RENEWED_DOMAINS}"
MTLSFC="${LIVEDIR}/mtls/fullchain.pem"
MTLSPK="${LIVEDIR}/mtls/privkey.pem"
ARCHIVEDIR="~atsign/atsign/etc/archive/${RENEWED_DOMAINS}"
ATCASBASE="https://raw.githubusercontent.com/atsign-foundation/at_server/trunk"
ATCASFILE="/packages/at_secondary_server/cacert/cacert.pem"
# Get new mTLS certs
mkdir -p "${LIVEDIR}/mtls"
step ca certificate "${RENEWED_DOMAINS}" "${MTLSFC}" "${MTLSPK}"
# Get the latest root certs (if they have changed)
curl --time-cond  -L -o  "${LIVEDIR}"/cacert.pem "${ATCASBASE}${ATCASFILE}"
# Touch the restart file to notify the atServer that it has a new TLS
# certificate to install. It will do this when it has time and is not
# busy with other work.
touch ~atsign/atsign/etc/live/"$RENEWED_DOMAINS"/restart
# Get the ownership correct for atsign
chown -R atsign:atsign "${LIVEDIR}"
chown -R atsign:atsign "${ARCHIVEDIR}"

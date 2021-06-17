#!/bin/bash
if [[ $# -eq 0 || $# -gt 1 ]] ; then
    echo 'Usage reshow.sh <@sign>'
    echo "Example ./reshowqr.sh @bob"
    exit 1 
fi
. ~atsign/dess/$1/.env
qrencode -t ANSIUTF8 "${ATSIGN}:${SECRET}"

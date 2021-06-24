#!/bin/bash
if [[ $# -eq 0 || $# -gt 1 ]] ; then
    echo 'Usage dess-reshowqr <@sign>'
    echo "Example dess-reshowqr @bob"
    exit 1 
fi
if [[ ! -f ~atsign/dess/$1/.env ]]
then
    echo "Can't find $1, please check for typos."
    exit 2
fi
. ~atsign/dess/"$1"/.env
qrencode -t ANSIUTF8 "${ATSIGN}:${SECRET}"

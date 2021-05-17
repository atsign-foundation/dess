#!/bin/bash
if [[ $# -eq 0 || $# -gt 6 ]] ; then
    echo 'Usage create <@sign> <fqdn> <port> <email>'
    exit 0
fi

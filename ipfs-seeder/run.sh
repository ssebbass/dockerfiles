#!/bin/bash
set -xe

if [[ -n $DNSLINK ]]; then

  /usr/local/bin/ipfs init
  /usr/local/bin/ipfs daemon &

  sleep 30

  while [[ true ]]; do
    /usr/local/bin/ipfs pin add $(dig $DNSLINK txt +short | tr -d \" | awk -F \= '{ print $2 }')
    sleep 600
  done

else
  echo "Please set DNSLINK variable"
fi




#!/bin/bash
set -x

if [ ! -z "${URL}" ]; then
  while true; do
    eval "curl {$URL} >/dev/null"
    sleep .$[ ( $RANDOM % 10 ) + 1 ]s
  done
else
  echo "Please set URL env variable"
  exit 1
fi

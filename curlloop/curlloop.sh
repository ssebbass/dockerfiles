#!/bin/sh
set -xe

if [ ! -z "${URL}" ]; then
  while true; do
    curl "${URL}"
    sleep "${SLEEP}"
  done
else
  echo "Please set URL env variable"
  exit 1
fi


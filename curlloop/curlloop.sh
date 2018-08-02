#!/bin/sh
set -x

if [ ! -z "${URL}" ]; then
  while true; do
    curl "${URL}" >/dev/null
    sleep "${SLEEP}"
  done
else
  echo "Please set URL env variable"
  exit 1
fi


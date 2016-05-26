#!/bin/bash
set -e
REPO="ssebbass"

function build {
    if [ "$(grep "$REPO/ubuntu32" $1/Dockerfile >/dev/null 2>&1 ; echo $?)" = "0" ]; then
      set -x
      docker build -t $REPO/$1 ./$1
      docker push $REPO/$1
      set +x
    else
      echo "Not 32bit based img, not building..."
    fi
}

function multi {
  echo "Running multi build..."
  for DIR in */ ; do 
    build $(basename $DIR)
  done
}

function single {
  echo "Running \"$1\" build..."
  build $1
}

function main {
  if [ "$1" != "" ]; then
    single $1
  else
    multi
  fi
}

main $1

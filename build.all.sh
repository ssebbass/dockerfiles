#!/bin/bash
set -x
set -e

for DIR in */ ; do 
  IMG="$(basename $DIR)"
  docker build -t ssebbass/$IMG ./$IMG/
done

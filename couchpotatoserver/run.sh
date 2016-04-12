#!/bin/sh
set -x

cd /opt/CouchPotatoServer
git pull
exec python CouchPotato.py


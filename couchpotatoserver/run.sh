#!/bin/sh
set -x

cd /opt/CouchPotatoServer
git pull
exec su - couchpotato -c "python CouchPotato.py"


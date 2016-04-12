#!/bin/sh
set -ex

cd /opt/CouchPotatoServer
git pull
exec su - couchpotato -c "cd /opt/CouchPotatoServer && python CouchPotato.py"


#!/bin/sh
set -x

cd /opt/CouchPotatoServer && git pull
exec /usr/bin/python /opt/CouchPotatoServer/CouchPotato.py

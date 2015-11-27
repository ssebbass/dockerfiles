#!/bin/bash
set -e
echo "eula=true" > eula.txt

VERSIONS="https://s3.amazonaws.com/Minecraft.Download/versions/versions.json"
VERSION=$( wget -O - $VERSIONS 2>/dev/null | grep latest -2 | grep release | awk '{ print $2 }' | tr -d \" | tr -d '[[:space:]]' )
wget https://s3.amazonaws.com/Minecraft.Download/versions/$VERSION/minecraft_server.$VERSION.jar

cd /srv



if [ -n "$ICON" -a ! -e server-icon.png ]; then
  echo "Using server icon from $ICON..."
  # Not sure what it is yet...call it "img"
  wget -q -O /tmp/icon.img $ICON
  specs=$(identify /tmp/icon.img | awk '{print $2,$3}')
  if [ "$specs" = "PNG 64x64" ]; then
    mv /tmp/icon.img /data/server-icon.png
  else
    echo "Converting image to 64x64 PNG..."
    convert /tmp/icon.img -resize 64x64! /data/server-icon.png
  fi
fi

exec java $JVM_OPTS -jar $SERVER

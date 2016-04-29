#!/bin/bash
set -xe

# chown -R sonarr:sonarr /home/sonarr
mono /opt/NzbDrone/NzbDrone.exe --no-browser -data=/home/sonarr/data

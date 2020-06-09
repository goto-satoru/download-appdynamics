#!/bin/sh

echo "Latest AppDynamics Platform setup script donwload URL:\n"
curl -s https://download.appdynamics.com/download/downloadfilelatest/ | \
  jq -r .[].download_path | grep platform-setup | grep sh$
echo

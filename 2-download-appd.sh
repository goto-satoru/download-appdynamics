#!/bin/sh

if [ $# -ne 3 ]; then
  echo "***\nusage: $0 user_name password download_path\n\n"
  exit 1
fi

USERNAME=$1
PASSWORD=$2
URL=$3
access_token=`curl -s -X POST -d "{\"username\": \"$USERNAME\",\"password\": \"$PASSWORD\",\"scopes\": [\"download\"]}" https://identity.msrv.saas.appdynamics.com/v2.0/oauth/token | jq -r .access_token`

echo "\naccess_token:\n$access_token"
echo "\ndownload URL:\n$URL"

curl -L -O -H "Authorization: Bearer $access_token " $URL

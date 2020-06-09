#!/bin/sh

if [ $# -ne 1 ]; then
  echo "usage $0 download_指定された引数は$#個です。" 1>&2
  echo "実行するには3個の引数が必要です。" 1>&2
  exit 1
fi

USERNAME=""
PASSWORD=""
URL=$1

access_token=`curl -s -X POST -d "{\"username\": \"$USERNAME\",\"password\": \"$PASSWORD\",\"scopes\": [\"download\"]}" https://identity.msrv.saas.appdynamics.com/v2.0/oauth/token | jq -r .access_token`

echo "access_token: $access_token"
echo "download URL: $URL'

curl -L -O -H "Authorization: Bearer $access_token" $URL

#!/bin/bash
URL="http://16.171.174.229/:5000"
curl -s --connect-timeout 5 "$URL" > test.txt
if [ -s test.txt ]; then
  echo " updating deployment"
  bash deployment.sh
else
  echo " New deployment"
  bash deployment_first.sh
fi

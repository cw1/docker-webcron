#!/bin/sh

# Check if URL is set
if [ -z "${URL}" ]; then
  exit 1
fi

# Check if INTERVAL_TIME is set
if [ -z "${INTERVAL_TIME}" ]; then
  INTERVAL_TIME=300
fi

# Infinite loop
while :
do
  curl ${CURL_PARAM} "${URL}"
  sleep "${INTERVAL_TIME}"
done

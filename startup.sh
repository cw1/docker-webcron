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
  CURRENT_TIME="@$(date +%s)"
  if [ -z "${MATCHING_DAY}" ] || [ "${MATCHING_DAY}" -eq "$(date -d ${CURRENT_TIME} +%w)" ]; then
    if [ -z "${MATCHING_HOUR}" ] || [ "${MATCHING_HOUR}" -eq "$(date -d ${CURRENT_TIME} +%H)" ]; then
      if [ -z "${MATCHING_MINUTE}" ] || [ "${MATCHING_MINUTE}" -eq "$(date -d ${CURRENT_TIME} +%M)" ]; then
        curl ${CURL_PARAM} "${URL}"
      fi
    fi
  fi
  sleep "${INTERVAL_TIME}"
done

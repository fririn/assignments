#!/bin/bash


while true; do
  response=$(curl -s -o /dev/null -w "%{http_code}" "https://getblock.io")
  echo "$response"

  if [[ ! "$response" =~ [23][0-9]{2} ]]; then
    exit 1
  fi
  sleep 2
done

#!/usr/bin/env bash
echo "Launching script"

set -e

echo "---"

wait_for_port() {
  echo "- function start"

  local port=$1
  count=0
  while true; do
    ((count++))
    echo "- curling"
    curl example.com:${port} -I -f > /dev/null
    if [ "$?" == "0" ]
    then
      echo "- [✓] Web Server is up!"
      exit 0
    fi
    echo "- [✗] Connection refused on port $port. Waiting 1 second..."
    echo $count
    sleep 1
  done
}

echo "Waiting for port 8000"
wait_for_port 8000


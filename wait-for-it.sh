#!/bin/bash
# wait-for-it.sh
# 
# This script will wait for a host and port to be available before continuing.
# It is useful for synchronizing the spin-up of interdependent services.

set -e

host="$1"
port="$2"
timeout="$3"

usage() {
  echo "Usage: $0 host port [timeout]"
  exit 1
}

if [ -z "$host" ] || [ -z "$port" ]; then
  usage
fi

shift 2

until nc -z "$host" "$port"; do
  >&2 echo "$host:$port is unavailable - sleeping"
  if [ "$timeout" -gt 0 ]; then
    timeout=$((timeout - 1))
    if [ "$timeout" -eq 0 ]; then
      >&2 echo "Timeout reached - $host:$port still unavailable"
      exit 1
    fi
  fi
  sleep 1
done

>&2 echo "$host:$port is available"

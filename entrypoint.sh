#!/bin/bash
set -e

# clear previous data
rm -f /usr/src/app/tmp/pids/server.pids

# execute main process (CMD from Dockerfile)
exec /usr/src/app/entrypoint.sh

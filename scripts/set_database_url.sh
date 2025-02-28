#!/bin/bash

# Dump all environment variables for debugging
# echo "=== Environment Variables ==="
# env | sort
# echo "==========================="

ENCODED_PASSWORD=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$POSTGRES_PASSWORD', safe=''))")

# Construct the DATABASE_URL from other environment variables
export DATABASE_URL="postgresql://${POSTGRES_USER}:${ENCODED_PASSWORD}@${POSTGRES_HOST}:5432/zookeeper"

# echo "DATABASE_URL: ${DATABASE_URL}"

# Execute the original command
exec "$@"
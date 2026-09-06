#!/bin/bash

echo "================================="
echo "Running OpsMate Container"
echo "================================="

cd "$(dirname "$0")/.."

docker rm -f opsmate-container 2>/dev/null || true

docker run -d \
  --name opsmate-container \
  -p 8080:8080 \
  opsmate:1.0

echo ""
echo "OpsMate container started."
echo ""

docker ps | grep opsmate-container

echo ""
echo "Testing application..."
curl http://localhost:8080/health
echo ""

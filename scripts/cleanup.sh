#!/bin/bash

echo "================================="
echo "Cleaning Up OpsMate"
echo "================================="

docker stop opsmate-container 2>/dev/null || true
docker rm opsmate-container 2>/dev/null || true

echo ""
echo "Container removed."

docker images | grep opsmate || true

echo ""
echo "Cleanup completed."

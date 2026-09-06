#!/bin/bash

echo "================================="
echo "Building OpsMate Docker Image"
echo "================================="

cd "$(dirname "$0")/.."

docker build -t opsmate:1.0 .

echo ""
echo "Docker image built successfully."
echo ""

docker images | grep opsmate

#!/bin/bash

echo "================================="
echo "Installing Docker"
echo "================================="

sudo apt update
sudo apt install -y docker.io

sudo systemctl start docker
sudo systemctl enable docker

echo ""
echo "Docker installation completed."
echo ""

docker --version
sudo systemctl status docker --no-pager

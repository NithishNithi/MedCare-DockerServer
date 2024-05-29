#!/bin/bash

# Function to clean up Docker containers
cleanup() {
    # Execute docker-compose down
    sudo /usr/bin/docker compose down

    echo "Cleaned up Docker containers"
    exit 0
}

# Trap Ctrl+C signal and call cleanup function
trap cleanup SIGINT

# Create Docker network
sudo /usr/bin/docker network create medcare-network

# Start Docker Compose
sudo /usr/bin/docker compose up -d

echo "Docker compose up Success"

# Wait for Ctrl+C
while true; do
    sleep 1
done

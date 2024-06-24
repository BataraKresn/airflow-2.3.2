#!/bin/bash

# Check if the network already exists
if ! docker network inspect hadoop_network &>/dev/null; then
  # Create new network if it doesn't exist
  docker network create hadoop_network
fi

# Create Image Airflow:2.3.2
# docker build -t apache/airflow:2.3.2 . no-cache

# without caching on container or image new
# usign --no-cache
# like 
docker compose up -d

# Start the Containers with the New Image:
# docker compose up -d --force-recreate

sleep 10
# up airflow flower
docker compose --profile flower up -d

echo "Current dir is $PWD"
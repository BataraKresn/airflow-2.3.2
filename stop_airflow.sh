#!/bin/bash

docker compose down

sleep 10
# up airflow flower
docker compose down flower

echo "Current dir is $PWD"
echo " Thank You"
#!/bin/sh

echo "Pull the latest docker images and start the ecosystem.Ai services on x86 platform."
echo "The following services will be started:"
echo "1. Prediction Server"
echo "2. Workbench"
echo "3. Runtime Engine x 3"
echo "4. Python Notebooks"
echo ""

docker network create ecosystem

docker compose --env-file .env -f docker-compose.yml down
docker compose --env-file .env -f docker-compose.yml pull
docker compose --env-file .env -f docker-compose.yml up -d

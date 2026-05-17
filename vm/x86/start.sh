#!/bin/sh

echo "Start the ecosystem.Ai services on x86 platform."
echo "The following services will be started:"
echo "1. Prediction Server"
echo "2. Workbench"
echo "3. Runtime Engine x 3"
echo "4. Python Notebooks"
echo ""
echo "Usage: ./start.sh [--pull]"
echo "  --pull  Pull latest images before starting, then prune unused images"
echo ""

if [ "$1" = "--pull" ]; then
    echo "Pulling latest docker images..."
    docker compose --env-file .env -p eai -f docker-compose.yml pull
fi

echo "Starting up..."
docker compose --env-file .env -p eai -f docker-compose.yml up -d

if [ "$1" = "--pull" ]; then
    echo "Pruning unused docker images..."
    docker system prune -af
fi

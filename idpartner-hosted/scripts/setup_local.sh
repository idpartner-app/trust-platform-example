#!/bin/bash

# Load ENV vars
source .env.database

ROOT_DIR=`dirname $(pwd)`
MIGRATIONS_IMAGE=mock-bank-migrations

############################################################################
#
#           MAIN
#
############################################################################

echo "Setting up Trust Platform locally..."

# Start services
docker compose up --detach --remove-orphans --wait
if [ $? -ne 0 ]; then
  exit 1
fi

# Give the services a few seconds to come up
echo "Preparing to run migrations and seeds please wait..."
sleep 30

# Run migrations
echo "docker run --rm -e SQL_USER=${SQL_USER} -e SQL_PASSWORD=${SQL_PASSWORD} -e SQL_DATABASE=${SQL_DATABASE} -e SQL_HOST=${SQL_HOST} ${MIGRATIONS_IMAGE}"
docker run --rm -e SQL_USER=${SQL_USER} -e SQL_PASSWORD=${SQL_PASSWORD} -e SQL_DATABASE=${SQL_DATABASE} -e SQL_HOST=${SQL_HOST} ${MIGRATIONS_IMAGE}
if [ $? -ne 0 ]; then
  exit 1
fi

# Run seeds
docker run --rm -e SQL_USER=${SQL_USER} -e SQL_PASSWORD=${SQL_PASSWORD} -e SQL_DATABASE=${SQL_DATABASE} -e SQL_HOST=${SQL_HOST} ${MIGRATIONS_IMAGE} yarn seed
if [ $? -ne 0 ]; then
  exit 1
fi

# Stop services
docker compose down
if [ $? -ne 0 ]; then
  exit 1
fi

echo "Setup FINISHED."
echo ""
echo "From this point onward you should run 'docker compose up' to start the Trust Platform"
echo ""
echo ""

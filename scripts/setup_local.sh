#!/bin/bash

PG_DATA_OVERRIDE=/tmp/idpartner/pg_data
ROOT_DIR=`dirname $(pwd)`
MIGRATIONS_IMAGE=mock-bank-migrations

usage () {
  echo ""
  echo "${0} - will start Trust Platform locally using the specified directory as PGData for PGSQL"
  echo ""
  echo "  Usage: ${0} { PG_DATA_OVERRIDE_DIR }"
  echo ""
  echo "  Examples:"
  echo "     ${0} - to start Trust Platform with PGSQL pgdata defaulting to ${PG_DATA_OVERRIDE}"
  echo "     ${0} /path/to/pg_data - to start Trust Platform with PGSQL pgdata pointing to the specified location"
  echo ""
}

############################################################################
#
#           MAIN
#
############################################################################

echo "Setting up Trust Platform locally..."

if [ $# = 1 ]; then
  echo "Using specified PG_DATA directory: ${1}"
  PG_DATA_OVERRIDE=${1}
else
  echo "Creating directory ${PG_DATA_OVERRIDE}"
  mkdir -p ${PG_DATA_OVERRIDE}
fi

echo "PG_DATA_OVERRIDE exported as: ${PG_DATA_OVERRIDE}"
export PG_DATA_OVERRIDE

# Start services
docker compose up --detach --remove-orphans --wait
if [ $? -ne 0 ]; then
  exit 1
fi

# Give the services a few seconds to come up
echo "Preparing to run migrations and seeds please wait..."
sleep 20

# Run migrations
docker run --rm -e SQL_USER=postgres -e SQL_PASSWORD=welcome1 -e SQL_DATABASE=idpartner -e SQL_HOST=docker.for.mac.localhost ${MIGRATIONS_IMAGE}
if [ $? -ne 0 ]; then
  exit 1
fi

# Run seeds
docker run --rm -e SQL_USER=postgres -e SQL_PASSWORD=welcome1 -e SQL_DATABASE=idpartner -e SQL_HOST=docker.for.mac.localhost ${MIGRATIONS_IMAGE} yarn seed
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
echo "Your PGSQL local database files are located in: ${PG_DATA_OVERRIDE}"
echo ""
echo ""

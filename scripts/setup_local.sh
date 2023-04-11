#!/bin/bash

PG_DATA_OVERRIDE=/tmp/idpartner/pg_data
ROOT_DIR=`dirname $(pwd)`
MIGRATIONS_IMAGE=idpartner-mock-bank-migrations

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

echo "PG_DATA_OVERRIDE set to: ${PG_DATA_OVERRIDE}"
export PG_DATA_OVERRIDE

# Start services
docker compose up --detach --remove-orphans

# Give the services 20s to come up
echo "Preparing to run idpartner migrations please wait..."
sleep 30

# Run migrations
docker run -e SQL_USER=postgres -e SQL_PASSWORD=welcome1 -e SQL_DATABASE=idpartner -e SQL_HOST=docker.for.mac.localhost ${MIGRATIONS_IMAGE}

# Run seeds
docker run -e SQL_USER=postgres -e SQL_PASSWORD=welcome1 -e SQL_DATABASE=idpartner -e SQL_HOST=docker.for.mac.localhost ${MIGRATIONS_IMAGE} yarn seed

# Stop services
docker compose down

echo "Setup FINISHED."
echo ""
echo "From this point onward you should run 'docker compose up' to start the Trust Platform"
echo ""
echo "Your PGSQL local database files are located in: ${PG_DATA_OVERRIDE}"
echo ""
echo ""

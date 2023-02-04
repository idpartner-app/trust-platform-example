# Trust Platform Example
This project contains the intructions to get an example of the IDPartner Trust Platform environment up and running in a few minutes.

To setup the Trust Platform environment we use [docker compose](https://docs.docker.com/compose/). The compose file with the configuration to start the environment can be found [here](docker-compose.yml).

The compose file is configured to start the following services:
- **Redis**. Runs on port 6379.
- **Postgres**. Runs on port 5432.
- **Bank-oauth2-example-service**. Runs on port 9101.
- **Authorization-adapter-service**. Runs on port 9102.
- **Oidc-provider-service**. Runs on port 9001.

If for any reason you have Redis, Postgres and/or an OAuth2 service already running and you would like to connect to those instead of connecting to the ones included in the compose file feel free to update it as needed.

Complete the sections below to get the environment up and running.

# Docs
1. [Prerequisites](docs/prerequisites.md)
1. [Common configuration](docs/common-configuration.md)
1. [Configuring the bank-oauth2-example-service](docs/configuring-bank-oauth2-example-service.md)
1. [Configuring the authorization-adapter-service](docs/configuring-authorization-adapter-service.md)
1. [Configuring the oidc-provider-service](docs/configuring-oidc-provider-service.md)
1. [Running the Trust Platform](docs/running-trust-platform.md)
# Trust Platform Example
This project contains the instructions on how to configure the IDPartner Trust Platform and integrate with an OAuth Identity Provider. We provide an example oauth service which uses Stytch to manage the login credentials.

This example uses docker-compose to configure and setup the environment.  The compose file is configured to start the following services:

- **Redis**. Runs on port 6379.
- **Postgres**. Runs on port 5432.
- **Trust-platform-services**. Runs on port 9501.
- **Bank-identity-example-service**. Runs on port 9702.

Note: If you have Redis, Postgres and/or an OAuth2 service already running and you would like to connect to those instead of connecting to the ones included in the compose file feel free to update it as needed.

# Getting Started
1. [Prerequisites](docs/prerequisites.md)
1. [Common configuration](docs/initial-setup.md)
1. [Configuring the bank-identity-example-services](docs/configuring-bank-identity-example-services.md)
2. [Configuring the trust-platform-services](docs/configuring-trust-platform-services.md)
3. [Running the Trust Platform](docs/running-trust-platform.md)
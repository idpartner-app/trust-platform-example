# Self-hosted Trust Platform Example
This project provides instructions for configuring the Self-hosted IDPartner Trust Platform and integrating it with the Bank Services.

This example leverages docker-compose to configure and set up the environment. The compose file is designed to initiate the following services:
- **Redis**. Runs on port 6379.
- **Postgres**. Runs on port 5432.
- **Trust-platform-services**. Runs on port 9501.
- **Bank-services**. Runs on port 9702.

Note: If you already have Redis, Postgres, and/or an OAuth2 service running and prefer to connect to those instead of the services included in the compose file, feel free to modify the [.env file](./.env) as necessary.

# Getting Started
To begin, follow these steps in order:
1. [Prerequisites](docs/prerequisites.md)
1. [Common configuration](docs/initial-setup.md)
1. [Configuring the bank-services](docs/configuring-bank-services.md)
1. [Configuring the trust-platform-services](docs/configuring-trust-platform-services.md)
1. [Running the Trust Platform](docs/running-trust-platform.md)
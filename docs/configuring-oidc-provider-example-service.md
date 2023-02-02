# Configuring the oidc-provider-example-service

> This step is required only if you do not have an OAuth2 service running yet. If you already have an OAuth2 service up and running feel free to skip this section.

> This service is not part of the IDPartner Trust Platform. This is just an example of an OIDC/OAuth2 service and we include it in this guideline only to illustrate how to integrate the Trust Platform with a preexisting service. The usage of this service in production is strongly discuraged.

This guideline will help to configure the section [services.bank-oidc-provider-example-service](https://github.com/idpartner-app/trust-platform-example/blob/3f15783d65578800648788bc25448c0c2cb272ce/docker-compose.yml#L21) in the docker compose file.

1. Make sure you have followed the instructions in [Common Configuration](docs/common-configuration.md) if you haven't. Otherwise please continue.
1. Update references to localhost. The configuration in the compose file assumes you are using [Docker for Mac](https://docs.docker.com/desktop/install/mac-install/). Because of that you will notice that some URLs in the configuration point to `docker.for.mac.localhost` instead of `localhost`. If you are not using Docker for Mac make sure you update the references to point to the localhost that resolves for your environment.
2. Configure OAuth2 client credentials. For the sake of simplicity this service only supports one OAuth2 client. The client id is `foo` and the client secret is `bar`. This will be used later when we configure the [authorization-adapter-service](docs/configuring-authorization-adapter-service.md). Feel free to change them if needed.
iC
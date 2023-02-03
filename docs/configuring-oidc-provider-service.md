# Configuring the oidc-provider-service
This guideline will help to configure the section [services.oidc-provider-service](https://github.com/idpartner-app/trust-platform-example/blob/trustPlatformExample/docker-compose.yml#L89) in the docker compose file.

1. Please follow the instructions in [Common Configuration](docs/common-configuration.md). If you already have please continue.
1. Configure the IDP UUID. Get the UUID you got from the [IDP Registration](docs/registering-idps.md) and set it to `IDENTITY_PROVIDER_UUID`.
1. Configure the Postgres connection. The service is configured to connect to the database that's spin up by the docker compose command. If you want to connect to a different database feel free to update the `SQL_DATABASE`, `SQL_HOST`, `SQL_PASSWORD`, `SQL_USER` and optionally the `PGSSLMODE`.
1. Configure the Redis connection. The service is configured to connect to the redis that's spin up by the docker compose command. If you want to connect to a different redis instance feel free to update the `REDIS_HOST` and `REDIS_PORT`.
1. Configure Sentry. The default tool to do error tracking is Sentry. If you want to enable it follow their [setup guide](https://sentry.io/signup/). Create a Sentry DSN and set it to `SENTRY_DSN`. If you do not want to configure Sentry just leave the configuration as is.
1. Configure the Trust Package API. If you want to validate the content of the IDPartner Trust Package and make decisions based on its content please contact us.

## Next steps
You are done configuring the oidc-provider-service! Go to [Running the Trust Platform](docs/running-trust-platform.md).
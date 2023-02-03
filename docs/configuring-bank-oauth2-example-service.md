# Configuring the bank-oauth2-example-service
> This step is required only if you do not have an OAuth2 service running yet. If you already have an OAuth2 service up and running feel free to skip this section.

> This service is not part of the IDPartner Trust Platform. This is just an example of an OIDC/OAuth2 service and we include it in this guideline only to illustrate how to integrate the Trust Platform with a preexisting service. The usage of this service in production is strongly discuraged.

This guideline will help to configure the section [services.bank-oauth2-example-service](https://github.com/idpartner-app/trust-platform-example/blob/trustPlatformExample/docker-compose.yml#L21) in the docker compose file.

For the sake of simplicity the bank-oauth2-example-service has only one OAuth2 client registered. We will configure its Client ID and Client Secret below.

1. Please follow the instructions in [Common Configuration](docs/common-configuration.md). If you already have please continue.
1. Configure the OAuth2 Client ID by replacing the ocurrences of `CHANGE_ME-CLIENT_ID` with the value you choose. For example `foo`. Keep this value handy as you will need it later when we configure the [authorization-adapter-service](docs/configuring-authorization-adapter-service.md).
1. Configure the OAuth2 Client Secret by replacing the ocurrences of `CHANGE_ME-CLIENT_SECRET` with the value you choose. For example `bar`. Keep this value handy as you will need it later when we configure the [authorization-adapter-service](docs/configuring-authorization-adapter-service.md)
1. Create a Stytch account [here](https://stytch.com/start-now).
1. Create a Stytch user with a password using their [API](https://stytch.com/docs/api/password-create). Grab the `user_id` from the response.
1. Update first name and last name for the previously creted Stytch user. Do it using their [APIs](https://stytch.com/docs/api/update-user).
1. Grab the API Keys (project ID and the secret) from the Stytch [dashboard](https://stytch.com/dashboard/api-keys). Find the ocurrences of `CHANGE_ME-STYTCH_USERNAME` and `CHANGE_ME-STYTCH_PASSWORD` and replace them with the Project ID and Secret respectively.

## Next steps
You are done configuring the bank-oauth2-example-service! Go to [Configuring the authorization-adapter-service](docs/configuring-authorization-adapter-service.md).
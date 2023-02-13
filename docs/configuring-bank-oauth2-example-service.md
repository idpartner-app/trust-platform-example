# Configuring the bank-oauth2-example-service

**This service is not part of the IDPartner Trust Platform. We include it in this guideline only to illustrate how to integrate with an existing OAuth2 service. The usage of this service in production is strongly discouraged.**


Follow steps below to configure the section [services.bank-oauth2-example-service](https://github.com/idpartner-app/trust-platform-example/blob/trustPlatformExample/docker-compose.yml#L21) in the docker compose file.

1. Create and set an OAuth2 Client ID. Replace the occurrences of `CHANGE_ME-CLIENT_ID` with a value of your choosing. For example `foo`.
1. Create and set an OAuth2 Client Secret. Replace the occurrences of `CHANGE_ME-CLIENT_SECRET` with a value of your choosing. For example `bar`.
1. Generate a base64 encoded JWKs running `yarn generate-base64-signature-jwks`.
1. Copy the base64 encoded JWKs and put it in the occurrences of `CHANGE_ME-BASE64_SIGNATURE_JWKS`.
1. Create a Stytch account. Follow instructions [here](https://stytch.com/start-now).
1. Find the occurrences of `CHANGE_ME-STYTCH_API_PROJECT_ID` and `CHANGE_ME-STYTCH_API_SECRET` and replace them with the Project ID and Secret from the Stytch [dashboard](https://stytch.com/dashboard/api-keys).

## Next steps
Go to [Configuring the authorization-adapter-service](configuring-authorization-adapter-service.md).
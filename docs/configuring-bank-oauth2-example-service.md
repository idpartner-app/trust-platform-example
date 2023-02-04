# Configuring the bank-oauth2-example-service
**This service is not part of the IDPartner Trust Platform. We include it in this guideline only to illustrate how to integrate with an OAuth2 service. The usage of this service in production is strongly discuraged.**


Follow steps below configure the section [services.bank-oauth2-example-service](https://github.com/idpartner-app/trust-platform-example/blob/trustPlatformExample/docker-compose.yml#L21) in the docker compose file.

1. Set the OAuth2 Client ID. Replace the ocurrences of `CHANGE_ME-CLIENT_ID` with `foo`.
1. Set the OAuth2 Client Secret. Replace the ocurrences of `CHANGE_ME-CLIENT_SECRET` with `bar`.
1. Generate a base64 encoded JWKs running `yarn generate-base64-signature-jwks`.
1. Copy the base64 encoded JWKs and put it in the occurrences of `CHANGE_ME-BASE64_SIGNATURE_JWKS`.
1. Create a Stytch account. Follow instructions [here](https://stytch.com/start-now).
1. Find the ocurrences of `CHANGE_ME-STYTCH_USERNAME` and `CHANGE_ME-STYTCH_PASSWORD` and replace them with the Project ID and Secret respectively. Take them from the Stytch [dashboard](https://stytch.com/dashboard/api-keys).

## Create Test User in Stytch
1. Create a Stytch user with a password using their [API](https://stytch.com/docs/api/password-create) and get the `user_id` from the response.
1. Update the Stytch user's first name and last name using their [API](https://stytch.com/docs/api/update-user).

## Next steps
You are done configuring the bank-oauth2-example-service! Go to [Configuring the authorization-adapter-service](configuring-authorization-adapter-service.md).
# Configuring the oidc-provider-service
Follow steps below to configure the section [services.oidc-provider-service](https://github.com/idpartner-app/trust-platform-example/blob/trustPlatformExample/docker-compose.yml#L89) in the docker compose file.

1. Perform the [IDP Registration](registering-idps.md), grab the UUID and set it to `IDENTITY_PROVIDER_UUID`.
1. Generate a base64 encoded JWKs running `yarn generate-base64-encryption-and-signature-jwks`.
1. Copy the base64 encoded JWKs and put it in the occurrences of `CHANGE_ME-BASE64`.
1. [Optional] Configure Error Reporting. [Sign up to Sentry](https://sentry.io/signup/), create a DSN and set it to `SENTRY_DSN`.
1. [Optional] Configure the Trust Package API. _If you want to validate the content of the IDPartner Trust Package and make decisions based on its content please contact us._

## Next steps
You are done configuring the oidc-provider-service! Go to [Running the Trust Platform](running-trust-platform.md).
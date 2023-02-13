# Configuring the oidc-provider-service
Follow steps below to configure the section [services.oidc-provider-service](https://github.com/idpartner-app/trust-platform-example/blob/trustPlatformExample/docker-compose.yml#L89) in the docker compose file.

1. Perform the [IDP Registration](registering-idps.md), grab the UUID and set it to `CHANGE_ME-IDENTITY_PROVIDER_UUID`.
1. Generate a base64 encoded JWKs running `yarn generate-base64-encryption-and-signature-jwks`.
1. Copy the base64 encoded JWKs and put it in the occurrences of `CHANGE_ME-BASE64`.
1. Update the value of `TRUSTED_PACKAGE_VERIFICATION_API` to the Trust Package Verification Service URL. By default it points to the `bank-identity-example-service`.
1. [Optional] Configure Error Reporting. [Sign up to Sentry](https://sentry.io/signup/), create a DSN and set it to `SENTRY_DSN`.

## Next steps
Go to [Running the Trust Platform](running-trust-platform.md).
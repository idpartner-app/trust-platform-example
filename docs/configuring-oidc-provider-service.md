# Configuring the oidc-provider-service
Follow steps below to configure the section [services.oidc-provider-service](../docker-compose.yml) in the docker compose file.

1. Perform the [IDP Registration](https://docs.idpartner.com/documentation/identity-provider-user-guide/registering-the-trust-platform), grab the UUID and set it to `CHANGE_ME-IDENTITY_PROVIDER_UUID`.
1. [Optional] Update the value of `TRUSTED_PACKAGE_VERIFICATION_API` to the Trust Package Verification Service URL.
1. [Optional] Configure Error Reporting. [Sign up to Sentry](https://sentry.io/signup/), create a DSN and set it to `SENTRY_DSN`.

By default the `TRUSTED_PACKAGE_VERIFICATION_API` points to the `bank-identity-example-service`. Update it to integrate with a custom implementation.

## Next steps
Go to [Running the Trust Platform](running-trust-platform.md).
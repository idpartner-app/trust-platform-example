# Configuring the oidc-provider-service
Follow steps below to configure the section [services.oidc-provider-service](../docker-compose.yml) in the docker compose file.

1. [Register the Identity Provider](https://docs.idpartner.com/documentation/identity-provider-user-guide/registering-the-trust-platform)
   1. Set the configured [OIDC_PROVIDER_URL](./initial-setup.md) as the `OIDC Provider URI`. Make sure the URI contains the path `/oidc`.
   1. Set the configured [AUTHORIZATION_ADAPTER_URL](initial-setup.md) as the `Authentication Connector URI`.
      Make sure the URI contains the path `/v1/auth`.
   1. Example: <img width="537" alt="image" src="https://user-images.githubusercontent.com/113495313/218628674-d5bde78d-d2cf-4834-9051-e0ffdd30ab3d.png">

2. Grab the Identity Provider UUID and set it to `CHANGE_ME-IDENTITY_PROVIDER_UUID`.
3. [Optional] Update the value of `TRUSTED_PACKAGE_VERIFICATION_API` to the Trust Package Verification Service URL.
4. [Optional] Configure Error Reporting. [Sign up to Sentry](https://sentry.io/signup/), create a DSN and set it to `SENTRY_DSN`.

By default the `TRUSTED_PACKAGE_VERIFICATION_API` points to the `bank-identity-example-service`. Update it to integrate with a custom implementation.

## Next steps
Go to [Running the Trust Platform](running-trust-platform.md).

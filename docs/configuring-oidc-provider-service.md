# Configuring the oidc-provider-service

Follow steps below to configure the section [services.oidc-provider-service](../docker-compose.yml) in the docker compose file.

1. [Register the Identity Provider](https://docs.idpartner.com/documentation/identity-provider-user-guide/registering-the-trust-platform)
   1. Set the configured [OIDC_PROVIDER_URL](./initial-setup.md) as the `OIDC Provider URI`. Make sure the URI contains the path `/oidc`.
   1. Set the configured [AUTHORIZATION_ADAPTER_URL](initial-setup.md) as the `Authentication Connector URI`.
      Make sure the URI contains the path `/v1/auth`.
   1. Example:
   <img width="537" alt="image" src="https://user-images.githubusercontent.com/113495313/218628674-d5bde78d-d2cf-4834-9051-e0ffdd30ab3d.png">

1. Grab the Identity Provider UUID and set it to `CHANGE_ME-IDENTITY_PROVIDER_UUID`.
1. [Optional] Update the value of `TRUSTED_PACKAGE_VERIFICATION_API` to the Trust Package Verification Service URL.
1. Replace the occurrences of `CHANGE_ME-CLIENT_ID` with the Client ID configured in [Configuring the bank-oauth2-example-service](configuring-bank-oauth2-example-service.md).
1. Replace the occurrences of `CHANGE_ME-CLIENT_SECRET` with the Client Secret configured in [Configuring the bank-oauth2-example-service](configuring-bank-oauth2-example-service.md).
1. [Optional] [PKCE](https://oauth.net/2/pkce/#:~:text=PKCE%20(RFC%207636)%20is%20an,is%20using%20a%20client%20secret.) is enabled by default. If you need to disable it set `OAUTH_PKCE_ENABLED` to `false`.
1. [Optional] Configure Error Reporting. [Sign up to Sentry](https://sentry.io/signup/), create a DSN and set it to `SENTRY_DSN`.

By default the `TRUSTED_PACKAGE_VERIFICATION_API` points to the `bank-identity-example-service`. Update it to integrate with a custom implementation.

Depending on your integration follow instructions below to configure either OAuth2 or OIDC.

## Configuring OAuth2
1. Set `OAUTH_PROTOCOL` to `oauth2`.
1. Configure endpoint to start authorization flow. Set `OAUTH_AUTHORIZATION_PATH` to `/auth`.
1. Configure endpoint to fetch user info. Set `OAUTH_USERINFO_PATH` to `/me`.
1. Configure endpoint to get access tokens. Set `OAUTH_TOKEN_PATH` to `/token`.

## Configuring OIDC
1. Set `OAUTH_PROTOCOL` to `oidc`.
1. Remove `OAUTH_USERINFO_PATH`, `OAUTH_TOKEN_PATH` and `OAUTH_AUTHORIZATION_PATH`.

The endpoints for `OAUTH_USERINFO_PATH`, `OAUTH_TOKEN_PATH` and `OAUTH_AUTHORIZATION_PATH` can be inferred using the OIDC well known endpoint.

## Next steps
Go to [Running the Trust Platform](running-trust-platform.md).

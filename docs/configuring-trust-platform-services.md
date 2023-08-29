# Configuring the trust-platform-services

Follow steps below to configure the section [services.trust-platform-services](../docker-compose.yml) in the docker compose file.

1. [Register the Identity Provider](https://docs.idpartner.com/documentation/identity-provider-user-guide/registering-the-trust-platform)
   1. Grab the value of the  [OIDC_SERVICE_URL](../docker-compose.yml) env var
   1. Use the previous value as the `OIDC Provider URI`. Make sure the URI contains the path `/oidc`.
   1. Replace the `/oidc` suffix with `/oidc/auth-adapter/v1/auth` to generate a new value.
   1. Use the previous value as the `Authentication Connector URI`. Make sure the URI contains the path `/oidc/auth-adapter/v1/auth`.
   1. Example:
   <img width="537" alt="image" src="./trust platform configuration.png">

1. Grab the Identity Provider UUID and set it to `CHANGE_ME-IDENTITY_PROVIDER_UUID`.
1. [Optional] Update the value of `TRUSTED_PACKAGE_VERIFICATION_API` to the Trust Package Verification Service URL.
1. Replace the occurrences of `CHANGE_ME-CLIENT_ID` with the Client ID configured in [Configuring the bank-identity-example-services](configuring-bank-identity-example-services.md).
1. Replace the occurrences of `CHANGE_ME-CLIENT_SECRET` with the Client Secret configured in [Configuring the bank-identity-example-services](configuring-bank-identity-example-services.md).
1. [Optional] [PKCE](https://oauth.net/2/pkce/#:~:text=PKCE%20(RFC%207636)%20is%20an,is%20using%20a%20client%20secret.) is enabled by default. If you need to disable it set `OAUTH_PKCE_ENABLED` to `false`.
1. Replace the occurrences of `CHANGE_ME-MOBILE_APP_URL` with the iOS mobile app URL. For example `idpartner://idpartner-future-bank`.
1. [Optional] Update the value of `BANK_USERS_SERVICE_API` to the Users Service URL.
1. [Optional] Update the value of `BANK_DEVICES_SERVICE_API` to the Devices Service URL.
1. [Optional] Update the value of `BANK_PUSH_AUTHENTICATIONS_SERVICE_API` to the Push Authentications Service URL.
1. [Optional] Configure Error Reporting. [Sign up to Sentry](https://sentry.io/signup/), create a DSN and set it to `SENTRY_DSN`.

By default the `TRUSTED_PACKAGE_VERIFICATION_API` points to the `bank-identity-example-services` and the `BANK_USERS_SERVICE_API`, `BANK_DEVICES_SERVICE_API` and `BANK_PUSH_AUTHENTICATIONS_SERVICE_API` point to the `bank-identity-example-services`. Update them to integrate with a custom implementation.

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

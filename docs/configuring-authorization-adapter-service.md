# Configuring the authorization-adapter-service
> The authorization-adapter-service supports both OAuth2 and OIDC protocols. The only flow enabled by this service is the [authorization code flow](https://oauth.net/2/grant-types/authorization-code/).

Follow steps below to configure the section [services.authorization-adapter-service](../docker-compose.yml) in the docker compose file.

## Initial Setup
1. Replace the occurrences of `CHANGE_ME-CLIENT_ID` with the Client ID configured in [Configuring the bank-oauth2-example-service](configuring-bank-oauth2-example-service.md).
2. Replace the occurrences of `CHANGE_ME-CLIENT_SECRET` with the Client Secret configured in [Configuring the bank-oauth2-example-service](configuring-bank-oauth2-example-service.md).
3. [Optional] [PKCE](https://oauth.net/2/pkce/#:~:text=PKCE%20(RFC%207636)%20is%20an,is%20using%20a%20client%20secret.) is enabled by default. If you need to disable it set `OAUTH_PKCE_ENABLED` to `false`.
4. [Optional] Configure Error Reporting. [Sign up to Sentry](https://sentry.io/signup/), create a DSN and set it to `SENTRY_DSN`.

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
Go to [Configuring the bank-identity-example-service](configuring-bank-identity-example-service.md).
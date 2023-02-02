# Configuring the authorization-adapter-service
> The authorization-adapter-service supports both OAuth2 and OIDC protocols. The only flow supported is the [authorization code flow](https://oauth.net/2/grant-types/authorization-code/). If you need to implement a different flow please talk to us.



This guideline will help to configure the section [services.authorization-adapter-service](https://github.com/idpartner-app/trust-platform-example/blob/trustPlatformExample/docker-compose.yml#L51) in the docker compose file.

1. Please follow the instructions in [Common Configuration](docs/common-configuration.md). If you already have please continue.
1. Configure the OAuth protocol.
  - The enabled authorization protocol is OAuth2 by default. You can validate that's the case by looking at the value of `OAUTH_PROTOCOL`.
  - The authorizer also supports the OIDC protocol. If you want to use it instead of OAuth2 change the value of `OAUTH_PROTOCOL` from `oauth2` to `oidc`. If you use OIDC you can also comment out or remove the variables `OAUTH_USERINFO_PATH`, `OAUTH_TOKEN_PATH` and `OAUTH_AUTHORIZATION_PATH`. Those three endpoints can be inferred by looking at the OIDC well known endpoint.
1. Configure the OAuth URL. This is the host where your OAuth service is running.
  - If you are using the [oidc-provider-example-service][docs/configuring-oidc-provider-example-service.md] in this repo then leave the configuration as it is.
  - If you are using your own OAuth service then update the value of `OAUTH_URL` from localhost to whatever host you are using to run your service.
1. Configure the OAuth Client ID and Client Secret.
  - If you are using the [oidc-provider-example-service][docs/configuring-oidc-provider-example-service.md] in this repo then grab the `CLIENT_ID` and `CLIENT_SECRET` configured in [this](docs/configuring-oidc-provider-example-service.md) section and set them to `OAUTH_CLIENT_ID` and `OAUTH_CLIENT_SECRET` respectively.
  - If you are using your own OAuth service then create a client, grab its Client ID and Client Secret and set them to `OAUTH_CLIENT_ID` and `OAUTH_CLIENT_SECRET` respectively.
1. Configure [PKCE](https://oauth.net/2/pkce/#:~:text=PKCE%20(RFC%207636)%20is%20an,is%20using%20a%20client%20secret.). By default PKCE is enabled in the authorization-adapter-service. If you would like to disable it set to `false` the variable `OAUTH_PKCE_ENABLED`. We suggest to keep it enabled to prevent CSRF and authorization code injection attacks.


If you set `OAUTH_PROTOCOL` to be `oidc` instead of the default `oauth2` you can skip the steps below. The OIDC protocol allows clients to discover authorization, token and user info endpoints.

1. Configure the user info path. By default the path to fetch user info is `/oauth/userinfo`.
  - If you are using the [oidc-provider-example-service][docs/configuring-oidc-provider-example-service.md] in this repo then the the path to fetch user info is `/me`.  This is already set to the compose file.
  - If you are using your own OAuth service and the user info endpoint is the default one (`/oauth/userinfo`) comment out or delete the variable `OAUTH_USERINFO_PATH` from the compose file. If it's different than the default one then set the correct value to `OAUTH_USERINFO_PATH`.
  - The authorization-adapter-service will hit the endpoint conformed by the concatenated values of `OAUTH_URL` and `OAUTH_USERINFO_PATH` to fetch user info.
1. Configure the token path. By default the path to get an access token is `/oauth/token`.
  - If you are using the [oidc-provider-example-service][docs/configuring-oidc-provider-example-service.md] in this repo then the the path to get an acces token is `/token`. This is already set to the compose file.
  - If you are using your own OAuth service and the token endpoint is the default one (`/oauth/token`) comment out or delete the variable `OAUTH_TOKEN_PATH` from the compose file. If it's different than the default one then set the correct value to `OAUTH_TOKEN_PATH`.
  - The authorization-adapter-service will hit the endpoint conformed by the concatenated values of `OAUTH_URL` and `OAUTH_TOKEN_PATH` to get an access token.
1. Configure the authorization path. By default the path to get an access token is `/oauth/authorization`.
  - If you are using the [oidc-provider-example-service][docs/configuring-oidc-provider-example-service.md] in this repo then the the authorization path is `/auth`. This is already set to the compose file.
  - If you are using your own OAuth service and the token endpoint is the default one (`/oauth/authorization`) comment out or delete the variable `OAUTH_AUTHORIZATION_PATH` from the compose file. If it's different than the default one then set the correct value to `OAUTH_AUTHORIZATION_PATH`.
  - The authorization-adapter-service will hit the endpoint conformed by the concatenated values of `OAUTH_URL` and `OAUTH_AUTHORIZATION_PATH` to start the authorization flow.

## Next steps
You are done configuring the authorization-adapter-service! Go to [Configuring the oidc-provider--service](docs/configuring-oidc-provider-service.md).
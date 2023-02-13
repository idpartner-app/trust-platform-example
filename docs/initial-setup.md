# Initial Setup
The configuration in the compose file assumes you are using [Docker for Mac](https://docs.docker.com/desktop/install/mac-install/). Because of that you will notice that some URLs in the configuration point to `docker.for.mac.localhost` instead of `localhost`.

If you are not using Docker for Mac make sure you update the references to point to the localhost that resolves for your environment.

## Configuring OIDC Provider URLs
1. Run ngrok in your terminal `ngrok http 9501` to open an ssl tunnel to the `oidc-provider-service`
1. Copy the full ngrok host `https://aaaaaaaaaaaa.ngrok.io` and put it in the occurrences of `CHANGE_ME-OIDC_PROVIDER_SERVICE_NGROK` in the [compose file](../docker-compose.yml).
1. Copy the host without the http scheme (`aaaaaaaaaaaa.ngrok.io` in this example) and put it in the occurrences of `CHANGE_ME-OIDC_PROVIDER_SERVICE_NGROK_WITHOUT_SCHEME` in the [compose file](../docker-compose.yml).

## Configuring Authorization Adapter URLs
1. Run ngrok in your terminal `ngrok http 9502` to open an ssl tunnel to the `authorization-adapter-service`.
1. Copy the full ngrok host `https://bbbbbbbbbbbb.ngrok.io` and put it in the occurrences of `CHANGE_ME-AUTHORIZATION_ADAPTER_SERVICE_NGROK` in the [compose file](../docker-compose.yml).
1. Copy the host without the http scheme (`bbbbbbbbbbbb.ngrok.io` in this example) and put it in the occurrences of `CHANGE_ME-AUTHORIZATION_ADAPTER_SERVICE_NGROK_WITHOUT_SCHEME` in the [compose file](../docker-compose.yml).

## Configuring Backchannel Auth URLs
1. Run ngrok in your terminal `ngrok http 9503` to open an ssl tunnel to the `backchannel-auth-service`.
1. Copy the full ngrok host `https://cccccccccccc.ngrok.io` and put it in the occurrences of `CHANGE_ME-BACKCHANNEL_AUTH_SERVICE_NGROK` in the [compose file](../docker-compose.yml).
1. Copy the host without the http scheme (`cccccccccccc.ngrok.io` in this example) and put it in the occurrences of `CHANGE_ME-BACKCHANNEL_AUTH_SERVICE_NGROK_WITHOUT_SCHEME` in the [compose file](../docker-compose.yml).

## Configuring Random Secrets
1. Generate a high entrophy random string running `yarn generate-random-secret`.
1. Copy the random string and put it in the occurrences of `CHANGE_ME-RANDOM_SECRET`.

Random secrets are mostly used to sign session cookies. For production you must use a different random string for each occurrence of `CHANGE_ME-RANDOM_SECRET`.

## Next steps
Go to [Configuring the bank-oauth2-example-service](configuring-bank-oauth2-example-service.md).

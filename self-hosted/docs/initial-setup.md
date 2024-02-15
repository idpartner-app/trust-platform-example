# Initial Setup
The configuration in the compose file assumes you are using [Docker for Mac](https://docs.docker.com/desktop/install/mac-install/). Because of that you will notice that some URLs in the configuration point to `docker.for.mac.localhost` instead of `localhost`.

If you are not using `Docker for Mac` make sure you update the references to point to the localhost that resolves for your environment.

## Configuring Trust Platform Services URLs
1. Run ngrok in your terminal `ngrok http 9501` to open an ssl tunnel to the `trust-platform-services`
1. Copy the host without the http scheme (`subdomain2.ngrok.io`) and put it in the occurrences of `CHANGE_ME-TRUST_PLATFORM_SERVICES_NGROK_WITHOUT_SCHEME` in the [compose file](../docker-compose.yml).
1. Copy the full ngrok host (`https://subdomain2.ngrok.io`) and put it in the occurrences of `CHANGE_ME-TRUST_PLATFORM_SERVICES_NGROK` in the [compose file](../docker-compose.yml).

## Configuring Random Secrets
1. Generate a high entrophy random string running `yarn generate-random-secret`.
1. Copy the random string and put it in the occurrences of `CHANGE_ME-RANDOM_SECRET`.

Random secrets are mostly used to sign session cookies. For production you must use a different random string for each occurrence of `CHANGE_ME-RANDOM_SECRET`.

## Configuring Signature and Encryption JWKs
1. Generate a base64 encoded JWKs running `yarn generate-base64-encryption-and-signature-jwks`.
1. Copy the base64 encoded JWKs and put it in the occurrences of `CHANGE_ME-BASE64_JWKS`.

## Next steps
Go to [Configuring the bank-services](configuring-bank-services.md).
# Initial Setup
The default configuration in the `docker-compose.yaml` file is tailored for [Docker for Mac](https://docs.docker.com/desktop/install/mac-install/). Consequently, some URLs in the configuration use `docker.for.mac.localhost` instead of `localhost`. 

If you're not using Docker for Mac or if `docker.for.mac.localhost` does not resolve in your environment, update these references to match the DNS settings that work for your setup.

## Configuring Trust Platform Services URLs
1. Start an SSL tunnel to the `trust-platform-services` by running `ngrok http 9501` in your terminal.
1. Copy the generated ngrok host, excluding the HTTP/HTTPS scheme (e.g., `subdomain2.ngrok.io`), and replace all instances of `{{CHANGE_ME-TRUST_PLATFORM_SERVICES_URL_WITHOUT_SCHEMA}}` in the `.env` file with this host.
1. Copy the full ngrok URL (e.g., `https://subdomain2.ngrok.io`) and replace all instances of `{{CHANGE_ME-TRUST_PLATFORM_SERVICES_URL}}` in the `.env` file with this URL.

## Configuring Random Secrets
1. Generate a high-entropy random string by executing `yarn generate-random-secret`.
1. Replace all instances of `{{CHANGE_ME-RANDOM_SECRET}}` in the `.env` file with the generated string.

Note: Random secrets are primarily used for signing session cookies. In a production environment, ensure you use a unique random string for each service.

## Configuring Signature and Encryption JWKs
1. Generate base64-encoded JWKs by running `yarn generate-base64-encryption-and-signature-jwks`.
2. Replace all instances of `{{CHANGE_ME-BASE64_JWKS}}` in the `.env` file with the generated base64-encoded JWKs.

## Next steps
Go to [Configuring the bank-services](configuring-bank-services.md).
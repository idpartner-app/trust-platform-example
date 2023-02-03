# Common Configuration

## Configuring localhost
The configuration in the compose file assumes you are using [Docker for Mac](https://docs.docker.com/desktop/install/mac-install/). Because of that you will notice that some URLs in the configuration point to `docker.for.mac.localhost` instead of `localhost`.

If you are not using Docker for Mac make sure you update the references to point to the localhost that resolves for your environment.

## Configuring OIDC Provider URLs
If you open the [compose file](../docker-compose.yml) you will notice that multiple environment variables for different services have the value `CHANGE_ME-OIDC_PROVIDER_SERVICE_NGROK` and `CHANGE_ME-OIDC_PROVIDER_SERVICE_NGROK_WITHOUT_SCHEME`. That must be changed. Follow steps below to do it.

1. Open a ssl tunnel to send traffic from the internet to the oidc-provider-service that will run locally on port 9001.
  1. Run this in a tab of your terminal `ngrok http 9001`.
  1. Ngrok will start and will display something like this `Forwarding  https://aaaaaaaaaaaa.ngrok.io -> http://localhost:9001`. Notice that the subdomain `aaaaaaaaaaaa` is just an example and will be different every time you execute the ngrok http command.
1. Copy the full host (`https://aaaaaaaaaaaa.ngrok.io` in this example) and replace with it the ocurrences of `CHANGE_ME-OIDC_PROVIDER_SERVICE_NGROK` in the [compose file](../docker-compose.yml).
1. Copy the host without the http scheme (`aaaaaaaaaaaa.ngrok.io` in this example) and replace with it the ocurrences of `CHANGE_ME-OIDC_PROVIDER_SERVICE_NGROK_WITHOUT_SCHEME` in the [compose file](../docker-compose.yml).

Keep in mind that if for some reason you stop ngrok and start it again you will get a different subdomain. If that happens you will have to follow the above steps once again.

## Configuring Authorization Adapter URLs
If you open the [compose file](../docker-compose.yml) you will notice that multiple environment variables for different services have the value `CHANGE_ME-AUTHORIZATION_ADAPTER_SERVICE_NGROK` and `CHANGE_ME-AUTHORIZATION_ADAPTER_SERVICE_NGROK_WITHOUT_SCHEME`. That must be changed. Follow steps below to do it.

1. Open a ssl tunnel to send traffic from the internet to the authorization-adapter-service that will run locally on port 9102.
  1. Run this in a tab of your terminal `ngrok http 9102`.
  1. Ngrok will start and will display something like this `Forwarding  https://bbbbbbbbbbbb.ngrok.io -> http://localhost:9102`. Notice that the subdomain `bbbbbbbbbbbb` is just an example and will be different every time you execute the ngrok http command.
1. Copy the full host (`https://bbbbbbbbbbbb.ngrok.io` in this example) and replace with it the ocurrences of `CHANGE_ME-AUTHORIZATION_ADAPTER_SERVICE_NGROK` in the [compose file](../docker-compose.yml).
1. Copy the host without the http scheme (`bbbbbbbbbbbb.ngrok.io` in this example) and replace with it the ocurrences of `CHANGE_ME-AUTHORIZATION_ADAPTER_SERVICE_NGROK_WITHOUT_SCHEME` in the [compose file](../docker-compose.yml).

## Configuring Random Secrets
If you open the [compose file](../docker-compose.yml) you will notice that multiple environment variables for different services have the value `CHANGE_ME-RANDOM_SECRET`. Those values are mostly used for signing cookies. Follow steps below to change the default value.

1. Generate a high entrophy random string.
  - You can do so using tools online such as https://ipty.de/random/.
  - A 100 random chars long string can be generated at https://ipty.de/random/?mode=letters.
1. Copy the random string and replace with it the occurrences of `CHANGE_ME-RANDOM_SECRET`.

For the sake of this example it's ok to put the same random value in all occurrences of `CHANGE_ME-RANDOM_SECRET`.

For production usage, however, you must use a different random string for each occurrence of `CHANGE_ME-RANDOM_SECRET`. Additionally, we strongly suggest to use a secrets manager to keep your secrets.


## Configuring Base64 Encoded JWKs
Open the [compose file](../docker-compose.yml) and notice that multiple environment variables for different services have the value `CHANGE_ME-BASE64_JWKS`. Those values are used to cryptographically sign (JWS) and/or encrypt (JWE) information/claims (JWTs) that get sent from one service to another. Leveraging cryptographical signatures and encryption allows us to transfer data with the guarantee that no information/claims were tampered or spoofed.

In order to be FAPI compliant we are opinionated with regards to the signing and encryption algorithms used. We leverage asymetric cryptography and demand the JWKs to include at least one RSA-OAE encryption key and at least one PS256 signing key.

We suggest you to generate the JWKs using a script we provide as part of this guideline or you can also generate it online using tools like https://mkjwk.org/. If you are generating it online make sure the JWKs include keys that use the cryptographic algorithms mentioned above.

1. Generate a base64 ncoded JWKs. Run `yarn generate-base64-encryption-and-signature-jwks`.
1. Copy the value printed by the generator script and replace with it the ocurrences of `CHANGE_ME:BASE64_JWKS`.

For the sake of this example it's ok to put the same Base64 Encoded JWKs in all occurrences of `CHANGE_ME-RANDOM_SECRET`.

For production usage, however, you must use a different JWKs for each service. Additionally, the JWKs include both public and secret keys. For that reason they should never be publically exposed. We strongly suggest to use a secrets manager to keep your JWKs.

## Next steps
You are done configuring the common variables and secrets! Go to [Configuring the bank-oauth2-example-service](configuring-bank-oauth2-example-service.md).

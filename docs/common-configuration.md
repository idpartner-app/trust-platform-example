# Common Configuration

We use [ngrok](https://ngrok.com/) to get the environment running locally. Install ngrok following instructions [here](https://ngrok.com/download).

Before continue make sure ngrok is installed by running `ngrok version`. It should return a version and not an error.

## Configuring CHANGE_ME_OIDC_PROVIDER_SERVICE_NGROK and CHANGE_ME_OIDC_PROVIDER_SERVICE_NGROK_WITHOUT_SCHEME
If you open the [compose file](docker-compose.yml) you will notice that multiple environment variables for different services have the value `CHANGE_ME_OIDC_PROVIDER_SERVICE_NGROK` and `CHANGE_ME_OIDC_PROVIDER_SERVICE_NGROK_WITHOUT_SCHEME`. That must be changed. Follow steps below to do it.

1. Open a ssl tunnel to send traffic from the internet to the oidc-provider-service that will run locally on port 9001.
  1. Run this in a tab of your terminal `ngrok http 9001`.
  1. Ngrok will start and will display something like this `Forwarding  https://aaaaaaaaaaaa.ngrok.io -> http://localhost:9001`. Notice that the subdomain `aaaaaaaaaaaa` is just an example and will be different every time you execute the ngrok http command.
1. Copy the full host (`https://aaaaaaaaaaaa.ngrok.io` in this example) and replace with it the ocurrences of `CHANGE_ME_OIDC_PROVIDER_SERVICE_NGROK` in the [compose file](docker-compose.yml).
1. Copy the host without the http scheme (`aaaaaaaaaaaa.ngrok.io` in this example) and replace with it the ocurrences of `CHANGE_ME_OIDC_PROVIDER_SERVICE_NGROK_WITHOUT_SCHEME` in the [compose file](docker-compose.yml).

Keep in mind that if for some reason you stop ngrok and start it again you will get a different subdomain. If that happens you will have to follow the above steps once again.

## Configuring CHANGE_ME_AUTHORIZATION_ADAPTER_SERVICE_NGROK and CHANGE_ME_AUTHORIZATION_ADAPTER_SERVICE_WITHOUT_SCHEME_NGROK
If you open the [compose file](docker-compose.yml) you will notice that multiple environment variables for different services have the value `CHANGE_ME_AUTHORIZATION_ADAPTER_SERVICE_NGROK` and `CHANGE_ME_AUTHORIZATION_ADAPTER_SERVICE_WITHOUT_SCHEME_NGROK`. That must be changed. Follow steps below to do it.

1. Open a ssl tunnel to send traffic from the internet to the oidc-provider-service that will run locally on port 9102.
  1. Run this in a tab of your terminal `ngrok http 9102`.
  1. Ngrok will start and will display something like this `Forwarding  https://bbbbbbbbbbbb.ngrok.io -> http://localhost:9102`. Notice that the subdomain `bbbbbbbbbbbb` is just an example and will be different every time you execute the ngrok http command.
1. Copy the full host (`https://bbbbbbbbbbbb.ngrok.io` in this example) and replace with it the ocurrences of `CHANGE_ME_AUTHORIZATION_ADAPTER_SERVICE_NGROK` in the [compose file](docker-compose.yml).
1. Copy the host without the http scheme (`bbbbbbbbbbbb.ngrok.io` in this example) and replace with it the ocurrences of `CHANGE_ME_AUTHORIZATION_ADAPTER_SERVICE_WITHOUT_SCHEME_NGROK` in the [compose file](docker-compose.yml).
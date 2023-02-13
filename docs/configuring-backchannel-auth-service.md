# Configuring the backchannel-auth-service
Follow steps below to configure the section [services.backchannel-auth-service](https://github.com/idpartner-app/trust-platform-example/blob/BackchannelAuthExample/docker-compose.yml#L102) in the docker compose file.

1. Replace the occurrences of `CHANGE_ME-MOBILE_APP_URL` with the iOS mobile app URL. For example `idpartner://idpartner-future-bank`.
1. [Optional] Update the value of `BANK_USERS_SERVICE_API` to the Users Service URL.
1. [Optional] Update the value of `BANK_DEVICES_SERVICE_API` to the Devices Service URL.
1. [Optional] Update the value of `BANK_PUSH_AUTHENTICATIONS_SERVICE_API` to the Push Authentications Service URL.
1. [Optional] Configure Error Reporting. [Sign up to Sentry](https://sentry.io/signup/), create a DSN and set it to `SENTRY_DSN`.


By default the `BANK_USERS_SERVICE_API`, `BANK_DEVICES_SERVICE_API` and `BANK_PUSH_AUTHENTICATIONS_SERVICE_API` point to the `bank-identity-example-service`. Update them to integrate with a custom implementation.

## Next steps
Go to [Configuring the oidc-provider-service](configuring-oidc-provider-service.md).
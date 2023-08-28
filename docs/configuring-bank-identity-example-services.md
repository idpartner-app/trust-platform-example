# Configuring the bank-identity-example-services

**These services are not part of the IDPartner Trust Platform. We include it in this guideline only to illustrate how to integrate with services like users-service, devices-service, push-authentications-service, trust-package-validation-service, oauth2 service and the wallet service which should be implemented by the banks. The usage of this service in production is strongly discouraged.**

Follow steps below to configure the section [services.bank-identity-example-services](../docker-compose.yml) in the docker compose file.

1. Build a [Google Firebase based mobile app](https://firebase.google.com/docs/cloud-messaging/flutter/client) that supports receiving push notifications. If you do not have one please contact IDPartner
1. Generate a Google Firebase privatekey for your project as explained in [Firebase's docs](https://firebase.google.com/docs/admin/setup#initialize_the_sdk_in_non-google_environments)
1. Download the private key (it's a JSON file) and encode it to base64
1. Set the generated base64 private key to the env var with name `BASE64_FIREBASE_PRIVATE_KEY`
1. Create and set an OAuth2 Client ID. Replace the occurrences of `CHANGE_ME-CLIENT_ID` with a value of your choosing. For example `foo`.
1. Create and set an OAuth2 Client Secret. Replace the occurrences of `CHANGE_ME-CLIENT_SECRET` with a value of your choosing. For example `bar`.
1. Create a Stytch account. Follow instructions [here](https://stytch.com/start-now).
1. Find the occurrences of `CHANGE_ME-STYTCH_API_PROJECT_ID` and `CHANGE_ME-STYTCH_API_SECRET` and replace them with the Project ID and Secret from the Stytch [dashboard](https://stytch.com/dashboard/api-keys).

## Next steps
Go to [Configuring the trust-platform-services](configuring-trust-platform-services.md).
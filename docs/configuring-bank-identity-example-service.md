# Configuring the bank-identity-example-service

**This service is not part of the IDPartner Trust Platform. We include it in this guideline only to illustrate how to integrate with services like users-service, devices-service, push-authentications-service and trust-package-validation-service which should be implemented by the banks. The usage of this service in production is strongly discouraged.**

Follow steps below to configure the section [services.bank-identity-example-service](../docker-compose.yml) in the docker compose file.

1. Build a [Google Firebase based mobile app](https://firebase.google.com/docs/cloud-messaging/flutter/client) that supports receiving push notifications. If you do not have one please contact IDPartner
1. Generate a Google Firebase privatekey for your project as explained in [Firebase's docs](https://firebase.google.com/docs/admin/setup#initialize_the_sdk_in_non-google_environments)
1. Download the private key (it's a JSON file) and encode it to base64
1. Set the generated base64 private key to the env var with name `BASE64_FIREBASE_PRIVATE_KEY`

## Next steps
Go to [Configuring the oidc-provider-service](configuring-oidc-provider-service.md).
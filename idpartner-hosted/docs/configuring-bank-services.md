# Configuring the Bank Services
**Disclaimer: The bank-services outlined here are not components of the IDPartner Trust Platform. This guide includes them solely for demonstration purposes, illustrating potential integrations with banking services such as user, device, push authentication, trust package validation, and OAuth2 services, which banks should implement independently. Utilizing these illustrative services in a production environment is strongly advised against.**

To configure the `bank-services` section within the `docker-compose.yml` file, follow the steps below.

## Web, redirect-based flow
1. Generate an OAuth2 Client ID. Replace all instances of `{{CHANGE_ME-CLIENT_ID}}` in the `.env` file with your chosen value. For example: `foo`.
1. Generate an OAuth2 Client Secret. Replace all instances of `{{CHANGE_ME-CLIENT_SECRET}}` in the `.env` file with your chosen value. For example: `bar`.

## Mobile, push-authentication-based flow
1. Develop a mobile app capable of receiving push notifications, based on [Google Firebase](https://firebase.google.com/docs/cloud-messaging/flutter/client). If you lack such an app, please consult IDPartner for assistance.
1. Follow [Firebase's documentation](https://firebase.google.com/docs/admin/setup#initialize_the_sdk_in_non-google_environments) to generate a Google Firebase private key for your project.
1. Download the private key (a JSON file) and convert it to base64 format.
1. Replace `{{CHANGE_ME-FIREBASE_BASE64_PRIVATE_KEY}}` in the `.env` file with the generated base64-encoded private key.

## Next steps
Go to [Configuring the trust-platform-services](configuring-trust-platform-services.md).
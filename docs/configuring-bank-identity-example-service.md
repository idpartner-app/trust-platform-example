# Configuring the bank-identity-example-service

**This service is not part of the IDPartner Trust Platform. We include it in this guideline only to illustrate how to integrate with services like users-service, devices-service, push-authentications-service and trust-package-validation-service which should be implemented by the banks. The usage of this service in production is strongly discouraged.**

Follow steps below to configure the section [services.bank-identity-example-service](https://github.com/idpartner-app/trust-platform-example/blob/BackchannelAuthExample/docker-compose.yml#L49) in the docker compose file.
 
1. Create an [Apple developmet account](https://developer.apple.com/).
1. Create an iOS mobile app using our ios-example-app.
1. Replace the occurrences of `CHANGE_ME-APN_BUNDLE_ID` with the bundle ID from the mobile app
1. Replace the occurrences of `CHANGE_ME-APN_KEY_BASE64` with the base64 encoded key from the mobile app
1. Replace the occurrences of `CHANGE_ME-APN_KEY_ID` with the key ID from the mobile app
1. Replace the occurrences of `CHANGE_ME-APN_TEAM_ID` with the team ID from the mobile app

## Next steps
Go to [Configuring the backchannel-auth-service](configuring-backchannel-auth-service.md).
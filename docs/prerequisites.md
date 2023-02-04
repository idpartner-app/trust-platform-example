# Prerequisites
The tools below are required to finish the guideline. Make sure they are installed before continuing.

1. Ngrok. Install it following instructions [here](https://ngrok.com/download). Verify ngrok is installed by running `ngrok version`. It should return a version number and not an error.

1. Nodejs. Install nodejs following instructions [here](https://nodejs.org/en/download/). Verify nodejs is installed by running `node -v`. We support versions `v16.16.0` and above.

1. Yarn. Install yarn following instructions [here](https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable). Verify yarn is installed by running `yarn --version`. We support versions `1.18.0` and above.

1. Install dependencies. Run `yarn install` and make sure it completes without errors.

## [Temporary] Build Docker Images
This a workaround to build docker images locally. Once we figure out how we are going to distribute docker images we will get rid of this section.

Go to idpartner monorepo, pull the latest from `master` branch and run the following:
```
cd scripts 
./build.sh mock-bank-oauth2-example-service
./build.sh authorization-adapter-service
./build.sh oidc-provider-service 
./build.sh mock-bank-migrations
```

It should finish without errors.

## Next steps
You are done with this section. Go to [Common Configuration](common-configuration.md).

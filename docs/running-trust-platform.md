# Running the Trust Platform
This guideline covers how to setup and run the Trust Platform. This guideline assumes that you already went through all the [configuration guidelines](README.md) before. If you haven't please do before continue.

1. Setup the Trust Platform. To do it simply run `./scripts/setup_local.sh`. This script will:
  - download the Redis image and start it
  - download the Postgres image and start it
  - create the `idpartner` database
  - run the database migrations so the tables needed to perform the oidc authorization flow are created
1. Run the trust platform. To do it simply run `docker-compose up`. Unless you have deleted/commented out any of the default services in the compose file you should see these services started and no errors in the output:
  - postgres
  - redis
  - oidc-provider-example-service
  - authorization-adapter-service
  - oidc-provider-service

## Next steps
You are done configuring the Trust Platform. Go to the URL where your IDPartner Magic Button lives and give it a try!

When promopted for authentication you should use the credentials you used when you created the Stytch user in [configuring-oidc-provider-example-service.md].

Once you authenticate you should see the authoriation flow completed.
# Running the Trust Platform
1. Setup the Trust Platform. To do it simply run `./scripts/setup_local.sh`.
1. Run the trust platform. To do it simply run `docker-compose up`.

The steps above should complete without errors.

## Create Test User in Stytch
1. Create a Stytch user with a password using their [API](https://stytch.com/docs/api/password-create) and get the `user_id` from the response.
1. Update the Stytch user's first name and last name using their [API](https://stytch.com/docs/api/update-user).


## Next steps
You are done configuring the Trust Platform. [Register a Relying Party](https://docs.idpartner.com/documentation/relying-party-user-guide) and give it a try using the Stytch user created above.
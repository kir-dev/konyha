
# README

## Local setup 

You will need an AuthSCH application.
You can register one at https://auth.sch.bme.hu/console/index.
Set the redirect url to `http://localhost:3000/auth/oauth/callback`
For development create your own `.env` file based on `.env.example`

To setup the database:
```bash
rails db:setup
```

Other useful commands are `rails db:create`, `db:migrate`, `db:seed` and `db:reset`.

To compile the contents of `app/javascript`:
```bash
bin/webpack
```

To run compile server:

```bash
bin/webpack-dev-server
```

These are necessary when you change some JS or CSS that are bundled to the app.

## Docker

Create the persistent database volume:
```bash
docker volume create --name=konyhasch_database`
```

### Development
Run only database container:
```bash
 docker-compose -f docker-compose.dev.yml up --build
```
Use the `-d` switch to run it detached in the background.

The database is accessible on port `5433`.

After creating the database container you have to set up the database from the console.

### Production

Generate a random string for `secret_key_base`:
```bash
rails secret
```

Create the encrypted credentials for production:

```bash
EDITOR=nano rails credentials:edit --environment production
```

Delete the `#` and add `secret_key_base` with value of a the randomly generated string.

Run all containers in the network:
```bash
docker-compose up --build
```

The application will be available on port `3444`.

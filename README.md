# kwiz

## Running the Application

> To run `kwiz`, make sure that your environment has a working `docker` (19.03+) and `docker-compose` setup.

The `_run.sh` script allows you to run `kwiz` using `docker-compose`. For first time usage, just call:

`./_run.sh --prod --init`

`_run.sh` takes the following parameters:

- `--prod`: Run the application in production mode (`NODE_ENV=production`). When not specified, all services will be built and run with `NODE_ENV=development`.
- `--init`: Initialize the database and application state. This parameter needs to be supplied when running the application for an environment for the first time, as it will hydrate the metadata from `The Movies Dataset` and ensure that `docker` has access to some necessary variables.
    - To grant access to the Github Package Registry use a token with at least the `read:packages` scope.
    - To get an OMDB API key, read the [README](./poster-service/README.md) of the poster-service.

Make sure that `--prod` is specified before `--init`.

## Development

Please go through the installation steps [here](https://github.com/kwizapp/kwiz/wiki/Development).

## Git Submodules

Clone repository recursively (can also be SSH)

`git clone --recurse-submodules https://github.com/kwizapp/kwiz.git`

`git submodule update --remote`

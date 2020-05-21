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

_Note: The database hydration takes some time. The application should be ready once you see the following output:_

```
metadata_init_1     | > Downloading movie dataset
metadata_init_1     | > Unzipping movie dataset
metadata_init_1     | > Filtering movies
metadata_init_1     | > Checking consistency against OMDB
metadata_init_1     | > Hydrating database
...
metadata_init_1     | 2020-05-21 05:49:05,433 INFO sqlalchemy.engine.base.Engine COMMIT
kwiz_metadata_init_1 exited with code 0
```

## Development

For development on any ouf the _Kwiz_ services and libraries, please make sure that you have working installations of the following:

- Node.js 12 or later
- Docker

## Git Submodules

Clone repository recursively (can also be SSH)

`git clone --recurse-submodules https://github.com/kwizapp/kwiz.git`

`git submodule update --remote`

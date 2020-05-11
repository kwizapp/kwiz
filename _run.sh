#!/bin/sh

NODE_AUTH_TOKEN=""
ENVIRONMENT=""
SERVICES="ionic_app nest_api poster_service metadata_service metadata_db"

for var in "$@"; do
  case "$1" in
  "--prod")
    ENVIRONMENT=".prod"
    ;;
  "--init")
    OMDB_API_KEY=""
    SERVICES=""

    echo "Please input a NODE_AUTH_TOKEN for access to the Github Package Registry:"
    read NODE_AUTH_TOKEN
    echo $NODE_AUTH_TOKEN > node-auth.secret

    echo "Please input an OMDB API key for the poster-service"
    read OMDB_API_KEY
    export OMDB_API_KEY
    envsubst < docker-compose$ENVIRONMENT.yml > docker-compose$ENVIRONMENT.yml.secret
    ;;
  esac
  shift
done

# if no auth token has been initialized yet, try to read it from secret
if [ "$NODE_AUTH_TOKEN" = "" ]; then
    NODE_AUTH_TOKEN=`cat node-auth.secret`
fi

# run a docker-compose build to ensure images are up-to-date
docker-compose -f docker-compose$ENVIRONMENT.yml.secret build --parallel --build-arg NODE_AUTH_TOKEN=$NODE_AUTH_TOKEN

# start the services as specified
docker-compose -f docker-compose$ENVIRONMENT.yml.secret up $SERVICES

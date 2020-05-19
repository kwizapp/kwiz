#!/bin/sh

NODE_AUTH_TOKEN=""
OMDB_API_KEY=""
ENVIRONMENT=""
SERVICES="ionic_app nest_api poster_service metadata_service metadata_db"

for var in "$@"; do
  case "$1" in
  "--prod")
    ENVIRONMENT=".prod"
    ;;
  "--init")
    SERVICES=""

    echo "Please input a NODE_AUTH_TOKEN for access to the Github Package Registry:"
    read NODE_AUTH_TOKEN
    echo $NODE_AUTH_TOKEN > node_auth.secret

    echo "Please input an OMDB API key for the poster-service"
    read OMDB_API_KEY
    echo $OMDB_API_KEY > omdb_api.secret
    ;;
  esac
  shift
done

if test -f "node_auth.secret"; then
    NODE_AUTH_TOKEN=`cat node_auth.secret`
    export NODE_AUTH_TOKEN
fi

if test -f "omdb_api.secret"; then
    OMDB_API_KEY=`cat omdb_api.secret`
    export OMDB_API_KEY
fi

if test -z "$NODE_AUTH_TOKEN"; then
    echo "Please ensure that a valid NODE_AUTH_TOKEN is provided (run ./_run --init)"
    exit
fi

if test -z "$OMDB_API_KEY"; then
    echo "Please ensure that a valid OMDB_API_KEY is provided (run ./_run --init)"
    exit
fi

# run a docker-compose build to ensure images are up-to-date
docker-compose -f docker-compose$ENVIRONMENT.yml build --parallel

# start the services as specified
docker-compose -f docker-compose$ENVIRONMENT.yml up $SERVICES

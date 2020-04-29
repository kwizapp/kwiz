#!/bin/sh

echo "Please input a NODE_AUTH_TOKEN for access to the Github Package Registry:"

read NODE_AUTH_TOKEN

docker-compose -f docker-compose.yml build --parallel --build-arg NODE_AUTH_TOKEN=$NODE_AUTH_TOKEN
docker-compose -f docker-compose.yml up

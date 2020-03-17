#!/bin/sh
docker-compose -f docker-compose.prod.yml build --parallel
docker-compose -f docker-compose.prod.yml up

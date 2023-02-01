#!/bin/bash

docker run -e SQL_USER=postgres -e SQL_PASSWORD=welcome1 -e SQL_DATABASE=idpartner -e SQL_HOST=docker.for.mac.localhost 796120034461.dkr.ecr.us-west-2.amazonaws.com/mock-bank-migrations:development

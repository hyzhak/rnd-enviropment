#!/usr/bin/env bash

GRAPHQL_URL=http://eugene-ai.local:4200/ prefect server start --ui-port 8085 --use-volume --volume-path /var/db/1/prefect

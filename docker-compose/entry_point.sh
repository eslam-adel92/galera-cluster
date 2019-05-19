#!/bin/bash
sleep 50
docker-entrypoint.sh mysqld || docker-entrypoint.sh mysqld --wsrep-new-cluster


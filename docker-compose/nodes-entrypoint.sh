#!/bin/bash
sleep 50
VALUE=`mysql -h node0 -u root -p'1234' -e "SHOW STATUS LIKE 'wsrep_cluster_size'" | awk 'FNR == 2 {print $2}'`

if [[ "$VALUE" -eq '1' ]]
then
  docker-entrypoint.sh mysqld
  echo done
else
   /nodes-entrypoint.sh
fi

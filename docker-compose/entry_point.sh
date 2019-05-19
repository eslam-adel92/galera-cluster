#!/bin/bash
docker-entrypoint.sh mysqld
RESULT=`echo $?`
##sleep 50
VALUE=`mysql -u root -p${MYSQL_PASSWORD} -e "SHOW GLOBAL STATUS LIKE 'wsrep_ready';" | awk 'FNR == 2 {print $2}'`

if [[ RESULT -ne '0' || "$VALUE" == "OFF" ]]
then
  kill -9 $(ps aux | grep mysqld | grep -v grep | awk '{print $2}')
  rm -rf /var/lib/mysql
  docker-entrypoint.sh mysqld --wsrep-new-cluster
  echo done
else
   echo "The cluster failed or the node failed joining"
fi

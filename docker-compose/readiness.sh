#!/bin/bash
mysql -u root --password=$MYSQL_ROOT_PASSWORD -e "SHOW GLOBAL STATUS LIKE 'wsrep_ready';"
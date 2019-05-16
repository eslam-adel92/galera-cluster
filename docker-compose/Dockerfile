# Galera Cluster Dockerfile
FROM ubuntu:16.04

RUN apt-get update && apt-get install -y software-properties-common
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 BC19DDBA

RUN apt-get update && apt-get install iputils-ping telnet -y

RUN apt-get update && \
    add-apt-repository 'deb http://releases.galeracluster.com/galera-3/ubuntu xenial main' && \
    add-apt-repository 'deb http://releases.galeracluster.com/mysql-wsrep-5.7/ubuntu xenial main'

RUN { \
                #echo mysql-wsrep-server mysql-wsrep-server/data-dir select ''; \
                echo mysql-wsrep-server mysql-wsrep-server/root-pass password 'test'; \
                echo mysql-wsrep-server mysql-wsrep-server/re-root-pass password 'test'; \
                echo mysql-wsrep-server mysql-wsrep-server/remove-test-db select false; \
        } | debconf-set-selections


RUN apt-get update && apt-get install -y galera-3 galera-arbitrator-3 mysql-wsrep-5.7 rsync

RUN rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /var/run/mysqld

COPY my.cnf /etc/mysql/my.cnf
#COPY docker-entrypoint.sh /usr/local/bin/
#RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat
#ENTRYPOINT ["docker-entrypoint.sh"]


EXPOSE 3306/tcp 4567/tcp 4567/udp 4568/tcp 4444/tcp
ENTRYPOINT ["mysqld"]
# CMD ["mysqld"]

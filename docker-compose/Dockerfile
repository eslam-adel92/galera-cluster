FROM mariadb:latest
EXPOSE 3306 33060 4567/tcp 4567/udp 4568/tcp 4444/tcp

COPY readiness.sh /usr/local/bin/
RUN ln -s /usr/local/bin/readiness.sh /readiness.sh
COPY entry_point.sh /usr/local/bin/
RUN ln -s /usr/local/bin/entry_point.sh /entry_point.sh
ENTRYPOINT ["entry_point.sh"]
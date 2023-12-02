FROM debian:bookworm
RUN apt update -y && \
	apt upgrade -y && \
	apt install mariadb-server -y

COPY ./requirements/mariadb/conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./requirements/mariadb/tools/setup.sh /tmp/mariadb/setup.sh

RUN chmod +x /tmp/mariadb/setup.sh

EXPOSE 3306

ENTRYPOINT ["/tmp/mariadb/setup.sh"]
CMD ["mysqld"]
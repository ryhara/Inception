FROM debian:bullseye
RUN apt update -y && \
	apt upgrade -y && \
	apt install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/setup.sh /tmp/mariadb/setup.sh

RUN chmod +x /tmp/mariadb/setup.sh

# CMD 起動時に実行するコマンドを指定する
CMD sh /tmp/mariadb/setup.sh
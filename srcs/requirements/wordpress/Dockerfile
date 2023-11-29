FROM debian:bullseye

RUN apt update -y && \
	apt upgrade -y
	# apt install

# COPY ./my-wordpress.cnf /etc/mysql/my-wordpress.cnf

COPY ./tools/setup.sh /tmp/wordpress/setup.sh

RUN chmod +x /tmp/wordpress/setup.sh

EXPOSE 9000

ENTRYPOINT ["/tmp/wordpress/setup.sh"]


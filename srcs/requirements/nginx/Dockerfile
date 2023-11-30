FROM debian:bookworm

RUN apt update -y && \
	apt upgrade -y && \
	apt install -y nginx openssl

# COPY ./my-nginx.cnf /etc/nginx/sites-available/my-nginx.conf

CMD echo "nginx"
FROM debian:bullseye

RUN apt update -y && \
	apt upgrade -y && \
	apt install nginx -y

# COPY ./my-nginx.cnf /etc/nginx/sites-available/my-nginx.conf

CMD echo "nginx"
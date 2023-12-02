FROM debian:bookworm

RUN apt update -y && \
	apt upgrade -y && \
	apt install -y nginx openssl curl procps

COPY ./requirements/nginx/conf/default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /etc/nginx/ssl/certs && \
	mkdir -p /etc/nginx/ssl/private

RUN openssl genrsa -out /etc/nginx/ssl/private/inception.key 2048 && \
	openssl req -new -key /etc/nginx/ssl/private/inception.key -out /etc/nginx/ssl/certs/inception.csr -subj "/C=JP/ST=Tokyo/L=Minato-ku/O=42Tokyo/OU=42cursus/CN=ryhara.42.fr" && \
	openssl x509 -req -days 365 -signkey /etc/nginx/ssl/private/inception.key -in /etc/nginx/ssl/certs/inception.csr -out /etc/nginx/ssl/certs/inception.crt

RUN chown -R www-data:www-data /var/www/html && \
	chmod -R 755 /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
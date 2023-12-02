FROM debian:bookworm

RUN apt update -y &&\
	apt upgrade -y &&\
	apt install -y php8.2 wget

# RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php

COPY ./tools/adminer-4.8.1.php /var/www/html/adminer.php

RUN	chown -R www-data:www-data /var/www/html/adminer.php && \
	chmod 755 /var/www/html/adminer.php

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html/"]



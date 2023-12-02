FROM debian:bookworm

RUN apt update -y &&\
	apt upgrade -y &&\
	apt install -y php8.2 php8.2-mysql wget

# RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php

COPY  ./requirements/bonus/adminer/tools/adminer-4.8.1.php /tmp/

RUN mv /tmp/adminer-4.8.1.php /var/www/html/adminer.php && \
	chown -R www-data:www-data /var/www/html/adminer.php && \
	chmod 755 /var/www/html/adminer.php

EXPOSE 443

CMD ["php", "-S", "0.0.0.0:443", "-t", "/var/www/html/"]



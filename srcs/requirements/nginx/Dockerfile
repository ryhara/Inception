FROM debian:latest

RUN apt update -y && \
	apt upgrade -y && \
	apt install nginx -y

COPY source dest

CMD [ "executable" ]
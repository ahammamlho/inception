FROM debian:bullseye

RUN apt update
RUN apt install nginx -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -newkey rsa:2048 -nodes \
    -out /etc/nginx/ssl/inception_crt.crt \
    -keyout /etc/nginx/ssl/inception_key.key \
    -subj "/C=MA/ST=IDF/L=KHOURIBGA/O=42/OU=42/CN=lahammam.42.fr/UID=lahammam"

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]

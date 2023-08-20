FROM debian:bullseye


RUN apt update && \
    apt install curl -y && \
    apt install -y mariadb-client && \
    apt install  php-mysql -y && \
    apt install php-fpm -y


COPY ./conf/script.sh /

RUN chmod +x ./script.sh

EXPOSE 9000

CMD ["/script.sh"]




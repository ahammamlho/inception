FROM debian:buster


RUN apt update && \
    apt install curl -y && \
    apt install -y mariadb-client && \
    apt install  php-mysql -y && \
    apt install php-fpm -y && \
    apt remove apache2 -y

COPY ./conf/script.sh /
# COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod +x ./script.sh


EXPOSE 9000

CMD ["/script.sh"]




FROM debian:buster

RUN /etc/init.d/apache2 stop
RUN apt update && \
    apt install curl -y && \
    apt install -y mariadb-client && \
    apt install  php-mysql -y && \
    apt install php-fpm -y

COPY ./conf/script.sh /
# COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod +x ./script.sh

# sudo /etc/init.d/apache2 restarti

EXPOSE 9000

CMD ["/script.sh"]




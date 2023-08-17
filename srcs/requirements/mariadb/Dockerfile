FROM debian:buster

RUN apt update && \
    apt install mariadb-server -y


COPY ./conf/script.sh /
RUN chmod +x ./script.sh

EXPOSE 3306

CMD ["/script.sh"]

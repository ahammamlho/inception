FROM debian:bullseye

RUN apt update && \
    apt upgrade -y && \
    apt install mariadb-server -y 


COPY ./conf/script.sh /
RUN chmod +x ./script.sh

EXPOSE 3306


ENTRYPOINT ["/script.sh"]

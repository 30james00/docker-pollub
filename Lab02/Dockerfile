FROM ubuntu

LABEL maintainer="30james00 48206982+30james00@users.noreply.github.com"

ENV APACHE_RUN_USER=www-data \
APACHE_RUN_GROUP=www-data \
APACHE_LOCK_DIR=/var/lock/apache2 \
APACHE_LOG_DIR=/var/log/apache2 \
APACHE_PID_FILE=/var/run/apache2/apache2.pid \
APACHE_SERVER_NAME=localhost \
APACHE_PORT=8080

RUN apt update && apt upgrade && \
DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends apache2 && \
rm -rf /var/lib/apt/lists/* && \
apache2 -v 

COPY apache-conf /etc/apache2/apache2.conf

EXPOSE ${APACHE_PORT}

ENTRYPOINT ["apache2ctl"]
CMD ["-D", "FOREGROUND"]
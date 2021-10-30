FROM scratch

LABEL author="30james00 48206982+30james00@users.noreply.github.com"

ENV PHPVERSION=7

# https://alpinelinux.org/downloads/
ADD alpine-minirootfs-3.14.2-x86_64.tar.gz /

RUN apk add --update apache2 php${PHPVERSION}-apache2 php${PHPVERSION} && \
  rm -rf /var/cahce/apk/* && \
  #mkdir /run/apache2/ && \
  rm -rf /var/www/localhost/htdocs/index.html && \
  echo "<?php phpinfo(); ?>" > /var/www/localhost/htdocs/index.php && \
  chmod 755 /var/www/localhost/htdocs/index.php

EXPOSE 80/tcp

ENTRYPOINT [ "httpd" ]
CMD ["-D", "FOREGROUND"]
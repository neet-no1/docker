FROM wordpress

RUN apt -y update && apt -y upgrade
RUN apt -y install git

RUN a2enmod ssl

COPY resources/conf/apache2.conf /etc/apache2/
COPY resources/conf/000-default.conf /etc/apache2/sites-available/
COPY resources/conf/ssl.conf /etc/apache2/mods-available/
COPY resources/conf/custom.ini /usr/local/etc/php/conf.d/custom.ini



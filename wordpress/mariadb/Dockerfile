FROM mariadb

ENV MYSQL_ROOT_PASSWORD root123

COPY resources/scripts/db_setup.sh /usr/bin/

RUN chmod a+x /usr/bin/db_setup.sh; :
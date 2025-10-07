FROM mysql:9.4.0

COPY database/init.sql /docker-entrypoint-initdb.d/1.sql
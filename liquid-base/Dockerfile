FROM ubuntu
MAINTAINER Juan José Orjuela <j.j.o.c007@gmail.com>


RUN apt-get update && apt-get upgrade && apt-get -y install zip git vim postgresql-9.5 postgresql-client-9.5 postgresql-contrib-9.5

RUN mkdir /var/liquidbase
RUN wget https://github.com/liquibase/liquibase/releases/download/liquibase-parent-3.5.1/liquibase-3.5.1-bin.zip && unzip liquibase-3.5.1-bin.zip /var/liquidbase 


USER postgres

RUN /etc/init.d/postgresql start && psql --command "ALTER USER postgres PASSWORD '123456';" &&  createdb -O postgres OAS-API
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.5/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.5/main/postgresql.conf

EXPOSE 5432

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["/usr/lib/postgresql/9.5/bin/postgres", "-D", "/var/lib/postgresql/9.5/main", "-c", "config_file=/etc/postgresql/9.5/main/postgresql.conf"]

USER root

RUN /etc/init.d/postgresql start

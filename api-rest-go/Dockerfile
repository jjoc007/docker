FROM ubuntu
MAINTAINER Juan José Orjuela <j.j.o.c007@gmail.com>

RUN mkdir /var/go && mkdir /var/go/src && mkdir /var/backupDB

ADD gestion_parametros.sql /var/backupDB/

RUN apt-get update && apt-get -y install golang git vim postgresql-9.5 postgresql-client-9.5 postgresql-contrib-9.5

USER postgres

RUN    /etc/init.d/postgresql start && psql --command "ALTER USER postgres PASSWORD '123456';" &&  createdb -O postgres OAS-API && psql OAS-API-R < gestion_parametros.sql
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.5/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.5/main/postgresql.conf

EXPOSE 5432

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["/usr/lib/postgresql/9.5/bin/postgres", "-D", "/var/lib/postgresql/9.5/main", "-c", "config_file=/etc/postgresql/9.5/main/postgresql.conf"]

USER root

ENV GOPATH /var/go

RUN git clone https://github.com/udistrital/titan.git /var/go/src

RUN go get -u github.com/gin-gonic/gin
RUN go get gopkg.in/gorp.v1
RUN go get github.com/fvbock/endless
RUN go get github.com/appleboy/gin-jwt
RUN go get github.com/lib/pq


EXPOSE 8000

CMD go run /var/go/src/main.go

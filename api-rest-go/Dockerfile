FROM ubuntu
MAINTAINER Juan José Orjuela <j.j.o.c007@gmail.com>

RUN apt-get update && apt-get -y install golang git vim postgresql postgresql-contrib
RUN mkdir /var/go && mkdir /var/go/src && mkdir /var/backupDB

ADD backupDB.backup /var/backupDB/

RUN service postgresql start

RUN su -c "psql" - postgres &&  alter user postgres password '123456'; && \q
RUN createdb OAS-API -h localhost -U postgres --password 123456 --port 5432 && 123456
RUN pg_restore -h localhost -p 5432 -U postgres -d OAS-API -W -v "/var/backupDB/backupDB.backup" && 123456

ENV GOPATH /var/go

RUN git clone https://github.com/jjoc007/API-Rest-Go.git /var/go

RUN go get github.com/gin-gonic/gin
RUN go get gopkg.in/gorp.v1
RUN go get github.com/fvbock/endless
RUN go get github.com/appleboy/gin-jwt
RUN go get github.com/lib/pq

RUN go run /var/go/src/main.go

EXPOSE 8000
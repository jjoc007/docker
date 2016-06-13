FROM ubuntu
MAINTAINER Juan José Orjuela <j.j.o.c007@gmail.com>

RUN apt-get update && apt-get -y install golang git vim postgresql postgresql-contrib
RUN mkdir /var/go && mkdir /var/go/src && mkdir /var/backupDB

ADD backupDB.backup /var/backupDB/
RUN createdb OAS-API -h localhost -U postgres --port 5432
RUN pg_restore -h localhost -p 5432 -U postgres -d OAS-API -v "/var/backupDB/backupDB.backup"

ENV GOPATH /var/go

RUN git clone https://github.com/jjoc007/API-Rest-Go.git /var/go

RUN go get github.com/gin-gonic/gin
RUN go get gopkg.in/gorp.v1
RUN go get github.com/fvbock/endless


RUN go run /var/go/src/main.go

EXPOSE 8000
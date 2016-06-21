FROM ubuntu
MAINTAINER Juan José Orjuela <j.j.o.c007@gmail.com>

RUN mkdir /var/go && mkdir /var/go/src && mkdir /var/backupDB

ADD gestion_parametros.sql /var/backupDB/

RUN apt-get update && apt-get -y install golang git vim 

USER root

ENV GOPATH /var/go

RUN git clone https://github.com/udistrital/titan.git /var/go/src
RUN go get -u github.com/gin-gonic/gin && go get gopkg.in/gorp.v1 && go get github.com/fvbock/endless && go get github.com/appleboy/gin-jwt && go get github.com/lib/pq

EXPOSE 8000

CMD go run /var/go/src/main.go

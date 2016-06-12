FROM ubuntu
MAINTAINER Juan José Orjuela <j.j.o.c007@gmail.com>

RUN apt-get update && apt-get -y install golang git vim postgresql postgresql-contrib
RUN mkdir /var/go

ENV GOPATH /var/go

RUN git clone https://github.com/jjoc007/API-Rest-Go.git /var/go

RUN go get github.com/gin-gonic/gin
RUN go get gopkg.in/gorp.v1


RUN go run /var/go/main.go

EXPOSE 8000
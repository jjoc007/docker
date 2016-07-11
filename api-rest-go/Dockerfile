FROM ubuntu
MAINTAINER Juan José Orjuela <j.j.o.c007@gmail.com>

RUN mkdir /var/go && mkdir /var/go/src && mkdir /var/backupDB

RUN apt-get update && apt-get -y install golang git vim 

USER root

ENV GOPATH /var/go

RUN git clone https://github.com/udistrital/titan.git /var/go/src
RUN go get github.com/astaxie/beego && go get github.com/beego/bee

RUN export PATH=/var/go/bin:$PATH 

EXPOSE 8000

RUN cd /var/go/src/

CMD bee run -downdoc=true -gendoc=true



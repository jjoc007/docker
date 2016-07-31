FROM ubuntu
MAINTAINER Juan José Orjuela <j.j.o.c007@gmail.com>

RUN mkdir /var/go && mkdir /var/go/src

RUN apt-get update && apt-get -y install golang git vim 

USER root

ENV GOPATH /var/go

RUN git clone https://github.com/jjoc007/nodocentralconfig.git /var/go/src/confignodoapi
RUN go get github.com/astaxie/beego && go get github.com/beego/bee && go get github.com/dgrijalva/jwt-go

EXPOSE 8081

ENV PATH $PATH:/var/go/bin

RUN cd /var/go/src/confignodoapi/

CMD bee run -downdoc=true -gendoc=true
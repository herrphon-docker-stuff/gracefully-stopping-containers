FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update  \
 && apt-get -y upgrade  \
 && apt-get install -y psmisc  \
                       build-essential \
                       curl unzip \
                       git golang-go \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir /golang
ENV GOPATH /golang
ENV PATH $PATH:$GOPATH/bin
ADD app.c /
RUN gcc -o app app.c

RUN go get github.com/bytegust/spm/cmd/spm

COPY Procfile /

CMD  ["goreman", "start"]


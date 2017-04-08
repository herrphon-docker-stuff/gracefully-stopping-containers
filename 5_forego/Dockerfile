FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update  \
 && apt-get -y upgrade  \
 && apt-get install -y psmisc  \
                       build-essential \
 && rm -rf /var/lib/apt/lists/*

ADD https://github.com/jwilder/forego/releases/download/v0.16.1/forego /usr/local/bin/forego
RUN chmod u+x /usr/local/bin/forego 

ADD app.c /
RUN gcc -o app app.c

COPY     Procfile /

CMD  ["forego", "start"]


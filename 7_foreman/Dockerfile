FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update  \
 && apt-get -y upgrade  \
 && apt-get install -y psmisc  \
                       build-essential \
                       ruby \
 && rm -rf /var/lib/apt/lists/*

RUN gem install foreman

ADD app.c /
RUN gcc -o app app.c

COPY Procfile /

CMD  ["foreman", "start"]


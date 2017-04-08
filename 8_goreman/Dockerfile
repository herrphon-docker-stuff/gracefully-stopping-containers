FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update  \
 && apt-get -y upgrade  \
 && apt-get install -y psmisc  \
                       build-essential \
                       curl unzip \
 && rm -rf /var/lib/apt/lists/*

# goreman supervisor install latest
RUN GITHUB_REPO="https://github.com/mattn/goreman" \
  && LATEST=`curl -s  $GITHUB_REPO"/releases/latest" | grep -Eo "v[0-9]*.[0-9]*.[0-9]*"` \
  && curl -L $GITHUB_REPO"/releases/download/"$LATEST"/goreman_linux_amd64.zip" > goreman.zip \
  && unzip goreman.zip && mv /goreman /usr/local/bin/goreman && rm -R goreman*


ADD app.c /
RUN gcc -o app app.c

COPY Procfile /

CMD  ["goreman", "start"]


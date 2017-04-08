FROM ubuntu


RUN apt-get update \
 && apt-get install -y build-essential 


ADD app.c /
RUN gcc -o app app.c

ADD starter.sh /

CMD ["/starter.sh"]


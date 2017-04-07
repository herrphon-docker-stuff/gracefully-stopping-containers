#!/bin/bash -xe

docker build -t loop .

ID=$(docker run -d loop)

docker stop $ID

echo "Exit status should (and also is) 0:"
docker inspect -f '{{.State.ExitCode}}' $ID

docker rm $ID

ID=$(docker run -d loop)

docker exec $ID ps -ef

docker rm -f $ID



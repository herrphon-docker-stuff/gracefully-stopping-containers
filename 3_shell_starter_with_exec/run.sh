#!/bin/bash -xe

docker build -t asdf .

ID=$(docker run -d asdf)

sleep 5

docker stop $ID

echo "Exit status should (and also is) 0:"
docker inspect -f '{{.State.ExitCode}}' $ID

docker rm $ID



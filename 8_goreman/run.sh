#!/bin/bash -xe

docker build -t asdf .

ID=$(docker run -d asdf)

sleep 12
docker kill --signal=SIGTERM $ID

docker logs -f $ID

echo "Exit status should be 0: $(docker inspect -f '{{.State.ExitCode}}' $ID)"
docker rm $ID



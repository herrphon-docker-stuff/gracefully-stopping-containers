#!/bin/bash 

_term() { 
  echo "Caught SIGTERM signal!" 
  kill -TERM "$child" 2>/dev/null
}

trap _term SIGTERM

echo "Doing some initial work...";
/bin/start/main/server --nodaemon &

child=$! 
wait "$child"



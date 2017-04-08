#!/bin/bash -xe


JAVA_EXECUTABLE="/app"
JAVA_ARGS=""

trap 'kill -SIGTERM $PID' SIGINT SIGTERM 
$JAVA_EXECUTABLE $JAVA_ARGS &
PID=$!

ps -aufx

wait $PID
# trap - TERM INT
ps -aufx
wait $PID
EXIT_STATUS=$?

ps -aufx
echo $EXIT_STATUS
exit 0
 

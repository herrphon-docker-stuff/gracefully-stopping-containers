
## Trapping signals in Docker
[Example](https://github.com/gchudnov/docker-tools/tree/master/signals)

* `/foreground` -- Application is the main process in the container (PID1)
* `/background` -- Application is the background process in the container (!= PID1)

```shell
# Building the image
$ ./build.sh
- `docker build -t <NAME> .`

# Running the container
$ ./run.sh
- `docker run -it --rm -p 3000:3000 --name="<NAME>" <NAME>`

# Sending signals
* SIGUSR1
$ ./sig-usr1.sh
- `docker kill --signal="SIGUSR1" <NAME>`

* SIGTERM
$ ./sig-term.sh
- `docker kill --signal="SIGTERM" <NAME>`
```

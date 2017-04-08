#include <signal.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
 
volatile sig_atomic_t done = 0;
 
void term(int signum)
{
    done = 1;
}


int main(int argc, char *argv[])
{
    struct sigaction action;
    memset(&action, 0, sizeof(struct sigaction));
    action.sa_handler = term;
    sigaction(SIGTERM, &action, NULL);

    fprintf(stderr, "hello world\n");

    int loop = 0;
    while (!done)
    {
        int t = sleep(5);
        /* sleep returns the number of seconds left if *
         * interrupted */
        while (t > 0)
        {
            fprintf(stderr, "Loop run was interrupted with %d sec to go, finishing...\n", t);
            t = sleep(t);
        }
        fprintf(stderr, "Finished loop run %d.\n", loop++);
    }

    fprintf(stderr, "done.\n");
    return 0;
}




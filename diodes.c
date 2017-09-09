#include <stdio.h>
#include <sys/io.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main(){
    int ret;
    ret = ioperm(0x60, 0xf, 1);
    if (ret < 0) {
            perror("ioperm");
            return 1;
    }
	ret = 0;
	if (fork()!=0)
		wait(&ret);
	else 
		execl("tutorial32.exe",0);
	printf("parent: out, child: %d\n", ret);
    ioperm(0x60, 0xf, 0);
    return 0;
}

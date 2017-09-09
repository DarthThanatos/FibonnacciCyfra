#include <stdio.h>
#include <sys/io.h>
#include <unistd.h>
#include <stdbool.h>


int main(){
	printf ("child\n");
	for (int i = 0; i< 3; i++){
        while (inb(0x64) & 0x2);
        outb(0xed, 0x60);
        while (inb(0x64) & 0x2);
        outb(0x04, 0x60);
        printf("CAPSLOCK ON\n");
        sleep(1);
        while (inb(0x64) & 0x2);
        outb(0xed, 0x60);
        while (inb(0x64) & 0x2);
        outb(0x00, 0x60);
        printf("CAPSLOCK OFF\n");
        sleep(1);
    } 
	_exit(15);
}
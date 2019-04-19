#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>


void print_pilha(unsigned int pid) {
	int a = 3;
	unsigned int *p = NULL;
	if (pid == 0) {
		a = 5;
		p = malloc(3102);
	} else {
		p = calloc(1, 312);
	}
	printf("pid = %u, a = %d, pilha em endereço %p e heap em %p, igual a %u sizeof p = %d\n", pid, a, &p, p, (unsigned int) *p, sizeof(p));
}

int main() {
	int *p = malloc(sizeof(int));
	*p = 42;
	unsigned int pid = fork();
	if (pid == 0) {
		*p = 12;
	}
	print_pilha(pid);
	printf("%u -> *p = %d\n", pid, *p);
	return 0;
}

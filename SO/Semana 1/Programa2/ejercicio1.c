#include <stdio.h>
#include <malloc.h>

void main() {
	int i;
	int *v;
	v = (int*) malloc (10*sizeof(int));
	
	for (i=0;i<=10;i++)
		v[i]=i*2;
		
	for(i=0;i<10;i++) printf("%d", v[i]);
}
